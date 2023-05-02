unit UGerarParcelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.DBCtrls, DateUtils, Vcl.Mask;

type
  TdbGridPadrao = class(TDBGrid);
  TfrmGerarParcelas = class(TForm)
    qryParcelas: TFDQuery;
    dsParcelas: TDataSource;
    tcParcelas: TFDTransaction;
    qryFormaPgto: TFDQuery;
    dsFormaPgto: TDataSource;
    qryFormaPgtoFORMAID: TIntegerField;
    qryFormaPgtoDESCRICAO: TStringField;
    painelTopo: TPanel;
    PainelCentro: TPanel;
    PainelRodape: TPanel;
    gridGerarParcela: TDBGrid;
    PainelGerarParcelas: TPanel;
    dbLookupFormaPgto: TDBLookupComboBox;
    labelQtdeParcelas: TLabel;
    labelDataParcela: TLabel;
    dateDataParcela: TDateTimePicker;
    editQtdeParcelas: TEdit;
    labelFormaDePagamento: TLabel;
    qryParcelasPARCELAID: TFDAutoIncField;
    qryParcelasVENDAID: TIntegerField;
    qryParcelasFORMA_PGTO_ID: TIntegerField;
    qryParcelasSTATUS: TStringField;
    qryParcelasQTDE_PARCELAS: TIntegerField;
    qryParcelasVALOR_TOTAL_NF: TFMTBCDField;
    qryParcelasVALOR_PARCELA: TFMTBCDField;
    qryParcelasDATA_PARCELA: TDateField;
    qryParcelasVOLUME_VENDA_TOTAL: TFMTBCDField;
    qryParcelasVOLUME_PARCELADO: TFMTBCDField;
    qryParcelasDOCUMENTO: TStringField;
    qryParcelasVOLUME_RESTANTE: TFMTBCDField;
    qryParcelasNF: TIntegerField;
    qryParcelasEMISSAO_NF: TDateField;
    qryParcelasACESSO: TStringField;
    qryParcelasPARCELA: TStringField;
    qryParcelasDATA_PGTO_PARCELA: TDateField;
    qryParcelasFORMAID: TIntegerField;
    qryParcelasDESCRICAO: TStringField;
    qryParcelasHABILITAR_PARCELA: TStringField;
    labelTituloGerarParcela: TLabel;
    Image1: TImage;
    painelBotoes: TPanel;
    painelBtnAdicionar: TPanel;
    btnConfirmarParcelamento: TSpeedButton;
    painelFundobtn: TPanel;
    painelEditarParcelas: TPanel;
    btnEditarParcelas: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnConfirmarParcelamentoClick(Sender: TObject);
    procedure btnCancelarEdicaoClick(Sender: TObject);
    procedure gridGerarParcelaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure dateDataParcelaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dateDataParcelaKeyPress(Sender: TObject; var Key: Char);
    procedure btnEditarParcelasClick(Sender: TObject);
    procedure editQtdeParcelasKeyPress(Sender: TObject; var Key: Char);
    procedure dbLookupFormaPgtoKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    procedure IniciarParcelamento;
    procedure CommitRollbackRetaining;
    procedure TornarPainelGerarParcelaVISIVEL;
    procedure definirTamanhoDaLinhaDaGrid;

  public
    { Public declarations }

  end;

var
  frmGerarParcelas: TfrmGerarParcelas;

implementation

{$R *.dfm}

uses UVendaPosto, UPrincipalPetrotorque, UEditarParcelas;

procedure TfrmGerarParcelas.btnCancelarEdicaoClick(Sender: TObject);
begin
  qryParcelas.Cancel;

end;

procedure TfrmGerarParcelas.btnConfirmarParcelamentoClick(Sender: TObject);
begin
    if editQtdeParcelas.Text <> '' then
      begin
           frmVendaPostos.ParcelasGeradas := 'OK';
           IniciarParcelamento;
           TornarPainelGerarParcelaVISIVEL;
         if qryParcelas.RecordCount > 0 then
            painelBtnAdicionar.Visible := False;
      end
      else
      ShowMessage('Informe a quantidade de parcelas');

end;

procedure TfrmGerarParcelas.btnEditarParcelasClick(Sender: TObject);
begin
  try
    Application.CreateForm( TfrmEditarParcelas, frmEditarParcelas );
    frmEditarParcelas.ShowModal;
    qryParcelas.Close;
    qryParcelas.Open();
  finally
    FreeAndNil( frmEditarParcelas );
  end;
end;

procedure TfrmGerarParcelas.CommitRollbackRetaining;
begin
  try
    tcParcelas.CommitRetaining;
  except
     tcParcelas.RollbackRetaining;
  end;

  qryParcelas.Close;
  qryParcelas.Open();

end;

procedure TfrmGerarParcelas.dateDataParcelaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if Key = VK_RETURN then
     btnConfirmarParcelamento.Click;
end;

procedure TfrmGerarParcelas.dateDataParcelaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
      Key := #0;
end;

procedure TfrmGerarParcelas.dbLookupFormaPgtoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
   begin
      editQtdeParcelas.SetFocus;
      Key := #0;
   end;
end;

