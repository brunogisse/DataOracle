unit Uposto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, MaskUtils,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.Imaging.pngimage;

type
  TdbGridPadrao = class(TDBGrid);
  TfrmPosto = class(TForm)
    PainelTopo: TPanel;
    gridPosto: TDBGrid;
    qryPosto: TFDQuery;
    dsPosto: TDataSource;
    tcPosto: TFDTransaction;
    qryPostoPOSTOID: TFDAutoIncField;
    qryPostoNOME_FANTASIA: TStringField;
    qryPostoRAZAO_SOCIAL: TStringField;
    qryPostoCNPJ: TStringField;
    gbEdits: TGroupBox;
    labelDestino: TLabel;
    editNomeFantasia: TDBEdit;
    labelCidade: TLabel;
    editRazaoSocial: TDBEdit;
    Label1: TLabel;
    editCNPJ: TDBEdit;
    painelEsquerdo: TPanel;
    gbPesquisaPosto: TGroupBox;
    rbRazaoSocial: TRadioButton;
    rbNomeFantasia: TRadioButton;
    rbCNPJ: TRadioButton;
    editPesquisaPosto: TEdit;
    Panel1: TPanel;
    painelBtnNovo: TPanel;
    btnNovo: TSpeedButton;
    PainelCancelar: TPanel;
    btnCancelar: TSpeedButton;
    painelSalvar: TPanel;
    btnSalvar: TSpeedButton;
    PainelExcluir: TPanel;
    btnExcluir: TSpeedButton;
    painelEditar: TPanel;
    btnEditar: TSpeedButton;
    Image1: TImage;
    Label2: TLabel;
    qryEstado: TFDQuery;
    qryMunicipio: TFDQuery;
    dsEstado: TDataSource;
    dsMunicipio: TDataSource;
    qryEstadoID: TIntegerField;
    qryEstadoCODIGOUF: TIntegerField;
    qryEstadoNOME: TStringField;
    qryEstadoUF: TStringField;
    qryEstadoREGIAO: TIntegerField;
    qryMunicipioID: TIntegerField;
    qryMunicipioNOME: TStringField;
    qryMunicipioESTADO_ID: TIntegerField;
    labelUF: TLabel;
    labelMunicipio: TLabel;
    cbUF: TDBLookupComboBox;
    cbMunicipio: TDBLookupComboBox;
    qryPostoESTADO_ID: TIntegerField;
    qryPostoMUNICIPIO_ID: TIntegerField;
    qryPostoUF: TStringField;
    qryPostoNOME: TStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure editNomeFantasiaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editNomeFantasiaKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure editRazaoSocialKeyPress(Sender: TObject; var Key: Char);
    procedure editCNPJKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridPostoDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure editCNPJEnter(Sender: TObject);
    procedure editPesquisaPostoExit(Sender: TObject);
    procedure rbCNPJClick(Sender: TObject);
    procedure rbNomeFantasiaClick(Sender: TObject);
    procedure rbRazaoSocialClick(Sender: TObject);
    procedure gridPostoDblClick(Sender: TObject);
    procedure editPesquisaPostoChange(Sender: TObject);
    procedure editPesquisaPostoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editPesquisaPostoKeyPress(Sender: TObject; var Key: Char);
    procedure cbUFCloseUp(Sender: TObject);
    procedure dsPostoDataChange(Sender: TObject; Field: TField);
    procedure cbUFExit(Sender: TObject);
  private
    { Private declarations }

    procedure configurarEnables(status : integer);
    procedure mascararCNPJ;
    procedure capturarPosto;
    procedure definirTamanhoDaLinhaDaGrid;
    procedure EfetuarPesquisaOnChange;
    procedure EfetuarPesquisaOnChance;
    procedure salvarRegistro;
    procedure mostrarCidadesMunicipios;
    procedure navegarEstadosMunicipios;
    procedure prepararListaCidades;


  public
    { Public declarations }

    var DuploClickNaGrid : string;

  end;

var
  frmPosto: TfrmPosto;

implementation

{$R *.dfm}

uses UPrincipalPetrotorque, UVendaPosto, URelatorioVendas, UrelatorioCliente;

