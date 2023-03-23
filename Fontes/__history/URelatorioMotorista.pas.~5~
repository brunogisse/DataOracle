unit URelatorioMotorista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.Mask,
  Vcl.Imaging.pngimage, frxClass, frxDBSet;

type
  TfrmRelatorioMotorista = class(TForm)
    PainelTopo: TPanel;
    labelTituloEditsNF: TLabel;
    PainelCentral: TPanel;
    gbPesquisaPosto: TGroupBox;
    editPesquisaMotorista: TEdit;
    gridMotorista: TDBGrid;
    Image1: TImage;
    qryVendaPosto: TFDQuery;
    qryVendaPostoVENDAID: TFDAutoIncField;
    qryVendaPostoREPRESENTANTEID: TIntegerField;
    qryVendaPostoPOSTOID: TIntegerField;
    qryVendaPostoPRODUTOID: TIntegerField;
    qryVendaPostoMOTORISTAID: TIntegerField;
    qryVendaPostoCORRETORID: TIntegerField;
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
    dsVendaPosto: TDataSource;
    dsMotorista: TDataSource;
    qryMotorista: TFDQuery;
    qryMotoristaMOTORISTAID: TIntegerField;
    qryMotoristaNOME: TStringField;
    qryMotoristaCIDADE: TStringField;
    qryMotoristaCPF: TStringField;
    labelPesquisa: TLabel;
    labelDe: TLabel;
    labelATE: TLabel;
    DateVencimentoDE: TMaskEdit;
    DateVencimentoATE: TMaskEdit;
    painelFundobtn: TPanel;
    PainelConsultar: TPanel;
    btnConsultar: TSpeedButton;
    dbRelMotorista: TfrxDBDataset;
    reportMotorista: TfrxReport;
    painelBotoes: TPanel;
    painelImprimir: TPanel;
    btnImprimir: TSpeedButton;
    qryVendaPostoVALOR_COMBUSTIVEL: TFMTBCDField;
    qryVendaPostoESTOQUEID: TIntegerField;
    gbMudarStatus: TGroupBox;
    gbStatus: TRadioGroup;
    rbPago: TRadioButton;
    rbAberto: TRadioButton;
    rbTodos: TRadioButton;
    tcMotorista: TFDTransaction;
    btnConfirmarStatus: TSpeedButton;
    qryVendaPostoSTATUS_FRETE: TStringField;
    rbPagar: TRadioButton;
    rbPgtoAberto: TRadioButton;
    rbPagarTodos: TRadioButton;
    qryVendaPostoORDEM_CARREGAMENTO: TIntegerField;
    cbOrdemCarregamento: TCheckBox;
    editOrdemCarregamento: TEdit;
    qryRepresentante: TFDQuery;
    qryRepresentanteREPRESENTANTEID: TIntegerField;
    qryRepresentanteNOME: TStringField;
    qryRepresentanteCIDADE: TStringField;
    qryRepresentanteCNPJ: TStringField;
    dsRepresentante: TDataSource;
    labelRepresentante: TLabel;
    editRepresentante: TEdit;
    Label1: TLabel;
    procedure btnConsultarClick(Sender: TObject);
    procedure editPesquisaMotoristaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnConfirmarStatusClick(Sender: TObject);
    procedure gridMotoristaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rbTodosClick(Sender: TObject);
    procedure rbPagoClick(Sender: TObject);
    procedure rbAbertoClick(Sender: TObject);
    procedure cbOrdemCarregamentoClick(Sender: TObject);
    procedure editOrdemCarregamentoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editOrdemCarregamentoKeyPress(Sender: TObject; var Key: Char);
    procedure editRepresentanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure mudarTipoDeFiltro;
  public
    { Public declarations }
  end;

var
  frmRelatorioMotorista: TfrmRelatorioMotorista;

implementation

{$R *.dfm}

uses UMotorista, UPrincipalPetrotorque, URepresentante;

procedure TfrmRelatorioMotorista.mudarTipoDeFiltro;
begin

  if cbOrdemCarregamento.Checked = True then
      begin
        editPesquisaMotorista.Text := '(fazendo busaca por ordem de carregamento)';
        editPesquisaMotorista.Enabled := False;
        editOrdemCarregamento.Enabled := True;
        editOrdemCarregamento.SetFocus;
      end;
  if cbOrdemCarregamento.Checked = False then
      begin
        editPesquisaMotorista.Enabled := True;
        editPesquisaMotorista.Clear;
        editPesquisaMotorista.SetFocus;
        editOrdemCarregamento.Enabled := False;
        editOrdemCarregamento.Clear;
      end;
