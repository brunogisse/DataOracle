unit URelatorioVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.Buttons, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  frxClass, frxDBSet;

type
  TfrmRelatorioVenda = class(TForm)
    PainelTopo: TPanel;
    PainelCentral: TPanel;
    gbPesquisaPosto: TGroupBox;
    Label2: TLabel;
    labelVencimento: TLabel;
    DateVencimentoDE: TMaskEdit;
    DateVencimentoATE: TMaskEdit;
    GroupBox1: TGroupBox;
    painelBotoes: TPanel;
    painelImprimirParcelaStatus: TPanel;
    btnImprimirRelAuxiliar: TSpeedButton;
    painelGrid: TPanel;
    gridRelatorioVendaPosto: TDBGrid;
    qryRelatorioVendaPosto: TFDQuery;
    tcVendaPosto: TFDTransaction;
    dsRelatorioVendaPosto: TDataSource;
    reportStatusParcela: TfrxReport;
    dbReportStatusParcela: TfrxDBDataset;
    qryRelatorioStatusParcela: TFDQuery;
    dsRelatorioStatusParcela: TDataSource;
    reportVendas: TfrxReport;
    frxDBDatasetPrincipal: TfrxDBDataset;
    Panel1: TPanel;
    PainelConsultar: TPanel;
    btnConsultar: TSpeedButton;
    painelFundoImprimir: TPanel;
    PainelImprimir: TPanel;
    btnImprmir: TSpeedButton;
    qryRelatorioStatusParcelaVENDAID: TIntegerField;
    qryRelatorioStatusParcelaREPRESENTANTEID: TIntegerField;
    qryRelatorioStatusParcelaPOSTOID: TIntegerField;
    qryRelatorioStatusParcelaPRODUTOID: TIntegerField;
    qryRelatorioStatusParcelaMOTORISTAID: TIntegerField;
    qryRelatorioStatusParcelaCORRETORID: TIntegerField;
    qryRelatorioStatusParcelaUSINAID: TIntegerField;
    qryRelatorioStatusParcelaNF: TIntegerField;
    qryRelatorioStatusParcelaVALOR_NF: TFMTBCDField;
    qryRelatorioStatusParcelaDATA_EMISSAO_NF: TDateField;
    qryRelatorioStatusParcelaVENCIMENTO_NF_ATUAL: TDateField;
    qryRelatorioStatusParcelaVOLUME: TFMTBCDField;
    qryRelatorioStatusParcelaTAXA_FRETE: TBCDField;
    qryRelatorioStatusParcelaVALOR_TOTAL_FRETE: TFMTBCDField;
    qryRelatorioStatusParcelaTAXA_CORRETAGEM: TBCDField;
    qryRelatorioStatusParcelaVALOR_TOTAL_CORRETAGEM: TFMTBCDField;
    qryRelatorioStatusParcelaSTATUS: TStringField;
    qryRelatorioStatusParcelaATUALIZAR_PARCELA: TIntegerField;
    qryRelatorioStatusParcelaPARCELAS_GERADAS: TStringField;
    qryRelatorioStatusParcelaTOTAL_NF_RECEBIDO: TFMTBCDField;
    qryRelatorioStatusParcelaVOLUME_TOTAL_RETIRADO: TFMTBCDField;
    qryRelatorioStatusParcelaVALOR_RECEBIDO_MES: TFMTBCDField;
    qryRelatorioStatusParcelaVOLUME_RECEBIDO_MES: TFMTBCDField;
    qryRelatorioStatusParcelaCORRETOR: TStringField;
    qryRelatorioStatusParcelaMOTORISTA: TStringField;
    qryRelatorioStatusParcelaPOSTO: TStringField;
    qryRelatorioStatusParcelaPRODUTO: TStringField;
    qryRelatorioStatusParcelaREPRESENTANTE: TStringField;
    qryRelatorioStatusParcelaUSINA: TStringField;
    qryRelatorioStatusParcelaNFDEPARCELA: TIntegerField;
    qryRelatorioStatusParcelaPARCELADEPARCELAS: TStringField;
    qryRelatorioStatusParcelaVALOR_PARCELA: TFMTBCDField;
    qryRelatorioStatusParcelaVENCIMENTOPARCELA: TDateField;
    qryRelatorioStatusParcelaVOLUME_PARCELADO: TFMTBCDField;
    qryRelatorioStatusParcelaDOCUMENTO: TStringField;
    qryRelatorioStatusParcelaDATA_PGTO_PARCELA: TDateField;
    qryRelatorioStatusParcelaACESSO: TStringField;
    qryRelatorioStatusParcelaSTATUSPARCELA: TStringField;
    rbAbertas: TRadioButton;
    rbPagas: TRadioButton;
    labelTituloReport: TLabel;
    Image1: TImage;
    editCliente: TEdit;
    labelCliente: TLabel;
    dsPosto: TDataSource;
    qryPosto: TFDQuery;
    qryPostoPOSTOID: TFDAutoIncField;
    qryPostoNOME_FANTASIA: TStringField;
    qryPostoRAZAO_SOCIAL: TStringField;
    qryPostoCNPJ: TStringField;
    qryRelatorioStatusParcelaESTOQUEID: TIntegerField;
    qryRepresentante: TFDQuery;
    dsRepresentante: TDataSource;
    qryRepresentanteREPRESENTANTEID: TIntegerField;
    qryRepresentanteNOME: TStringField;
    qryRepresentanteCIDADE: TStringField;
    qryRepresentanteCNPJ: TStringField;
    qryRelatorioStatusParcelaESTOQUEID_1: TIntegerField;
    Label3: TLabel;
    labelNF: TLabel;
    editNF: TEdit;
    qryRelatorioVendaPostoVENDAID: TFDAutoIncField;
    qryRelatorioVendaPostoREPRESENTANTEID: TIntegerField;
    qryRelatorioVendaPostoPOSTOID: TIntegerField;
    qryRelatorioVendaPostoPRODUTOID: TIntegerField;
    qryRelatorioVendaPostoMOTORISTAID: TIntegerField;
    qryRelatorioVendaPostoCORRETORID: TIntegerField;
    qryRelatorioVendaPostoUSINAID: TIntegerField;
    qryRelatorioVendaPostoESTOQUEID: TIntegerField;
    qryRelatorioVendaPostoNF: TIntegerField;
    qryRelatorioVendaPostoVALOR_NF: TFMTBCDField;
    qryRelatorioVendaPostoDATA_EMISSAO_NF: TDateField;
    qryRelatorioVendaPostoVENCIMENTO_NF_ATUAL: TDateField;
    qryRelatorioVendaPostoVOLUME: TFMTBCDField;
    qryRelatorioVendaPostoTAXA_FRETE: TBCDField;
    qryRelatorioVendaPostoVALOR_TOTAL_FRETE: TFMTBCDField;
    qryRelatorioVendaPostoTAXA_CORRETAGEM: TBCDField;
    qryRelatorioVendaPostoVALOR_TOTAL_CORRETAGEM: TFMTBCDField;
    qryRelatorioVendaPostoSTATUS: TStringField;
    qryRelatorioVendaPostoATUALIZAR_PARCELA: TIntegerField;
    qryRelatorioVendaPostoPARCELAS_GERADAS: TStringField;
    qryRelatorioVendaPostoTOTAL_NF_RECEBIDO: TFMTBCDField;
    qryRelatorioVendaPostoVOLUME_TOTAL_RETIRADO: TFMTBCDField;
    qryRelatorioVendaPostoVALOR_RECEBIDO_MES: TFMTBCDField;
    qryRelatorioVendaPostoVOLUME_RECEBIDO_MES: TFMTBCDField;
    qryRelatorioVendaPostoCORRETOR: TStringField;
    qryRelatorioVendaPostoMOTORISTA: TStringField;
    qryRelatorioVendaPostoPOSTO: TStringField;
    qryRelatorioVendaPostoPRODUTO: TStringField;
    qryRelatorioVendaPostoREPRESENTANTE: TStringField;
    qryRelatorioVendaPostoUSINA: TStringField;
    qryRelatorioVendaPostoNFDEPARCELA: TIntegerField;
    qryRelatorioVendaPostoPARCELADEPARCELAS: TStringField;
    qryRelatorioVendaPostoVALOR_PARCELA: TFMTBCDField;
    qryRelatorioVendaPostoVENCIMENTOPARCELA: TDateField;
    qryRelatorioVendaPostoVOLUME_PARCELADO: TFMTBCDField;
    qryRelatorioVendaPostoDOCUMENTO: TStringField;
    qryRelatorioVendaPostoDATA_PGTO_PARCELA: TDateField;
    qryRelatorioVendaPostoACESSO: TStringField;
    qryRelatorioVendaPostoSTATUSPARCELA: TStringField;
    qryRelatorioVendaPostoESTOQUEID_1: TIntegerField;
    qryRelatorioVendaPostoVALOR_COMBUSTIVEL: TFMTBCDField;
    qryRelatorioStatusParcelaVALOR_COMBUSTIVEL: TFMTBCDField;
    Label4: TLabel;
    editRepresentantePrincipal: TEdit;
    rbFechamentoPago: TRadioButton;
    rbFechamentoNaoPago: TRadioButton;
    gbPagoNaoPago: TGroupBox;
    Label1: TLabel;
    Label5: TLabel;
    editMotorista: TEdit;
    Label6: TLabel;
    editCorretor: TEdit;
    Label7: TLabel;
    editOC: TEdit;
    qryCorretor: TFDQuery;
    qryCorretorCORRETORID: TIntegerField;
    qryCorretorNOME: TStringField;
    qryCorretorCPF: TStringField;
    qryCorretorCIDADE: TStringField;
    qryMotorista: TFDQuery;
    qryMotoristaMOTORISTAID: TIntegerField;
    qryMotoristaNOME: TStringField;
    qryMotoristaCIDADE: TStringField;
    qryMotoristaCPF: TStringField;
    dsCorretor: TDataSource;
    dsMotorista: TDataSource;
    qryRelatorioStatusParcelaORDEM_CARREGAMENTO: TIntegerField;
    procedure btnImprmirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnImprimirRelAuxiliarClick(Sender: TObject);
    procedure editClienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure editRepresentanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editRepresentantePrincipalKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbFechamentoPagoClick(Sender: TObject);
    procedure rbFechamentoNaoPagoClick(Sender: TObject);
    procedure editMotoristaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editCorretorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioVenda: TfrmRelatorioVenda;

