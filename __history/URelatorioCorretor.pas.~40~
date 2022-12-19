unit URelatorioCorretor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.Mask, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxClass, frxDBSet;

type
  TfrmRelatorioCorretor = class(TForm)
    PainelTopo: TPanel;
    labelTitulo: TLabel;
    PainelCentral: TPanel;
    gbPesquisaPosto: TGroupBox;
    labelPesquisa: TLabel;
    labelDe: TLabel;
    labelATE: TLabel;
    editPesquisa: TEdit;
    DateVencimentoDE: TMaskEdit;
    DateVencimentoATE: TMaskEdit;
    painelFundobtn: TPanel;
    PainelConsultar: TPanel;
    btnConsultar: TSpeedButton;
    gridMotorista: TDBGrid;
    dsVendaPosto: TDataSource;
    qryVendaPosto: TFDQuery;
    qryVendaPostoVENDAID: TFDAutoIncField;
    qryVendaPostoDATA_EMISSAO_NF: TDateField;
    qryVendaPostoREPRESENTANTEID: TIntegerField;
    qryVendaPostoPOSTOID: TIntegerField;
    qryVendaPostoPRODUTOID: TIntegerField;
    qryVendaPostoMOTORISTAID: TIntegerField;
    qryVendaPostoCORRETORID: TIntegerField;
    qryVendaPostoUSINAID: TIntegerField;
    qryVendaPostoNF: TIntegerField;
    qryVendaPostoVALOR_NF: TFMTBCDField;
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
    dsCorretor: TDataSource;
    qryCorretor: TFDQuery;
    qryCorretorCORRETORID: TIntegerField;
    qryCorretorNOME: TStringField;
    qryCorretorCPF: TStringField;
    qryCorretorCIDADE: TStringField;
    reportCorretor: TfrxReport;
    dbRelCorretor: TfrxDBDataset;
    painelBotoes: TPanel;
    painelImprimir: TPanel;
    btnImprimir: TSpeedButton;
    qryVendaPostoVALOR_COMBUSTIVEL: TFMTBCDField;
    qryVendaPostoESTOQUEID: TIntegerField;
    Image1: TImage;
    gbStatus: TRadioGroup;
    rbTodos: TRadioButton;
    rbPago: TRadioButton;
    rbAberto: TRadioButton;
    gbMudarStatus: TGroupBox;
    btnConfirmarStatus: TSpeedButton;
    rbPagar: TRadioButton;
    rbPgtoAberto: TRadioButton;
    rbPagarTodos: TRadioButton;
    qryVendaPostoSTATUS_CORRETAGEM: TStringField;
    tcCorretor: TFDTransaction;
    procedure editPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnConsultarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnConfirmarStatusClick(Sender: TObject);
    procedure gridMotoristaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rbTodosClick(Sender: TObject);
    procedure rbPagoClick(Sender: TObject);
    procedure rbAbertoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioCorretor: TfrmRelatorioCorretor;

implementation

{$R *.dfm}

uses UPrincipalPetrotorque, UCorretores, UVendaPosto;

procedure TfrmRelatorioCorretor.btnConfirmarStatusClick(Sender: TObject);
var confirmar : String;
    i, codAlterado : Integer;