end;

procedure TfrmRelatorioMotorista.btnConsultarClick(Sender: TObject);
 var FiltroStatus, FiltroPrincipal : String;
begin

      if editPesquisaMotorista.Text <> '' then
        begin

              if rbTodos.Checked then
                 FiltroStatus := '';
              if rbPago.Checked then
                 FiltroStatus := ' and (v.status_frete = ''PGO'') ';
              if rbAberto.Checked then
                 FiltroStatus := ' and (v.status_frete = ''ABT'') ';

              if cbOrdemCarregamento.Checked = True then
                  FiltroPrincipal := ' (v.ordem_carregamento = :ORDEMCARREGAMENTO) and';
              if cbOrdemCarregamento.Checked = False then
                  FiltroPrincipal := ' (v.motoristaid = :Motorista) and ';



           with qryVendaPosto do
             begin
               Close;
               SQL.Clear;
               SQL.Add('select '

                  + 'v.vendaid, v.representanteid, v.postoid, v.produtoid, v.motoristaid, v.corretorid, v.usinaid, '

                  +' v.nf, v.valor_nf, v.data_emissao_nf, v.vencimento_nf_atual, v.volume, v.taxa_frete, v.valor_total_frete, '
                  +' v.taxa_corretagem, v.valor_total_corretagem, v.valor_combustivel, V.STATUS, V.ATUALIZAR_PARCELA, v.parcelas_geradas, '
                  +' V.TOTAL_NF_RECEBIDO, V.VOLUME_TOTAL_RETIRADO, V.VALOR_RECEBIDO_MES, V.VOLUME_RECEBIDO_MES, V.STATUS_FRETE, V.ORDEM_CARREGAMENTO,'

                  +' c.nome as corretor, m.nome as motorista, p.NOME_FANTASIA as posto, pr.descricao as produto, re.nome as representante, re.representanteid, u.NOME_FANTASIA as usina, '
                  +' eu.estoqueid '

                  +' from '

                  +' venda_para_postos v, corretor c, motorista m, posto p, produto pr, representante re, usina u, estoque_usina eu '

                  +' where '

                  +' (v.representanteid = re.representanteid) and '
                  +' (v.postoid = p.postoid) and '
                  +' (v.produtoid = pr.produtoid) and '
                  +' (v.motoristaid = m.motoristaid) and '
                  +' (v.corretorid = c.corretorid) and '
                  +' (v.usinaid = u.usinaid) and '
                  +' (re.representanteid = :representante) and '
                  +' (v.estoqueid = eu.estoqueid) and '
                  +   FiltroPrincipal + ''
                  +' (v.data_emissao_nf between :DE and :ATE) '
                  +   FiltroStatus + ' order by v.DATA_EMISSAO_NF');


               if cbOrdemCarregamento.Checked = True then
                 ParamByName('ORDEMCARREGAMENTO').AsInteger := StrToInt(editOrdemCarregamento.Text);
               if cbOrdemCarregamento.Checked = False then
                 ParamByName('MOTORISTA').AsInteger := qryMotorista['MOTORISTAID'];
               ParamByName('DE').AsDate             := StrToDate(DateVencimentoDE.Text);
               ParamByName('ATE').AsDate             := StrToDate(DateVencimentoATE.Text);
               ParamByName('representante').AsInteger := qryRepresentante['REPRESENTANTEID'];
               Open();
             end;
        end;

end;

procedure TfrmRelatorioMotorista.btnImprimirClick(Sender: TObject);
var caminhoRelatorio : string;
begin
  caminhoRelatorio := ExtractFilePath(Application.ExeName);
  reportMotorista.LoadFromFile(caminhoRelatorio + 'RelMotoristas.fr3');
  reportMotorista.Variables['RelDE']     :=  QuotedStr(DateVencimentoDE.Text);
  reportMotorista.Variables['RelATE']    :=  QuotedStr(DateVencimentoATE.Text);
  reportMotorista.ShowReport();

end;

procedure TfrmRelatorioMotorista.cbOrdemCarregamentoClick(Sender: TObject);
begin
  mudarTipoDeFiltro;
end;