implementation

{$R *.dfm}

uses UPrincipalPetrotorque, Uposto, URepresentante, cMotorista, UMotorista,
  UCorretores;

procedure TfrmRelatorioVenda.btnConsultarClick(Sender: TObject);
begin
       if editRepresentantePrincipal.Text <> '' then
           begin
             with qryRelatorioVendaPosto do
                 begin
                       Close;
                       Sql.Clear;
                       SQL.Add('select                                                                                                                                           ');
                       SQL.Add('v.vendaid, v.representanteid, v.postoid, v.produtoid, v.motoristaid, v.corretorid, v.usinaid, v.estoqueid,                                       ');
                       SQL.Add('v.nf, v.valor_nf, v.data_emissao_nf, v.vencimento_nf_atual, v.volume, v.taxa_frete, v.valor_total_frete,                                         ');
                       SQL.Add('v.taxa_corretagem, v.valor_total_corretagem, v.valor_combustivel, V.STATUS, V.ATUALIZAR_PARCELA, v.parcelas_geradas,                             ');
                       SQL.Add('V.TOTAL_NF_RECEBIDO, V.VOLUME_TOTAL_RETIRADO, V.VALOR_RECEBIDO_MES, V.VOLUME_RECEBIDO_MES,                                                       ');
                       SQL.Add('c.nome as corretor, m.nome as motorista, p.NOME_FANTASIA as posto, pr.descricao as produto, re.nome as representante, u.NOME_FANTASIA as usina,  ');
                       SQL.Add('parc.nf as NFdeParcela, parc.parcela as ParcelaDeParcelas, PARC.VALOR_PARCELA, PARC.DATA_PARCELA AS VENCIMENTOPARCELA,                           ');
                       SQL.Add('PARC.VOLUME_PARCELADO, PARC.DOCUMENTO, PARC.DATA_PGTO_PARCELA, parc.acesso , PARC.status AS statusParcela,                                       ');
                       SQL.Add('eu.estoqueid                                                                                                                                     ');
                       SQL.Add('from                                                                                                                                             ');
                       SQL.Add('venda_para_postos v, corretor c, motorista m, posto p, produto pr, representante re, usina u, PARCELA_VENDA_PARA_POSTOS parc, estoque_usina eu   ');
                       SQL.Add('where                                                                                                                                            ');
                       SQL.Add('(v.representanteid = re.representanteid) and                                                                                                     ');
                       SQL.Add('(v.postoid = p.postoid) and                                                                                                                      ');
                       SQL.Add('(v.produtoid = pr.produtoid) and                                                                                                                 ');
                       SQL.Add('(v.motoristaid = m.motoristaid) and                                                                                                              ');
                       SQL.Add('(v.corretorid = c.corretorid) and                                                                                                                ');
                       SQL.Add('(v.usinaid = u.usinaid) and                                                                                                                      ');
                       SQL.Add('(v.vendaid = parc.vendaid) and                                                                                                                   ');
                       SQL.Add('(v.estoqueid = eu.estoqueid)                                                                                                                     ');
                       Sql.Add('and                                                                                                                                              ');

                    if rbFechamentoPago.Checked = True then
                    begin
                       Sql.Add('(parc.status = ''PAGO'') and                                                                                                                     ');
                       Sql.Add('(PARC.DATA_PGTO_PARCELA between :INICIO and :FIM) and                                                                                            ');
                    end
                   else
                       Sql.Add('(v.data_emissao_nf between :INICIO and :FIM) and                                                                                                 ');
                       Sql.Add('(re.representanteid = :representante)                                                                                                            ');
		                 Sql.Add('order by v.data_emissao_nf, nf, v.postoid  desc   	                                                                                             ');

                       ParamByName('INICIO').AsDate := StrToDate(DateVencimentoDE.EditText);
                       ParamByName('FIM').AsDate := StrToDate(DateVencimentoATE.EditText);
                       ParamByName('representante').AsInteger := qryRepresentante['REPRESENTANTEID'];
                       Open();
                 end;
           end
       else
            begin
               MessageDlg('Nenhum representante escolhido!', mtInformation, [mbOK], 0);
               editRepresentantePrincipal.SetFocus;
            end;