begin
            if qryVendaPosto.RecordCount > 0 then
                begin

                 codAlterado := qryVendaPosto['VENDAID'];

                  if rbPagar.Checked = True then
                      begin
                        if qryVendaPosto['STATUS_CORRETAGEM'] <> 'PGO' then
                          begin
                             qryVendaPosto.Edit;
                             qryVendaPosto['STATUS_CORRETAGEM'] := 'PGO';
                             qryVendaPosto.Post;
                          end
                          else
                             MessageDlg('Status já consta como pago!',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
                      end;

                  if rbPgtoAberto.Checked = True then
                      begin
                         if qryVendaPosto['STATUS_CORRETAGEM'] <> 'ABT' then
                          begin
                             qryVendaPosto.Edit;
                             qryVendaPosto['STATUS_CORRETAGEM'] := 'ABT';
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
                                      qryVendaPosto['STATUS_CORRETAGEM'] := 'PGO';
                                      qryVendaPosto.Post;
                                      qryVendaPosto.Next;
                                    end;
                              end
                               else
                                MessageDlg('Código de confirmação incorreto!',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0)
                         end;

                         try
                            tcCorretor.CommitRetaining;
                         except
                            tcCorretor.RollbackRetaining;
                         end;

                            qryVendaPosto.Locate('vendaid', codAlterado, []);
                end
                  else
                     MessageDlg('Corretor não selecionado ou não possui registros de participações'
                     + ' em vendas no período selecionado. (Escolha as datas e clique em "consultar")',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);

end;

procedure TfrmRelatorioCorretor.btnConsultarClick(Sender: TObject);
  var filtroStatus: String;
begin

       if editPesquisa.Text <> '' then
        begin

              if rbTodos.Checked then
                 FiltroStatus := '';
              if rbPago.Checked then
                 FiltroStatus := ' and (v.status_corretagem = ''PGO'') ';
              if rbAberto.Checked then
                 FiltroStatus := ' and (v.status_corretagem = ''ABT'') ';

           with qryVendaPosto do
             begin
               Close;
               SQL.Clear;
               SQL.Add('select '

                  + 'v.vendaid, v.representanteid, v.postoid, v.produtoid, v.motoristaid, v.corretorid, v.usinaid, '

                  +' v.nf, v.valor_nf, v.data_emissao_nf, v.vencimento_nf_atual, v.volume, v.taxa_frete, v.valor_total_frete, '
                  +' v.taxa_corretagem, v.valor_total_corretagem, v.valor_combustivel, V.STATUS, V.ATUALIZAR_PARCELA, v.parcelas_geradas, '
                  +' V.TOTAL_NF_RECEBIDO, V.VOLUME_TOTAL_RETIRADO, V.VALOR_RECEBIDO_MES, V.VOLUME_RECEBIDO_MES, V.STATUS_CORRETAGEM, '

                  +' c.nome as corretor, m.nome as motorista, p.NOME_FANTASIA as posto, pr.descricao as produto, re.nome as representante, u.NOME_FANTASIA as usina, '
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
                  +' (v.estoqueid = eu.estoqueid) and '
                  +' (v.corretorid = :CORRETOR) and '
                  +' (v.data_emissao_nf between :DE and :ATE) '
                  +   FiltroStatus + ' order by v.vencimento_nf_atual asc');

               ParamByName('CORRETOR').AsInteger := qryCorretor['CORRETORID'];
               ParamByName('DE').AsDate           := StrToDate(DateVencimentoDE.Text);
               ParamByName('ATE').AsDate          := StrToDate(DateVencimentoATE.Text);
               Open();
             end;
        end;
end;

procedure TfrmRelatorioCorretor.btnImprimirClick(Sender: TObject);
var caminhoRelatorio : string;
begin
  caminhoRelatorio := ExtractFilePath(Application.ExeName);
  reportCorretor.LoadFromFile(caminhoRelatorio + 'RelCorretores.fr3');
  reportCorretor.Variables['RelDE']     :=  QuotedStr(DateVencimentoDE.Text);
  reportCorretor.Variables['RelATE']    :=  QuotedStr(DateVencimentoATE.Text);
  reportCorretor.ShowReport();

end;

procedure TfrmRelatorioCorretor.editPesquisaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
      begin
        try
          Application.CreateForm( TfrmCorretores, frmCorretores );
          frmCorretores.Action := 'relatoriocorretor';
          frmCorretores.ShowModal;
        finally
           FreeAndNil( frmCorretores );
        end;
      end;
end;

procedure TfrmRelatorioCorretor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryVendaPosto.Close;
  qryCorretor.Close;
end;

procedure TfrmRelatorioCorretor.FormShow(Sender: TObject);
begin
   qryCorretor.Open();
   qryVendaPosto.Open();

   DateVencimentoDE.Text   := DateToStr(Date);
   DateVencimentoATE.Text  := DateToStr(Date);
end;

procedure TfrmRelatorioCorretor.gridMotoristaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

        if qryVendaPosto.FieldByName('STATUS_CORRETAGEM').AsString = 'PGO' then
        gridMotorista.Canvas.Brush.Color := clSilver;
        gridMotorista.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TfrmRelatorioCorretor.rbAbertoClick(Sender: TObject);
begin
    btnConsultar.Click;
end;

procedure TfrmRelatorioCorretor.rbPagoClick(Sender: TObject);
begin
    btnConsultar.Click;
end;

procedure TfrmRelatorioCorretor.rbTodosClick(Sender: TObject);
begin
    btnConsultar.Click;
end;

end.