procedure TfrmRelatorioMotorista.btnConfirmarStatusClick(Sender: TObject);
var confirmar : String;
    i, codAlterado : Integer;
begin

      if qryVendaPosto.RecordCount > 0 then
             begin

                 codAlterado := qryVendaPosto['VENDAID'];  //capturando a venda cujo status está sendo alterado

              if rbPagar.Checked = True then
                  begin
                     if qryVendaPosto['STATUS_FRETE'] <> 'PGO' then
                       begin
                         qryVendaPosto.Edit;
                         qryVendaPosto['STATUS_FRETE'] := 'PGO';
                         qryVendaPosto.Post;
                       end
                     else
                         MessageDlg('Status já consta como pago!',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
                  end;

              if rbPgtoAberto.Checked = True then
                  begin
                    if qryVendaPosto['STATUS_FRETE'] <> 'ABT' then
                       begin
                         qryVendaPosto.Edit;
                         qryVendaPosto['STATUS_FRETE'] := 'ABT';
                         qryVendaPosto.Post;
                       end
                     else
                         MessageDlg('Status já consta como pgto aberto!',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
                  end;

              if rbPagarTodos.Checked = True then
                     begin
                       confirmar := InputBox('Confirmação', 'Insira o código de confirmação:', '');
                       if confirmar = '0000' then
                         begin
                          qryVendaPosto.First;
                            for I := 0 to qryVendaPosto.RecordCount do
                              begin
                                qryVendaPosto.Edit;
                                qryVendaPosto['STATUS_FRETE'] := 'PGO';
                                qryVendaPosto.Post;
                                qryVendaPosto.Next;
                              end;
                         end
                         else
                           MessageDlg('Código de confirmação incorreto!',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0)
                     end;

                 try
                    tcMotorista.CommitRetaining;
                 except
                    tcMotorista.RollbackRetaining;
                 end;

                    qryVendaPosto.Locate('vendaid', codAlterado, []); //localizando a venda do status alterado para continuar o foco nela
             end
              else
                MessageDlg('Motorista não selecionado ou não possui registros de participações '
                          + ' em vendas no período selecionado. (Escolha as datas e clique em "consultar")',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0)

end;

procedure TfrmRelatorioMotorista.editOrdemCarregamentoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
       btnConsultar.Click;
end;

procedure TfrmRelatorioMotorista.editOrdemCarregamentoKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = #13 then
         key := #0;
end;

procedure TfrmRelatorioMotorista.editPesquisaMotoristaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
      begin
        try
          Application.CreateForm( TfrmMotorista, frmMotorista );
          frmMotorista.Action := 'relatoriomotorista';
          frmMotorista.ShowModal;
        finally
           FreeAndNil( frmMotorista );
        end;
      end;
end;

procedure TfrmRelatorioMotorista.editRepresentanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_RETURN then
     begin
          try
            Application.CreateForm(TfrmRepresentante, frmRepresentante);
            frmRepresentante.Caminho := 'relatoriofrete';
            frmRepresentante.ShowModal;
            qryVendaPosto.Close;
          finally
            FreeAndNil(frmRepresentante);
          end;
     end;
end;

procedure TfrmRelatorioMotorista.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 qryMotorista.Close;
 qryVendaPosto.Open();
end;

procedure TfrmRelatorioMotorista.FormShow(Sender: TObject);
begin

   qryMotorista.Open();
   qryVendaPosto.Open();
   qryRepresentante.Open();
   qryRepresentante.Locate('representanteid', 6, [] );
   editRepresentante.Text := qryRepresentante['NOME'];

   DateVencimentoDE.Text   := DateToStr(Date);
   DateVencimentoATE.Text  := DateToStr(Date);
   rbTodos.Checked  := True;
   mudarTipoDeFiltro;

end;

procedure TfrmRelatorioMotorista.gridMotoristaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

    if qryVendaPosto.FieldByName('STATUS_FRETE').AsString = 'PGO' then
        gridMotorista.Canvas.Brush.Color := clSilver;
        gridMotorista.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmRelatorioMotorista.rbAbertoClick(Sender: TObject);
begin
    btnConsultar.Click;
end;

procedure TfrmRelatorioMotorista.rbPagoClick(Sender: TObject);
begin
    btnConsultar.Click;
end;

procedure TfrmRelatorioMotorista.rbTodosClick(Sender: TObject);
begin
   btnConsultar.Click;
end;

end.