procedure TfrmGerarParcelas.definirTamanhoDaLinhaDaGrid;
begin
  //Define o tamanho de cada linha do DBgrid ap�s ativar a QUERY
  TdbGridPadrao(gridGerarParcela).DefaultRowHeight := 25;
  TdbGridPadrao(gridGerarParcela).ClientHeight := ( 25 * TdbGridPadrao(gridGerarParcela).RowCount ) + 25;

end;

procedure TfrmGerarParcelas.editQtdeParcelasKeyPress(Sender: TObject;
  var Key: Char);
begin
   if ((key in ['0'..'9'] = false) and (word(key) <> vk_back)) then
   begin
     dateDataParcela.SetFocus;
     key := #0;
   end;
end;

procedure TfrmGerarParcelas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin


  qryFormaPgto.Close;
  qryParcelas.Close;
end;

procedure TfrmGerarParcelas.FormShow(Sender: TObject);


begin
  qryFormaPgto.Open();

  qryParcelas.ParamByName('vendaid').AsInteger := frmVendaPostos.qryVendaPosto['VENDAID'];
  qryParcelas.Open();

  dateDataParcela.Date := Date;

  TornarPainelGerarParcelaVISIVEL;
  definirTamanhoDaLinhaDaGrid;

  if qryParcelas.RecordCount > 0 then
     painelBtnAdicionar.Visible := False;

end;

procedure TfrmGerarParcelas.gridGerarParcelaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

    //zebrando o dbgrid
    if Odd(gridGerarParcela.DataSource.DataSet.RecNo) then
        gridGerarParcela.Canvas.Brush.Color := $00CFCFCF
       else
          gridGerarParcela.Canvas.Brush.Color := clWhite;


    //mudando a cor da sele��o
    if ( gdSelected in State ) then
         begin
            gridGerarParcela.Canvas.Brush.Color := $00BC7B50;
             gridGerarParcela.Canvas.Font.Color := clWhite;
              gridGerarParcela.Canvas.Font.Style := [fsBold];
         end;



        gridGerarParcela.Canvas.FillRect( Rect );
        gridGerarParcela.DefaultDrawColumnCell( Rect, DataCol, Column, State );


   //  mudando a posi��o e alinhamento vertical do texto de cada linha
     gridGerarParcela.Canvas.TextRect(Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText);
end;

procedure TfrmGerarParcelas.IniciarParcelamento;
var
  I, qtdParcelas : Integer;
  TotalNF, ValorParcela, VolumeParcelado, VolumeTotal : Double;
  DataParcela : TDate;

 begin
       qtdParcelas := 0;    TotalNF := 0;     ValorParcela := 0;    VolumeParcelado := 0;    VolumeTotal  := 0;
       qtdParcelas := StrToInt(editQtdeParcelas.Text);
    if qtdParcelas > 20 then
       qtdParcelas := 20;
       DataParcela := dateDataParcela.Date;

    for I := 1 to qtdParcelas do
       begin
          qryParcelas.Insert;
          qryParcelas['VENDAID'] := frmVendaPostos.qryVendaPosto['VENDAID'];

          qryParcelas['FORMA_PGTO_ID'] := qryFormaPgto['FORMAID'];
          qryParcelas['STATUS'] := 'ABERTO';
          qryParcelas['QTDE_PARCELAS'] := qtdParcelas;
          qryParcelas['PARCELA'] := IntToStr(I) + '/' + IntToStr(qtdParcelas); // registra parcela atual. Ex: "1/3 ... 2/3 e 3/3".
          qryParcelas['VALOR_TOTAL_NF'] := frmVendaPostos.qryVendaPosto['VALOR_NF'];
          qryParcelas['VOLUME_RESTANTE'] := frmVendaPostos.qryVendaPosto['VOLUME'];
          qryParcelas['NF'] := frmVendaPostos.qryVendaPosto['NF'];
          qryParcelas['EMISSAO_NF'] := frmVendaPostos.qryVendaPosto['DATA_EMISSAO_NF'];


          TotalNF := frmVendaPostos.qryVendaPosto['VALOR_NF'];
          ValorParcela := TotalNF / qtdParcelas; // parcela o valor.

          qryParcelas['VALOR_PARCELA'] := ValorParcela;

          qryParcelas['DATA_PARCELA'] := DataParcela;
          DataParcela := IncMonth(DataParcela) ;  //fun��o que incrementa um m�s � parcela.

          qryParcelas['VOLUME_VENDA_TOTAL'] := frmVendaPostos.qryVendaPosto['VOLUME'];

          VolumeTotal := frmVendaPostos.qryVendaPosto['VOLUME'];
          VolumeParcelado := VolumeTotal / qtdParcelas;  // parcela o volume.


          qryParcelas['VOLUME_PARCELADO'] := VolumeParcelado;
          qryParcelas['ACESSO'] := 'PERMITIDO';
          qryParcelas['DOCUMENTO'] := '0';

          qryParcelas.Post;

       end;

      CommitRollbackRetaining;


      definirTamanhoDaLinhaDaGrid;

 end;

procedure TfrmGerarParcelas.TornarPainelGerarParcelaVISIVEL;
begin
    if qryParcelas.RecordCount > 0 then
     begin
        PainelGerarParcelas.Visible := False;
        qryParcelas.Cancel;
     end
    else
     PainelGerarParcelas.Visible := True;
end;

end.
