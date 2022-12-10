unit UMovimentoEstoqueUsina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  frxClass, frxDBSet;

type
  TdbGridPadrao = class(TDBGrid);
  TfrmMovimentoEstoqueUsina = class(TForm)
    PainelTOPO: TPanel;
    labelTitulo: TLabel;
    PainelCentral: TPanel;
    gridMovimento: TDBGrid;
    memoMotivo: TDBMemo;
    qryMovimento: TFDQuery;
    dsMovimento: TDataSource;
    qryMovimentoMOVIMENTOID: TIntegerField;
    qryMovimentoCODPRODUTO: TIntegerField;
    qryMovimentoCODESTOQUEUSINA: TIntegerField;
    qryMovimentoCODUSINA: TIntegerField;
    qryMovimentoDATA: TDateField;
    qryMovimentoTIPO: TStringField;
    qryMovimentoVOLUME: TFMTBCDField;
    qryMovimentoVALOR: TFMTBCDField;
    qryMovimentoMOTIVO: TStringField;
    qryMovimentoPRODUTOID: TIntegerField;
    qryMovimentoPRODUTO: TStringField;
    qryMovimentoESTOQUEID: TIntegerField;
    qryMovimentoESTOQUE: TFMTBCDField;
    qryMovimentoUSINAID: TIntegerField;
    qryMovimentoNOME_FANTASIA: TStringField;
    gbEdits: TGroupBox;
    qryUsina: TFDQuery;
    qryUsinaUSINAID: TFDAutoIncField;
    qryUsinaRAZAO_SOCIAL: TStringField;
    qryUsinaNOME_FANTASIA: TStringField;
    qryUsinaENDERECO: TStringField;
    qryUsinaBAIRRO: TStringField;
    qryUsinaCIDADE: TStringField;
    qryUsinaUF: TStringField;
    qryUsinaTELEFONE: TStringField;
    dsUsina: TDataSource;
    qryEstoqueUsina: TFDQuery;
    qryEstoqueUsinaESTOQUEID: TFDAutoIncField;
    qryEstoqueUsinaUSINAID: TIntegerField;
    qryEstoqueUsinaPRODUTOID: TIntegerField;
    qryEstoqueUsinaESTOQUE: TFMTBCDField;
    dsEstoqueUsina: TDataSource;
    dsProduto: TDataSource;
    qryProduto: TFDQuery;
    qryProdutoPRODUTOID: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    Label1: TLabel;
    editFornecedor: TEdit;
    ImgPrincipal: TImage;
    labelDe: TLabel;
    DateVencimentoDE: TMaskEdit;
    labelATE: TLabel;
    DateVencimentoATE: TMaskEdit;
    painelFundobtn: TPanel;
    PainelConsultar: TPanel;
    btnConsultar: TSpeedButton;
    qryMovimentoESTOQUE_ANTERIOR: TFMTBCDField;
    painelBotoes: TPanel;
    painelImprimirParcelaStatus: TPanel;
    btnPagarParcelaStatus: TSpeedButton;
    reportMovimento: TfrxReport;
    dbReportMovimento: TfrxDBDataset;
    qryMovimentoREPRESENTANTEID: TIntegerField;
    qryEstoqueUsinaREPRESENTANTEID: TIntegerField;
    qryRepresentante: TFDQuery;
    qryRepresentanteREPRESENTANTEID: TIntegerField;
    qryRepresentanteNOME: TStringField;
    qryRepresentanteCIDADE: TStringField;
    qryRepresentanteCNPJ: TStringField;
    dsRepresentante: TDataSource;
    labelRepresentante: TLabel;
    editRepresentante: TEdit;
    qryMovimentoNOME: TStringField;
    procedure gridMovimentoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConsultarClick(Sender: TObject);
    procedure editFornecedorKeyPress(Sender: TObject; var Key: Char);
    procedure editFornecedorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPagarParcelaStatusClick(Sender: TObject);
    procedure editRepresentanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editRepresentanteKeyPress(Sender: TObject; var Key: Char);
    procedure DateVencimentoATEKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DateVencimentoATEKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    procedure definirTamanhoDaLinhaDaGrid;


  public
    { Public declarations }
  end;

var
  frmMovimentoEstoqueUsina: TfrmMovimentoEstoqueUsina;

implementation

{$R *.dfm}

uses UCompraUsina, UpagarParcelas, UPrincipalPetrotorque, UReverterPagamentos,
  UselecionarUsinaEproduto, URepresentante;