procedure TfrmPosto.prepararListaCidades;
begin
  cbMunicipio.SetFocus;
  cbMunicipio.DropDown;
  cbMunicipio.KeyValue := cbMunicipio.ListSource.DataSet.FieldByName(cbMunicipio.KeyField).Value;
end;


procedure TfrmPosto.mostrarCidadesMunicipios;
begin
   cbUF.KeyValue := cbUF.ListSource.DataSet.FieldByName(cbUF.KeyField).Value;
   cbMunicipio.KeyValue := cbMunicipio.ListSource.DataSet.FieldByName(cbMunicipio.KeyField).Value;
end;

procedure TfrmPosto.navegarEstadosMunicipios;
begin
  cbUF.KeyValue := qryPosto['ESTADO_ID'];
  cbMunicipio.KeyValue := qryPosto['MUNICIPIO_ID'];
end;

procedure TfrmPosto.salvarRegistro;
  var posicao : Integer;
begin
         posicao := qryPosto['POSTOID'];
         qryPosto['ESTADO_ID']    := qryEstado['ID'];
         qryPosto['MUNICIPIO_ID'] := qryMunicipio['ID'];
         qryPosto.Post;

          try
            tcPosto.CommitRetaining;
          finally
             tcPosto.RollbackRetaining;
          end;

          qryPosto.Close;
          qryPosto.Open();

          qryPosto.Locate('postoid', posicao,[]);
end;

procedure TfrmPosto.definirTamanhoDaLinhaDaGrid;
begin

  //Define o tamanho de cada linha do DBgrid ap�s ativar a QUERY
  TdbGridPadrao(gridPosto).DefaultRowHeight := 25;
  TdbGridPadrao(gridPosto).ClientHeight := ( 25 * TdbGridPadrao(gridPosto).RowCount ) + 25;

end;


procedure TfrmPosto.dsPostoDataChange(Sender: TObject; Field: TField);
begin
  navegarEstadosMunicipios;
end;

procedure TfrmPosto.btnCancelarClick(Sender: TObject);
begin
 configurarEnables(0);
 gbPesquisaPosto.Enabled := True;
 qryPosto.Cancel;
end;

procedure TfrmPosto.btnEditarClick(Sender: TObject);
begin
 configurarEnables(1);
 gbPesquisaPosto.Enabled := False;
 navegarEstadosMunicipios;
 qryPosto.Edit;
end;