end;

procedure TfrmRelatorioVenda.btnImprmirClick(Sender: TObject);
  var caminhorelatorio, statusRel : string;
begin
      if qryRelatorioVendaPosto.Active = False then
      begin
         MessageDlg('Por favor, clique em consultar para gerar a impress�o!', mtInformation, [mbOK], 0);
         Exit;
      end;

      caminhoRelatorio := ExtractFilePath(Application.ExeName);
      reportVendas.LoadFromFile(caminhoRelatorio +'RelPesquisaVendasPrincipal.fr3');
      reportVendas.Variables['InicioMes']     := QuotedStr( DateVencimentoDE.Text );
      reportVendas.Variables['FimMes']        := QuotedStr( DateVencimentoATE.Text );

   if rbFechamentoPago.Checked = True then
      statusRel := 'Parcelas Pagas'
   else
      statusRel := 'Todas as Parcelas [Pagas e n�o Pagas]';

      reportVendas.Variables['STATUS_REL']    := QuotedStr( statusRel );

      reportVendas.ShowReport();
end;

procedure TfrmRelatorioVenda.btnImprimirRelAuxiliarClick(Sender: TObject);
var
   caminhoRelatorio,
   abertoFechado,
   motorista,
   ordemCarregamento,
   corretor,
   NF,
   cliente : string;