procedure TfrmMovimentoEstoqueUsina.btnConsultarClick(Sender: TObject);
begin
    with qryMovimento do
      begin
        Close;
        ParamByName('usina').AsInteger          := qryUsina['USINAID'];
        ParamByName('produto').AsInteger        := qryProduto['PRODUTOID'];
        ParamByName('representante').AsInteger  := qryRepresentante['REPRESENTANTEID'];
        ParamByName('de').AsDate                := StrToDate(DateVencimentoDE.Text);
        ParamByName('ate').AsDate               := StrToDate(DateVencimentoATE.Text);
        Open();
      end;
 definirTamanhoDaLinhaDaGrid;
end;

procedure TfrmMovimentoEstoqueUsina.btnPagarParcelaStatusClick(Sender: TObject);
  var caminhorelatorio : string;
begin

         caminhoRelatorio := ExtractFilePath(Application.ExeName);
         reportMovimento.LoadFromFile(caminhoRelatorio +'RelMovimentoEstoque.fr3');
         reportMovimento.Variables['InicioMes']     :=  QuotedStr( DateVencimentoDE.Text );
         reportMovimento.Variables['FimMes']        :=  QuotedStr( DateVencimentoATE.Text );
         reportMovimento.ShowReport();
end;

procedure TfrmMovimentoEstoqueUsina.DateVencimentoATEKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
     btnConsultar.Click;
end;

procedure TfrmMovimentoEstoqueUsina.DateVencimentoATEKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     Key:= #0;
end;

procedure TfrmMovimentoEstoqueUsina.definirTamanhoDaLinhaDaGrid;
begin

  //Define o tamanho de cada linha do DBgrid ap�s ativar a QUERY
  TdbGridPadrao(gridMovimento).DefaultRowHeight := 25;
  TdbGridPadrao(gridMovimento).ClientHeight := ( 25 * TdbGridPadrao(gridMovimento).RowCount ) + 25;

end;


procedure TfrmMovimentoEstoqueUsina.editFornecedorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
       begin
         try
           Application.CreateForm( TfrmSelecionarEstoqueProduto, frmSelecionarEstoqueProduto );
           frmSelecionarEstoqueProduto.caminhoEntrega := 'movimento';
           frmSelecionarEstoqueProduto.ShowModal;
         finally
           FreeAndNil( frmSelecionarEstoqueProduto );
         end;
       end;
end;

procedure TfrmMovimentoEstoqueUsina.editFornecedorKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
        Key := #0;
end;

procedure TfrmMovimentoEstoqueUsina.editRepresentanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_RETURN then
     begin
          try
            Application.CreateForm(TfrmRepresentante, frmRepresentante);
            frmRepresentante.Caminho := 'movimento';
            frmRepresentante.ShowModal;
          finally
              FreeAndNil(frmRepresentante);
          end;
     end;
end;

procedure TfrmMovimentoEstoqueUsina.editRepresentanteKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
    Key := #0;
end;

procedure TfrmMovimentoEstoqueUsina.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

     qryMovimento.Close;
     qryProduto.Close;
     qryUsina.Close;
     qryEstoqueUsina.Close;
     qryRepresentante.Close;


end;

procedure TfrmMovimentoEstoqueUsina.FormShow(Sender: TObject);
begin

     qryMovimento.Open();
     qryProduto.Open();
     qryUsina.Open();
     qryEstoqueUsina.Open();
     qryRepresentante.Open();


     DateVencimentoDE.Text  := DateToStr(Date);
     DateVencimentoATE.Text := DateToStr(Date);

   definirTamanhoDaLinhaDaGrid;
   editRepresentante.SetFocus;

end;

procedure TfrmMovimentoEstoqueUsina.gridMovimentoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
      //zebrando o dbgrid
    if Odd(gridMovimento.DataSource.DataSet.RecNo) then
        gridMovimento.Canvas.Brush.Color := $00CFCFCF
       else
          gridMovimento.Canvas.Brush.Color := clWhite;


    //mudando a cor da sele��o
    if ( gdSelected in State ) then
         begin
            gridMovimento.Canvas.Brush.Color := $00BC7B50;
             gridMovimento.Canvas.Font.Color := clWhite;
              gridMovimento.Canvas.Font.Style := [fsBold];
         end;



        gridMovimento.Canvas.FillRect( Rect );
        gridMovimento.DefaultDrawColumnCell( Rect, DataCol, Column, State );

           //  mudando a posi��o e alinhamento vertical do texto de cada linha
     gridMovimento.Canvas.TextRect(Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText);
end;

end.