procedure TfrmPosto.btnExcluirClick(Sender: TObject);
 var AuxErro : string;
   begin
    configurarEnables(0);
    gbPesquisaPosto.Enabled := True;
      if MessageBox(Application.Handle,'Deseja excluir esse registro?','Confirma��o',MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
           try
              qryPosto.Delete;
             except
            on E : Exception do
             begin
               AuxErro := Copy(E.Message,0,25);
                              MessageDlg('N�o foi poss�vel excluir esse registro. ' + #13
                         + #13 + 'Esse cliente est� sendo referenciado em alguma venda.  ' + #13 + #13
                         + 'Erro T�cnico: '+  AuxErro,TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
             end;
           end;
        end;
   end;



procedure TfrmPosto.btnNovoClick(Sender: TObject);
begin
  configurarEnables(1);
  gbPesquisaPosto.Enabled := False;
  editNomeFantasia.SetFocus;
  editPesquisaPosto.Text := '';
  EfetuarPesquisaOnChange;
  mostrarCidadesMunicipios;
  qryPosto.Insert;
end;



procedure TfrmPosto.btnSalvarClick(Sender: TObject);
begin
  if cbMunicipio.Text <> '' then
    begin
      salvarRegistro;
      configurarEnables(0);
      gbPesquisaPosto.Enabled := True;
    end
     else
      ShowMessage('Verifique os campos vazios');
end;

procedure TfrmPosto.capturarPosto;

begin
 if (qryPosto.RecordCount > 0) and (DuploClickNaGrid = 'ENVIAR') then
     begin
       frmVendaPostos.qryPosto.Refresh;
       frmVendaPostos.editPosto.Text := qryPosto['NOME_FANTASIA'];
       frmVendaPostos.qryPosto.Locate('postoid', qryPosto['POSTOID'], []);
       frmVendaPostos.editVolume.SetFocus;
       DuploClickNaGrid := '';
       Close;
     end;

 if (qryPosto.RecordCount > 0) and (DuploClickNaGrid = 'relatoriofechamento') then
     begin
       frmRelatorioVenda.qryPosto.Refresh;
       frmRelatorioVenda.editCliente.Text := qryPosto['NOME_FANTASIA'];
       frmRelatorioVenda.qryPosto.Locate('postoid', qryPosto['POSTOID'], []);
       DuploClickNaGrid := '';
       Close;
     end;

     if (qryPosto.RecordCount > 0) and (DuploClickNaGrid = 'relatoriocliente') then
     begin
       frmRelatorioClientes.qryCliente.Refresh;
       frmRelatorioClientes.editPesquisa.Text := qryPosto['NOME_FANTASIA'];
       frmRelatorioClientes.qryCliente.Locate('postoid', qryPosto['POSTOID'], []);
       DuploClickNaGrid := '';
       Close;
     end;


end;

procedure TfrmPosto.cbUFCloseUp(Sender: TObject);
begin
  prepararListaCidades;
end;

procedure TfrmPosto.cbUFExit(Sender: TObject);
begin
  prepararListaCidades;
end;

procedure TfrmPosto.configurarEnables(status: integer);
  begin
      if status = 0 then
    begin
      btnNovo.Enabled := True;
      btnNovo.Enabled := True;
      btnExcluir.Enabled := True;
      btnCancelar.Enabled := False;
      btnSalvar.Enabled := False;
      editNomeFantasia.Enabled := False;
      cbUF.Enabled:= False;
      cbMunicipio.Enabled:= False;
      editCNPJ.Enabled := False;
      editRazaoSocial.Enabled := False;
      gridPosto.Enabled := True;
      gbPesquisaPosto.Enabled := True;
    end
   else
    begin
      btnNovo.Enabled := False;
      btnNovo.Enabled := False;
      btnExcluir.Enabled := False;
      btnCancelar.Enabled := True;
      btnSalvar.Enabled := True;
      cbUF.Enabled:= True;
      cbMunicipio.Enabled:= True;
      editNomeFantasia.Enabled := True;
      editCNPJ.Enabled := True;
      editRazaoSocial.Enabled := True;
      gridPosto.Enabled := False;
      gbPesquisaPosto.Enabled := False;
    end;
  end;


procedure TfrmPosto.editRazaoSocialKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
     begin
       editCNPJ.SetFocus;
       Key := #0;
     end;
end;

procedure TfrmPosto.EfetuarPesquisaOnChance;
begin

end;

procedure TfrmPosto.EfetuarPesquisaOnChange;
begin

{select p.postoid, p.nome_fantasia, p.razao_social, p.cnpj,  p.estado_id, p.municipio_id, e.uf, m.nome
from Posto p, estado e, municipio m
where
(p.estado_id = e.id) and
(p.municipio_id = m.id) and cnpj like }


  if rbCNPJ.Checked = True then

   with qryPosto do
      begin
       Close;
       SQL.Clear;
       SQL.Add('select p.postoid, p.nome_fantasia, p.razao_social, p.cnpj,  p.estado_id, p.municipio_id, e.uf, m.nome '
    +' from Posto p, estado e, municipio m '
    +' where '
    +'(p.estado_id = e.id) and '
    +'(p.municipio_id = m.id) and cnpj like ' + QuotedStr('%' + editPesquisaPosto.Text + '%') + 'order by cnpj asc');
       Open;
     end;

  if rbNomeFantasia.Checked = True then

   with qryPosto do
      begin
       Close;
       SQL.Clear;
       SQL.Add('select p.postoid, p.nome_fantasia, p.razao_social, p.cnpj,  p.estado_id, p.municipio_id, e.uf, m.nome '
    +' from Posto p, estado e, municipio m '
    +' where '
    +'(p.estado_id = e.id) and '
    +'(p.municipio_id = m.id) and nome_fantasia like ' + QuotedStr('%' + editPesquisaPosto.Text + '%') + 'order by nome_fantasia asc');
       Open;
     end;

  if rbRazaoSocial.Checked = True then

   with qryPosto do
      begin
       Close;
       SQL.Clear;
       SQL.Add('select p.postoid, p.nome_fantasia, p.razao_social, p.cnpj,  p.estado_id, p.municipio_id, e.uf, m.nome '
    +' from Posto p, estado e, municipio m '
    +' where '
    +'(p.estado_id = e.id) and '
    +'(p.municipio_id = m.id) and razao_social like ' + QuotedStr('%' + editPesquisaPosto.Text + '%') + 'order by razao_social asc');
       Open;
     end;

     definirTamanhoDaLinhaDaGrid;
end;

procedure TfrmPosto.editCNPJEnter(Sender: TObject);
begin
  mascararCNPJ;
end;

procedure TfrmPosto.editCNPJKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_F12 then
       btnSalvar.Click;
end;

procedure TfrmPosto.editNomeFantasiaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_F12 then
       btnSalvar.Click;
end;



procedure TfrmPosto.editNomeFantasiaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
       editRazaoSocial.SetFocus;
       Key := #0;
     end;
end;


procedure TfrmPosto.editPesquisaPostoChange(Sender: TObject);
begin

EfetuarPesquisaOnChange;

end;

procedure TfrmPosto.editPesquisaPostoExit(Sender: TObject);
begin

  //  if rbCNPJ.Checked then
 //    editPesquisaPosto.Text := FormatMaskText('99.999.999/9999-99;0', editPesquisaPosto.Text);
end;

procedure TfrmPosto.editPesquisaPostoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_DOWN then
       qryPosto.Next;

      if Key = VK_UP then
           qryPosto.Prior;

end;

procedure TfrmPosto.editPesquisaPostoKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
     begin
       capturarPosto;
       Key := #0;
     end;
end;

procedure TfrmPosto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryPosto.Close;
end;


procedure TfrmPosto.FormShow(Sender: TObject);
begin
  qryPosto.Open;
  qryEstado.Open();
  qryMunicipio.Open();
  configurarEnables(0);
  rbCNPJ.Checked := true;
  if DuploClickNaGrid = 'ENVIAR' then
     editPesquisaPosto.SetFocus;
    definirTamanhoDaLinhaDaGrid;

end;





procedure TfrmPosto.gridPostoDblClick(Sender: TObject);
begin
   capturarPosto;
end;

procedure TfrmPosto.gridPostoDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin


    //zebrando o dbgrid
    if Odd(gridPosto.DataSource.DataSet.RecNo) then
        gridPosto.Canvas.Brush.Color := $00CFCFCF
       else
          gridPosto.Canvas.Brush.Color := clWhite;


    //mudando a cor da sele��o
    if ( gdSelected in State ) then
         begin
            gridPosto.Canvas.Brush.Color := $00BC7B50;
             gridPosto.Canvas.Font.Color := clWhite;
              gridPosto.Canvas.Font.Style := [fsBold];
         end;



        gridPosto.Canvas.FillRect( Rect );
        gridPosto.DefaultDrawColumnCell( Rect, DataCol, Column, State );


     //mudando a posi��o e alinhamento vertical do texto de cada linha
   //  gridPosto.Canvas.TextRect(Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText);


end;

procedure TfrmPosto.mascararCNPJ;
begin
     editCNPJ.Field.EditMask := '00.000.000/0000-00;1;_';
end;


procedure TfrmPosto.rbCNPJClick(Sender: TObject);
begin
  editPesquisaPosto.Clear;
  editPesquisaPosto.SetFocus;
end;

procedure TfrmPosto.rbNomeFantasiaClick(Sender: TObject);
begin
   editPesquisaPosto.Clear;
   editPesquisaPosto.SetFocus;

end;

procedure TfrmPosto.rbRazaoSocialClick(Sender: TObject);
begin
   editPesquisaPosto.Clear;
   editPesquisaPosto.SetFocus;

end;

initialization
RegisterClass(TfrmPosto);

finalization
UnRegisterClass(TfrmPosto);

end.