begin

      motorista          := '';
      ordemCarregamento  := '';
      corretor           := '';
      NF                 := '';
      cliente            := '';

   if rbAbertas.Checked = True then
      abertoFechado := 'PARC.DATA_PARCELA';

   if rbPagas.Checked = True then
      abertoFechado := 'PARC.DATA_PGTO_PARCELA';

   if editMotorista.Text <> '' then
      motorista := '(v.motoristaid = :motorista) and '
   else
      motorista := '';

   if editCorretor.Text <> '' then
      corretor := '(v.corretorid = :corretor) and '
   else
      corretor := '';

   if editOC.Text <> '' then
      ordemCarregamento := '(v.ordem_carregamento = :ordemCarregamento) and '
   else
      ordemCarregamento := '';

   if editNF.Text <> '' then
      NF := '(v.NF = :NF) and '
   else
      NF := '';

   if editCliente.Text <> '' then
      cliente := '(v.postoid = :posto) and'
   else
      cliente := '';


   with qryRelatorioStatusParcela do
      begin
            Close;
            SQL.Clear;
            SQL.Add('select                                                                                                                                             ');
            SQL.Add('v.vendaid, v.representanteid, v.postoid, v.produtoid, v.motoristaid, v.corretorid, v.usinaid, v.estoqueid,                                         ');
            SQL.Add('v.nf, v.valor_nf, v.data_emissao_nf, v.vencimento_nf_atual, v.volume, v.taxa_frete, v.valor_total_frete,                                           ');
            SQL.Add('v.taxa_corretagem, v.valor_total_corretagem, v.valor_combustivel, V.STATUS, V.ATUALIZAR_PARCELA, v.parcelas_geradas,                               ');
            SQL.Add('V.TOTAL_NF_RECEBIDO, V.VOLUME_TOTAL_RETIRADO, V.VALOR_RECEBIDO_MES, V.VOLUME_RECEBIDO_MES, v.ordem_carregamento,                                   ');
            SQL.Add('c.nome as corretor, m.nome as motorista, p.NOME_FANTASIA as posto, pr.descricao as produto, re.nome as representante, u.NOME_FANTASIA as usina,    ');
            SQL.Add('parc.nf as NFdeParcela, parc.parcela as ParcelaDeParcelas, PARC.VALOR_PARCELA, PARC.DATA_PARCELA AS VENCIMENTOPARCELA,                             ');
            SQL.Add('PARC.VOLUME_PARCELADO, PARC.DOCUMENTO, PARC.DATA_PGTO_PARCELA, parc.acesso , PARC.status AS statusParcela,                                         ');
            SQL.Add('eu.estoqueid                                                                                                                                       ');
            SQL.Add('from                                                                                                                                               ');
            SQL.Add('venda_para_postos v, corretor c, motorista m, posto p, produto pr, representante re, usina u, PARCELA_VENDA_PARA_POSTOS parc, estoque_usina eu     ');
            SQL.Add('where                                                                                                                                              ');
            SQL.Add('(v.representanteid = re.representanteid) and                                                                                                       ');
            SQL.Add('(v.postoid = p.postoid) and                                                                                                                        ');
            SQL.Add('(v.produtoid = pr.produtoid) and                                                                                                                   ');
            SQL.Add('(v.motoristaid = m.motoristaid) and                                                                                                                ');
            SQL.Add('(v.corretorid = c.corretorid) and                                                                                                                  ');
            SQL.Add('(v.usinaid = u.usinaid) and                                                                                                                        ');
            SQL.Add('(v.vendaid = parc.vendaid) and                                                                                                                     ');
            SQL.Add('(v.estoqueid = eu.estoqueid) and                                                                                                                   ');
            SQL.Add('(v.representanteid = :representante) and                                                                                                           ');
            SQL.Add('(PARC.STATUS = :STATUS) and                                                                                                                        ');
            SQL.Add('(' + abertoFechado + ' between :inicio and :fim) and                                                                                                   ');

            SQL.Add(ordemCarregamento);
            SQL.Add(NF);
            SQL.Add(motorista);
            SQL.Add(corretor);
            SQL.Add(cliente);
            SQL.Add('1 = 1 ');

            SQL.Add('Order by v.vendaid, v.postoid  desc                                                                                                               ');

            ParamByName('representante').AsInteger  := qryRepresentante['REPRESENTANTEID'];

         if cliente <> '' then
            ParamByName('posto').AsInteger          := qryPosto['POSTOID'];

         if editNF.Text <> '' then
            ParamByName('NF').AsInteger             := StrToInt(editNF.Text);

         if ordemCarregamento <> '' then
            ParamByName('ordemCarregamento').AsInteger := StrToInt(editOC.Text);

         if corretor <> '' then
            ParamByName('corretor').AsInteger       := qryCorretor['CORRETORID'];

         if motorista <> '' then         
            ParamByName('motorista').AsInteger      := qryMotorista['MOTORISTAID'];

         if rbAbertas.Checked = True then
            ParamByName('STATUS').AsString          := 'ABERTO';

         if rbPagas.Checked = True then
            ParamByName('STATUS').AsString          := 'PAGO';

            ParamByName('inicio').AsDate            := StrToDate(DateVencimentoDE.Text);
            ParamByName('fim').AsDate               := StrToDate(DateVencimentoATE.Text);
          Open();
      end;


          caminhoRelatorio := ExtractFilePath(Application.ExeName);
          reportStatusParcela.LoadFromFile(caminhoRelatorio + 'RelVendaStatusParcela.fr3');
          reportStatusParcela.Variables['RelDE']     :=  QuotedStr( DateVencimentoDE.Text );
          reportStatusParcela.Variables['RelATE']    :=  QuotedStr( DateVencimentoATE.Text );
       if rbAbertas.Checked = True then
          reportStatusParcela.Variables['STATUS']    :=  QuotedStr( 'abertas' );
       if rbAbertas.Checked = False then
          reportStatusParcela.Variables['STATUS']    :=  QuotedStr( 'pagas' );
         reportStatusParcela.ShowReport();

