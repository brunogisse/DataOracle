unit UTransferenciaEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.Mask;

type
  TfrmTransferencia = class(TForm)
    PainelTopo: TPanel;
    Image1: TImage;
    Label2: TLabel;
    gbEditGeneral: TGroupBox;
    Panel1: TPanel;
    painelBtnNovo: TPanel;
    btnNovo: TSpeedButton;
    PainelCancelar: TPanel;
    btnCancelar: TSpeedButton;
    painelSalvar: TPanel;
    btnSalvar: TSpeedButton;
    painelEsquerdo: TPanel;
    editMotorista: TEdit;
    qryCorretor: TFDQuery;
    qryCorretorCORRETORID: TIntegerField;
    qryCorretorNOME: TStringField;
    qryCorretorCPF: TStringField;
    qryCorretorCIDADE: TStringField;
    dsCorretor: TDataSource;
    qryMotorista: TFDQuery;
    qryMotoristaMOTORISTAID: TIntegerField;
    qryMotoristaNOME: TStringField;
    qryMotoristaCIDADE: TStringField;
    qryMotoristaCPF: TStringField;
    dsMotorista: TDataSource;
    dsPosto: TDataSource;
    qryPosto: TFDQuery;
    qryPostoPOSTOID: TIntegerField;
    qryPostoNOME_FANTASIA: TStringField;
    qryPostoRAZAO_SOCIAL: TStringField;
    qryPostoCNPJ: TStringField;
    dsProduto: TDataSource;
    qryProduto: TFDQuery;
    qryProdutoPRODUTOID: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    dsRepresentante: TDataSource;
    qryRepresentante: TFDQuery;
    qryRepresentanteREPRESENTANTEID: TIntegerField;
    qryRepresentanteNOME: TStringField;
    qryRepresentanteCIDADE: TStringField;
    qryRepresentanteCNPJ: TStringField;
    dsUsina: TDataSource;
    qryUsina: TFDQuery;
    qryUsinaUSINAID: TIntegerField;
    qryUsinaRAZAO_SOCIAL: TStringField;
    qryUsinaNOME_FANTASIA: TStringField;
    qryUsinaENDERECO: TStringField;
    qryUsinaBAIRRO: TStringField;
    qryUsinaCIDADE: TStringField;
    qryUsinaUF: TStringField;
    qryUsinaTELEFONE: TStringField;
    dsEstoqueUsina: TDataSource;
    qryEstoqueUsina: TFDQuery;
    qryEstoqueUsinaESTOQUEID: TFDAutoIncField;
    qryEstoqueUsinaUSINAID: TIntegerField;
    qryEstoqueUsinaPRODUTOID: TIntegerField;
    qryEstoqueUsinaESTOQUE: TFMTBCDField;
    qryEstoqueUsinaREPRESENTANTEID: TIntegerField;
    qryVendaPosto: TFDQuery;
    qryVendaPostoVENDAID: TFDAutoIncField;
    qryVendaPostoREPRESENTANTEID: TIntegerField;
    qryVendaPostoPOSTOID: TIntegerField;
    qryVendaPostoPRODUTOID: TIntegerField;
    qryVendaPostoMOTORISTAID: TIntegerField;
    qryVendaPostoCORRETORID: TIntegerField;
    qryVendaPostoESTOQUEID: TIntegerField;
    qryVendaPostoUSINAID: TIntegerField;
    qryVendaPostoNF: TIntegerField;
    qryVendaPostoVALOR_NF: TFMTBCDField;
    qryVendaPostoDATA_EMISSAO_NF: TDateField;
    qryVendaPostoVENCIMENTO_NF_ATUAL: TDateField;
    qryVendaPostoVOLUME: TFMTBCDField;
    qryVendaPostoTAXA_FRETE: TBCDField;
    qryVendaPostoVALOR_TOTAL_FRETE: TFMTBCDField;
    qryVendaPostoTAXA_CORRETAGEM: TBCDField;
    qryVendaPostoVALOR_TOTAL_CORRETAGEM: TFMTBCDField;
    qryVendaPostoSTATUS: TStringField;
    qryVendaPostoATUALIZAR_PARCELA: TIntegerField;
    qryVendaPostoPARCELAS_GERADAS: TStringField;
    qryVendaPostoTOTAL_NF_RECEBIDO: TFMTBCDField;
    qryVendaPostoVOLUME_TOTAL_RETIRADO: TFMTBCDField;
    qryVendaPostoVALOR_RECEBIDO_MES: TFMTBCDField;
    qryVendaPostoVOLUME_RECEBIDO_MES: TFMTBCDField;
    qryVendaPostoCORRETOR: TStringField;
    qryVendaPostoMOTORISTA: TStringField;
    qryVendaPostoPOSTO: TStringField;
    qryVendaPostoPRODUTO: TStringField;
    qryVendaPostoREPRESENTANTE: TStringField;
    qryVendaPostoUSINA: TStringField;
    qryVendaPostoESTOQUE_ID_VENDAS: TIntegerField;
    qryVendaPostoVALOR_COMBUSTIVEL: TFMTBCDField;
    qryVendaPostoSTATUS_FRETE: TStringField;
    qryVendaPostoSTATUS_CORRETAGEM: TStringField;
    qryVendaPostoSTATUS_PGTO_CLIENTE: TStringField;
    dsVendaPosto: TDataSource;
    tcTransferencia: TFDTransaction;
    Label9: TLabel;
    labelOrigem: TLabel;
    editDeFornecedor: TEdit;
    editProduto: TEdit;
    Label1: TLabel;
    editQtde: TEdit;
    Label3: TLabel;
    editEstoqueID: TEdit;
    Label4: TLabel;
    labelDestino: TLabel;
    editParaFornecedor: TEdit;
    editParaProduto: TEdit;
    Label5: TLabel;
    editParaQtde: TEdit;
    Label6: TLabel;
    editParaEstoqueID: TEdit;
    Label7: TLabel;
    Label12: TLabel;
    dateTransferencia: TMaskEdit;
    Label8: TLabel;
    editVolumeTransferido: TEdit;
    editTaxa: TEdit;
    Label10: TLabel;
    editTotalFrete: TEdit;
    Label11: TLabel;
    labelRepresentante: TLabel;
    editRepresentante: TEdit;
    qryMovimento: TFDQuery;
    qryMovimentoMOVIMENTOID: TIntegerField;
    qryMovimentoPRODUTOID: TIntegerField;
    qryMovimentoESTOQUEID: TIntegerField;
    qryMovimentoUSINAID: TIntegerField;
    qryMovimentoDATA: TDateField;
    qryMovimentoTIPO: TStringField;
    qryMovimentoVOLUME: TFMTBCDField;
    qryMovimentoVALOR: TFMTBCDField;
    qryMovimentoMOTIVO: TStringField;
    qryMovimentoESTOQUE_ANTERIOR: TFMTBCDField;
    qryMovimentoREPRESENTANTEID: TIntegerField;
    dsMovimento: TDataSource;
    procedure editRepresentanteKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure editRepresentanteKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure editDeFornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure editParaFornecedorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure editMotoristaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure editTaxaChange(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure editVolumeTransferidoChange(Sender: TObject);
  private
    { Private declarations }

    procedure selecionarEstoque(destino : String );
    procedure configurarEnables(Status : Integer);
    procedure salvarTransferencia;
    procedure calcularValorTransferencia;

    function verificarCamposVazios: Boolean;
    procedure limparCampos;
    procedure registrarMovimento(tipo : String);

  public
    { Public declarations }
  end;

var
  frmTransferencia: TfrmTransferencia;

implementation

{$R *.dfm}

uses URepresentante, UPrincipalPetrotorque, UselecionarUsinaEproduto,
  UMotorista, UConverterFloat;



function TfrmTransferencia.verificarCamposVazios : Boolean;
  var i : Integer;
begin
    Result := True;
     for I := 0 to gbEditGeneral.ControlCount - 1 do
        begin
          if (gbEditGeneral.controls[i] is TEdit) then
          if (gbEditGeneral.Controls[i] as TEdit).Text = '' then
            begin
              MessageDlg('Por favor, preencha o(s) campo(s) vazio(s)',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
              (gbEditGeneral.Controls[i] as TEdit).SetFocus;
              Result := False;
              Break;
            end;
        end;
end;


procedure TfrmTransferencia.registrarMovimento(tipo: string);
begin

if qryMovimento.Active = false then qryMovimento.Open();

     if tipo = 'saindo' then
         begin
           qryMovimento.Insert;
           qryMovimento['REPRESENTANTEID']    := qryEstoqueUsina['REPRESENTANTEID'];
           qryMovimento['PRODUTOID']          := qryEstoqueUsina['PRODUTOID'];
           qryMovimento['USINAID']            := qryEstoqueUsina['USINAID'];
           qryMovimento['ESTOQUEID']          := qryEstoqueUsina['ESTOQUEID'];
           qryMovimento['DATA']               := StrToDate(dateTransferencia.EditText);
           qryMovimento['VALOR']              := 0;
           qryMovimento['VOLUME']             := StrToFloat(editVolumeTransferido.Text);
           qryMovimento['ESTOQUE_ANTERIOR']   := qryEstoqueUsina['ESTOQUE'];
           qryMovimento['TIPO']               := 'S';
           qryMovimento['MOTIVO']             := 'Transferência efetuada peo motorista: '+ qryMotorista['NOME'];
         end;

     if tipo = 'entrando' then
         begin
           qryMovimento.Insert;
           qryMovimento['REPRESENTANTEID']    := qryEstoqueUsina['REPRESENTANTEID'];
           qryMovimento['PRODUTOID']          := qryEstoqueUsina['PRODUTOID'];
           qryMovimento['USINAID']            := qryEstoqueUsina['USINAID'];
           qryMovimento['ESTOQUEID']          := qryEstoqueUsina['ESTOQUEID'];
           qryMovimento['DATA']               := StrToDate(dateTransferencia.EditText);
           qryMovimento['VALOR']              := 0;
           qryMovimento['VOLUME']             := StrToFloat(editVolumeTransferido.Text);
           qryMovimento['ESTOQUE_ANTERIOR']   := qryEstoqueUsina['ESTOQUE'];
           qryMovimento['TIPO']               := 'E';
           qryMovimento['MOTIVO']             := 'Transferência efetuada peo motorista: '+ qryMotorista['NOME'];
         end;

       qryMovimento.Post;

end;

procedure TfrmTransferencia.limparCampos;
var i : Integer;
begin
     for I := 0 to gbEditGeneral.ControlCount - 1 do
        begin
          if (gbEditGeneral.controls[i] is TEdit) then
                 (gbEditGeneral.Controls[i] as TEdit).Clear;
        end;
        dateTransferencia.Clear;
end;

procedure TfrmTransferencia.calcularValorTransferencia;
var Volume, TaxaCorretagem, TotalCorretagem : Double;
begin

    if (editVolumeTransferido.Text <> '') and (editTaxa.Text <> '') then
         begin
           Volume := StrToFloat(editVolumeTransferido.Text);
           TaxaCorretagem := StrToFloat(editTaxa.Text);
           TotalCorretagem := TaxaCorretagem * Volume;
           editTotalFrete.Text := FormatFloat('R$ ###,###,##0.00', TotalCorretagem)
         end
       else
           editTotalFrete.Text := '';
end;

procedure TfrmTransferencia.salvarTransferencia;
var total : Currency;
begin
    //Registrando a saída do estoque selecionado
      qryEstoqueUsina.Locate('estoqueid', editEstoqueID.Text, []);
      qryEstoqueUsina.Edit;
      qryEstoqueUsina['ESTOQUE'] := qryEstoqueUsina['ESTOQUE'] - StrToFloat(editVolumeTransferido.Text);
      registrarMovimento('saindo');
      qryEstoqueUsina.Post;

    //Registrando a entrada no estoque selecionado
      qryEstoqueUsina.Locate('estoqueid', editParaEstoqueID.Text, []);
      qryEstoqueUsina.Edit;
      qryEstoqueUsina['ESTOQUE'] := qryEstoqueUsina['ESTOQUE'] + StrToFloat(editVolumeTransferido.Text);
      registrarMovimento('entrando');
      qryEstoqueUsina.Post;

      qryVendaPosto.Insert;
    //Registrando a venda fictícia para aparecer no relatório de frete.
      qryEstoqueUsina.Locate('estoqueid', editParaEstoqueID.Text,[]);
      qryVendaPosto['REPRESENTANTEID']     := qryRepresentante['REPRESENTANTEID'];
      qryPosto.Locate('POSTOID', 1812, []);
      qryVendaPosto['POSTOID']             := qryPosto['POSTOID'];
      qryVendaPosto['PRODUTOID']           := qryEstoqueUsina['PRODUTOID'];
      qryVendaPosto['MOTORISTAID']         := qryMotorista['MOTORISTAID'];
      qryCorretor.Locate('CORRETORID', 26, []);
      qryVendaPosto['CORRETORID']          := qryCorretor['CORRETORID'];
      qryVendaPosto['USINAID']             := qryEstoqueUsina['USINAID'];
      qryVendaPosto['ESTOQUE_ID_VENDAS']       := qryEstoqueUsina['ESTOQUEID'];
      qryVendaPosto['NF'] := 0;
      qryVendaPosto['VALOR_NF'] := 0;
      qryVendaPosto['DATA_EMISSAO_NF']     := StrToDate(dateTransferencia.EditText);
      qryVendaPosto['VOLUME']              := StrToFloat(editVolumeTransferido.Text);
      qryVendaPosto['TAXA_FRETE']          := StrToFloat(editTaxa.Text);

      total := TextToCurr(editTotalFrete.Text);
      qryVendaPosto['VALOR_TOTAL_FRETE']   := total;
      qryVendaPosto['STATUS_FRETE'] := 'ABT';
      qryVendaPosto.Post;

          try
            tcTransferencia.CommitRetaining;
            MessageDlg('Transferência realizada com sucesso!',TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbOK],0);
          except
            tcTransferencia.RollbackRetaining;
          end;
end;

procedure TfrmTransferencia.configurarEnables(status : Integer);
begin
    if status = 1 then
         begin
           gbEditGeneral.Enabled := True;
           btnNovo.Enabled := False;
           btnCancelar.Enabled := True;
           btnSalvar.Enabled := True;
         end;
    if status = 0 then
         begin
           gbEditGeneral.Enabled := False;
           btnNovo.Enabled := True;
           btnCancelar.Enabled := False;
           btnSalvar.Enabled := False;
         end;
end;

procedure TfrmTransferencia.selecionarEstoque(destino : String);
begin
    try
      Application.CreateForm(TfrmSelecionarEstoqueProduto, frmSelecionarEstoqueProduto);
      if destino = 'de' then
      frmSelecionarEstoqueProduto.caminhoEntrega := 'transferenciaDe';
      if destino = 'para' then
      frmSelecionarEstoqueProduto.caminhoEntrega := 'transferenciaPara';
      frmSelecionarEstoqueProduto.ShowModal;
     finally
      FreeAndNil(frmSelecionarEstoqueProduto);
    end;

end;

procedure TfrmTransferencia.editParaFornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
    selecionarEstoque('para');
end;

procedure TfrmTransferencia.editMotoristaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then
     begin
          try
            Application.CreateForm(TfrmMotorista, frmMotorista);
            frmMotorista.Action := 'transferencia';
            frmMotorista.ShowModal;
          finally
              FreeAndNil(frmMotorista);
          end;
     end;
end;

procedure TfrmTransferencia.btnCancelarClick(Sender: TObject);
begin
    qryVendaPosto.Cancel;
    qryEstoqueUsina.Cancel;
    limparCampos;
    configurarEnables(0);

end;

procedure TfrmTransferencia.btnNovoClick(Sender: TObject);
begin
    configurarEnables(1);
    dateTransferencia.SetFocus;
end;

procedure TfrmTransferencia.btnSalvarClick(Sender: TObject);
begin
  if verificarCamposVazios = True then
    begin
       salvarTransferencia;
       limparCampos;
       configurarEnables(0);
    end;
end;

procedure TfrmTransferencia.editDeFornecedorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_RETURN then
    selecionarEstoque('de');
end;

procedure TfrmTransferencia.editRepresentanteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
     begin
          try
            Application.CreateForm(TfrmRepresentante, frmRepresentante);
            frmRepresentante.Caminho := 'transferencia';
            frmRepresentante.ShowModal;
          finally
              FreeAndNil(frmRepresentante);
          end;
     end;
end;

procedure TfrmTransferencia.editRepresentanteKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
      Key := #0;
end;

procedure TfrmTransferencia.editTaxaChange(Sender: TObject);
begin

    calcularValorTransferencia;

end;

procedure TfrmTransferencia.editVolumeTransferidoChange(Sender: TObject);
begin
    calcularValorTransferencia;
end;

procedure TfrmTransferencia.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    qryRepresentante.Close;
    qryEstoqueUsina.Close;
    qryMotorista.Close;
    qryPosto.Close;
    qryCorretor.Close;
    qryVendaPosto.Close;
end;

procedure TfrmTransferencia.FormShow(Sender: TObject);
begin
    qryRepresentante.Open();
    qryEstoqueUsina.Open();
    qryMotorista.Open();
    qryPosto.Open();
    qryCorretor.Open();
    qryVendaPosto.Open();
    configurarEnables(0);
end;

end.