end;

procedure TfrmRelatorioVenda.editCorretorKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
      begin
        try
          Application.CreateForm( TfrmCorretores, frmCorretores );
          frmCorretores.Action := 'relatoriofechamento';
          frmCorretores.ShowModal;
        finally
           FreeAndNil( frmCorretores );
        end;
      end;

   if Key = VK_DELETE then
      Tedit(Sender).Clear;
end;

procedure TfrmRelatorioVenda.editMotoristaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_RETURN then
      begin
        try
          Application.CreateForm( TfrmMotorista, frmMotorista );
          frmMotorista.Action := 'relatoriofechamento';
          frmMotorista.ShowModal;
        finally
           FreeAndNil( frmMotorista );
        end;
      end;

   if Key = VK_DELETE then
      Tedit(Sender).Clear;
end;

procedure TfrmRelatorioVenda.editClienteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = VK_RETURN then
         begin
           try
             Application.CreateForm( TfrmPosto, frmPosto );
             frmPosto.DuploClickNaGrid := 'relatoriofechamento';
             frmPosto.ShowModal;
           finally
              FreeAndNil( frmPosto );
           end;
         end;

     if Key = VK_DELETE then
        Tedit(Sender).Clear;
end;

procedure TfrmRelatorioVenda.editRepresentanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
     try
       Application.CreateForm( TfrmRepresentante, frmRepresentante );
       frmRepresentante.Caminho := 'relatoriovendas';
       frmRepresentante.ShowModal;
       editRepresentantePrincipal.Clear;
     finally
       FreeAndNil( frmRepresentante );
     end;
end;

procedure TfrmRelatorioVenda.editRepresentantePrincipalKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_RETURN then
     begin
          try
            Application.CreateForm(TfrmRepresentante, frmRepresentante);
            frmRepresentante.Caminho := 'relatoriovendaposto';
            frmRepresentante.ShowModal;
            qryRelatorioVendaPosto.Close;
          finally
            FreeAndNil(frmRepresentante);
          end;
     end;
end;

procedure TfrmRelatorioVenda.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryPosto.Close;
  qryCorretor.Close;
  qryMotorista.Close;
end;

procedure TfrmRelatorioVenda.FormShow(Sender: TObject);
begin
 qryPosto.Open();
 qryRepresentante.Open();
 qryCorretor.Open();
 qryMotorista.Open();
 qryRepresentante.Locate('representanteid', 8, [] );
 editRepresentantePrincipal.Text := qryRepresentante['NOME'];
 rbFechamentoNaoPago.Checked := True;

 DateVencimentoDE.Text := DateToStr(Date);
 DateVencimentoATE.Text := DateToStr(Date);
end;

procedure TfrmRelatorioVenda.rbFechamentoNaoPagoClick(Sender: TObject);
begin
   qryRelatorioVendaPosto.Close;
end;

procedure TfrmRelatorioVenda.rbFechamentoPagoClick(Sender: TObject);
begin
   qryRelatorioVendaPosto.Close;
end;

end.
