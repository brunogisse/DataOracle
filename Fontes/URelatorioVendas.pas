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
    btnPagarParcelaStatus: TSpeedButton;
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
    editPesquisa: TEdit;
    labelCliente: TLabel;
    dsPosto: TDataSource;
    qryPosto: TFDQuery;
    qryPostoPOSTOID: TFDAutoIncField;
    qryPostoNOME_FANTASIA: TStringField;
    qryPostoRAZAO_SOCIAL: TStringField;
    qryPostoCNPJ: TStringField;
    cbCliente: TCheckBox;
    qryRelatorioStatusParcelaESTOQUEID: TIntegerField;
    qryRepresentante: TFDQuery;
    dsRepresentante: TDataSource;
    qryRepresentanteREPRESENTANTEID: TIntegerField;
    qryRepresentanteNOME: TStringField;
    qryRepresentanteCIDADE: TStringField;
    qryRepresentanteCNPJ: TStringField;
    qryRelatorioStatusParcelaESTOQUEID_1: TIntegerField;
    Label3: TLabel;
    cbNF: TCheckBox;
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
    procedure btnImprmirClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure btnPagarParcelaStatusClick(Sender: TObject);
    procedure editPesquisaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cbClienteClick(Sender: TObject);
    procedure editRepresentanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbNFClick(Sender: TObject);
    procedure editRepresentantePrincipalKeyDown(Sender: TObject; var Key: Word;
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

uses UPrincipalPetrotorque, Uposto, URepresentante;



procedure TfrmRelatorioVenda.btnConsultarClick(Sender: TObject);
begin
   if editRepresentantePrincipal.Text <> '' then
         begin
             with qryRelatorioVendaPosto do
                 begin
                       Close;
                       Sql.Clear;
                       SQL.Add('select  ');
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
                       Sql.Add('(PARC.DATA_PARCELA between :INICIO and :FIM) and                                                                                                 ');
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
  var caminhorelatorio : string;
begin

         caminhoRelatorio := ExtractFilePath(Application.ExeName);
         reportVendas.LoadFromFile(caminhoRelatorio +'RelPesquisaVendasPrincipal.fr3');
         reportVendas.Variables['InicioMes']     :=  QuotedStr( DateVencimentoDE.Text );
         reportVendas.Variables['FimMes']        :=  QuotedStr( DateVencimentoATE.Text );
         reportVendas.ShowReport();


end;

procedure TfrmRelatorioVenda.btnPagarParcelaStatusClick(Sender: TObject);
var caminhoRelatorio, abertoFechado : string;
begin

      if rbAbertas.Checked = True then
         abertoFechado := 'PARC.DATA_PARCELA';
      if rbPagas.Checked = True then
         abertoFechado := 'PARC.DATA_PGTO_PARCELA';

    if (cbCliente.Checked = True)  and (editPesquisa.Text <> '') and  (cbNF.Checked = True) and (editNF.Text <> '') then

       begin
         with qryRelatorioStatusParcela do
            begin
             Close;
             SQL.Clear;
             SQL.Add(' select v.vendaid, v.representanteid, v.postoid, v.produtoid, v.motoristaid, v.corretorid, v.usinaid, v.estoqueid, '
                + 'v.nf, v.valor_nf, v.data_emissao_nf, v.vencimento_nf_atual, v.volume, v.taxa_frete, v.valor_total_frete, '
                + ' v.taxa_corretagem, v.valor_total_corretagem, v.valor_combustivel, V.STATUS, V.ATUALIZAR_PARCELA, '
                + '  v.parcelas_geradas, V.TOTAL_NF_RECEBIDO, V.VOLUME_TOTAL_RETIRADO, V.VALOR_RECEBIDO_MES, V.VOLUME_RECEBIDO_MES, '
                + ' c.nome as corretor, m.nome as motorista, p.NOME_FANTASIA as posto, pr.descricao as produto, re.nome as representante, '
                + ' u.NOME_FANTASIA as usina, '
                + ' parc.nf as NFdeParcela, parc.parcela as ParcelaDeParcelas, PARC.VALOR_PARCELA, PARC.DATA_PARCELA AS VENCIMENTOPARCELA, '
                + ' PARC.VOLUME_PARCELADO, PARC.DOCUMENTO, PARC.DATA_PGTO_PARCELA, parc.acesso , PARC.status AS statusParcela, eu.estoqueid '
                + ' from '
                + ' venda_para_postos v, corretor c, motorista m, posto p, produto pr, '
                + ' representante re, usina u, PARCELA_VENDA_PARA_POSTOS parc,  estoque_usina eu '
                + ' where '
                + ' (v.representanteid = re.representanteid) and '
                + ' (v.postoid = p.postoid) and '
                + ' (v.produtoid = pr.produtoid) and '
                + ' (v.motoristaid = m.motoristaid) and '
                + ' (v.corretorid = c.corretorid) and '
                + ' (v.usinaid = u.usinaid) and '
                + ' (v.vendaid = parc.vendaid) and '
                + ' (v.estoqueid = eu.estoqueid) and '
                + ' (parc.status = :STATUS) and '
                + ' (p.postoid = :POSTO) and '
                + ' (re.representanteid = :representante) and '
                + ' (v.nf = :NF) and '
                + ' (v.data_emissao_nf between :inicio and :fim)'
                + ' order by v.data_emissao_nf, nf, v.postoid  desc');
                    ParamByName('posto').AsInteger          := qryPosto['POSTOID'];
                    ParamByName('representante').AsInteger  := qryRepresentante['REPRESENTANTEID'];
                    ParamByName('NF').AsInteger             := StrToInt(editNF.Text);
                 if rbAbertas.Checked = True then
                    ParamByName('STATUS').AsString          := 'ABERTO';
                 if rbPagas.Checked = True then
                    ParamByName('STATUS').AsString          := 'PAGO';
                    ParamByName('inicio').AsDate            := StrToDate(DateVencimentoDE.Text);
                    ParamByName('fim').AsDate               := StrToDate(DateVencimentoATE.Text);
               Open();
            end;
       end;

   if (cbCliente.Checked = True)  and (editPesquisa.Text <> '')  and (cbNF.Checked = False) then
       begin
         with qryRelatorioStatusParcela do
            begin
             Close;
             SQL.Clear;
             SQL.Add(' select v.vendaid, v.representanteid, v.postoid, v.produtoid, v.motoristaid, v.corretorid, v.usinaid, v.estoqueid, '
                + 'v.nf, v.valor_nf, v.data_emissao_nf, v.vencimento_nf_atual, v.volume, v.taxa_frete, v.valor_total_frete, '
                + ' v.taxa_corretagem, v.valor_total_corretagem, v.valor_combustivel, V.STATUS, V.ATUALIZAR_PARCELA, '
                + '  v.parcelas_geradas, V.TOTAL_NF_RECEBIDO, V.VOLUME_TOTAL_RETIRADO, V.VALOR_RECEBIDO_MES, V.VOLUME_RECEBIDO_MES, '
                + ' c.nome as corretor, m.nome as motorista, p.NOME_FANTASIA as posto, pr.descricao as produto, re.nome as representante, '
                + ' u.NOME_FANTASIA as usina, '
                + ' parc.nf as NFdeParcela, parc.parcela as ParcelaDeParcelas, PARC.VALOR_PARCELA, PARC.DATA_PARCELA AS VENCIMENTOPARCELA, '
                + ' PARC.VOLUME_PARCELADO, PARC.DOCUMENTO, PARC.DATA_PGTO_PARCELA, parc.acesso , PARC.status AS statusParcela, eu.estoqueid '
                + ' from '
                + ' venda_para_postos v, corretor c, motorista m, posto p, produto pr, '
                + ' representante re, usina u, PARCELA_VENDA_PARA_POSTOS parc,  estoque_usina eu '
                + ' where '
                + ' (v.representanteid = re.representanteid) and '
                + ' (v.postoid = p.postoid) and '
                + ' (v.produtoid = pr.produtoid) and '
                + ' (v.motoristaid = m.motoristaid) and '
                + ' (v.corretorid = c.corretorid) and '
                + ' (v.usinaid = u.usinaid) and '
                + ' (v.vendaid = parc.vendaid) and '
                + ' (v.estoqueid = eu.estoqueid) and '
                + ' (parc.status = :STATUS) and '
                + ' (v.representanteid = :REPRESENTANTE) and '
                + ' (p.postoid = :POSTO) and '
                + ' (v.data_emissao_nf between :inicio and :fim)'
                + ' order by v.data_emissao_nf, nf, v.postoid  desc');
                    ParamByName('posto').AsInteger          := qryPosto['POSTOID'];
                 if rbAbertas.Checked = True then
                    ParamByName('STATUS').AsString          := 'ABERTO';
                 if rbPagas.Checked = True then
                    ParamByName('STATUS').AsString          := 'PAGO';
                    ParamByName('inicio').AsDate            := StrToDate(DateVencimentoDE.Text);
                    ParamByName('fim').AsDate               := StrToDate(DateVencimentoATE.Text);
                    ParamByName('REPRESENTANTE').AsInteger  := qryRepresentante['REPRESENTANTEID'];
               Open();
            end;
       end;

    if (cbCliente.Checked = False) and (cbNF.Checked = False) then
       begin
         with qryRelatorioStatusParcela do
            begin
             Close;
             SQL.Clear;
             SQL.Add(' select v.vendaid, v.representanteid, v.postoid, v.produtoid, v.motoristaid, v.corretorid, v.usinaid, v.estoqueid, '
                + 'v.nf, v.valor_nf, v.data_emissao_nf, v.vencimento_nf_atual, v.volume, v.taxa_frete, v.valor_total_frete, '
                + ' v.taxa_corretagem, v.valor_total_corretagem, v.valor_combustivel, V.STATUS, V.ATUALIZAR_PARCELA, '
                + '  v.parcelas_geradas, V.TOTAL_NF_RECEBIDO, V.VOLUME_TOTAL_RETIRADO, V.VALOR_RECEBIDO_MES, V.VOLUME_RECEBIDO_MES, '
                + ' c.nome as corretor, m.nome as motorista, p.NOME_FANTASIA as posto, pr.descricao as produto, re.nome as representante, '
                + ' u.NOME_FANTASIA as usina, '
                + ' parc.nf as NFdeParcela, parc.parcela as ParcelaDeParcelas, PARC.VALOR_PARCELA, PARC.DATA_PARCELA AS VENCIMENTOPARCELA, '
                + ' PARC.VOLUME_PARCELADO, PARC.DOCUMENTO, PARC.DATA_PGTO_PARCELA, parc.acesso , PARC.status AS statusParcela, eu.estoqueid '
                + ' from '
                + ' venda_para_postos v, corretor c, motorista m, posto p, produto pr, '
                + ' representante re, usina u, PARCELA_VENDA_PARA_POSTOS parc,  estoque_usina eu '
                + ' where '
                + ' (v.representanteid = re.representanteid) and '
                + ' (v.postoid = p.postoid) and '
                + ' (v.produtoid = pr.produtoid) and '
                + ' (v.motoristaid = m.motoristaid) and '
                + ' (v.corretorid = c.corretorid) and '
                + ' (v.usinaid = u.usinaid) and '
                + ' (v.vendaid = parc.vendaid) and '
                + ' (v.estoqueid = eu.estoqueid) and '
                + ' (parc.status = :STATUS) and '
                + ' (v.representanteid = :REPRESENTANTE) and '
                + ' ('+abertoFechado+' between :inicio and :fim) '
                + ' order by v.data_emissao_nf, nf, v.postoid  desc');
                 if rbAbertas.Checked = True then
                    ParamByName('STATUS').AsString          := 'ABERTO';
                 if rbPagas.Checked = True then
                    ParamByName('STATUS').AsString          := 'PAGO';
                    ParamByName('inicio').AsDate            := StrToDate(DateVencimentoDE.Text);
                    ParamByName('fim').AsDate               := StrToDate(DateVencimentoATE.Text);
                    ParamByName('REPRESENTANTE').AsInteger  := qryRepresentante['REPRESENTANTEID'];
               Open();
            end;
       end;


       if (cbCliente.Checked = False)   and (cbNF.Checked = True)  then
       begin
         with qryRelatorioStatusParcela do
            begin
             Close;
             SQL.Clear;
             SQL.Add(' select v.vendaid, v.representanteid, v.postoid, v.produtoid, v.motoristaid, v.corretorid, v.usinaid, v.estoqueid, '
                + 'v.nf, v.valor_nf, v.data_emissao_nf, v.vencimento_nf_atual, v.volume, v.taxa_frete, v.valor_total_frete, '
                + ' v.taxa_corretagem, v.valor_total_corretagem, v.valor_combustivel, V.STATUS, V.ATUALIZAR_PARCELA, '
                + '  v.parcelas_geradas, V.TOTAL_NF_RECEBIDO, V.VOLUME_TOTAL_RETIRADO, V.VALOR_RECEBIDO_MES, V.VOLUME_RECEBIDO_MES, '
                + ' c.nome as corretor, m.nome as motorista, p.NOME_FANTASIA as posto, pr.descricao as produto, re.nome as representante, '
                + ' u.NOME_FANTASIA as usina, '
                + ' parc.nf as NFdeParcela, parc.parcela as ParcelaDeParcelas, PARC.VALOR_PARCELA, PARC.DATA_PARCELA AS VENCIMENTOPARCELA, '
                + ' PARC.VOLUME_PARCELADO, PARC.DOCUMENTO, PARC.DATA_PGTO_PARCELA, parc.acesso , PARC.status AS statusParcela, eu.estoqueid '
                + ' from '
                + ' venda_para_postos v, corretor c, motorista m, posto p, produto pr, '
                + ' representante re, usina u, PARCELA_VENDA_PARA_POSTOS parc,  estoque_usina eu '
                + ' where '
                + ' (v.representanteid = re.representanteid) and '
                + ' (v.postoid = p.postoid) and '
                + ' (v.produtoid = pr.produtoid) and '
                + ' (v.motoristaid = m.motoristaid) and '
                + ' (v.corretorid = c.corretorid) and '
                + ' (v.usinaid = u.usinaid) and '
                + ' (v.vendaid = parc.vendaid) and '
                + ' (v.estoqueid = eu.estoqueid) and '
                + ' (parc.status = :STATUS) and '
                + ' (v.NF = :NF) and '
                + ' (v.representanteid = :REPRESENTANTE) and '
                + ' (v.data_emissao_nf between :inicio and :fim)'
                + ' order by v.data_emissao_nf, nf, v.postoid  desc');
                    ParamByName('NF').AsInteger             := StrToInt(editNF.Text);
                    ParamByName('REPRESENTANTE').AsInteger  := qryRepresentante['REPRESENTANTEID'];
                 if rbAbertas.Checked = True then
                    ParamByName('STATUS').AsString          := 'ABERTO';
                 if rbPagas.Checked = True then
                    ParamByName('STATUS').AsString          := 'PAGO';
                    ParamByName('inicio').AsDate            := StrToDate(DateVencimentoDE.Text);
                    ParamByName('fim').AsDate               := StrToDate(DateVencimentoATE.Text);
               Open();
            end;
       end;


       if (cbCliente.Checked = True) and (cbNF.Checked = True)  then
       begin
         with qryRelatorioStatusParcela do
            begin
             Close;
             SQL.Clear;
             SQL.Add(' select v.vendaid, v.representanteid, v.postoid, v.produtoid, v.motoristaid, v.corretorid, v.usinaid, v.estoqueid, '
                + 'v.nf, v.valor_nf, v.data_emissao_nf, v.vencimento_nf_atual, v.volume, v.taxa_frete, v.valor_total_frete, '
                + ' v.taxa_corretagem, v.valor_total_corretagem, v.valor_combustivel, V.STATUS, V.ATUALIZAR_PARCELA, '
                + '  v.parcelas_geradas, V.TOTAL_NF_RECEBIDO, V.VOLUME_TOTAL_RETIRADO, V.VALOR_RECEBIDO_MES, V.VOLUME_RECEBIDO_MES, '
                + ' c.nome as corretor, m.nome as motorista, p.NOME_FANTASIA as posto, pr.descricao as produto, re.nome as representante, '
                + ' u.NOME_FANTASIA as usina, '
                + ' parc.nf as NFdeParcela, parc.parcela as ParcelaDeParcelas, PARC.VALOR_PARCELA, PARC.DATA_PARCELA AS VENCIMENTOPARCELA, '
                + ' PARC.VOLUME_PARCELADO, PARC.DOCUMENTO, PARC.DATA_PGTO_PARCELA, parc.acesso , PARC.status AS statusParcela, eu.estoqueid '
                + ' from '
                + ' venda_para_postos v, corretor c, motorista m, posto p, produto pr, '
                + ' representante re, usina u, PARCELA_VENDA_PARA_POSTOS parc,  estoque_usina eu '
                + ' where '
                + ' (v.representanteid = re.representanteid) and '
                + ' (v.postoid = p.postoid) and '
                + ' (v.produtoid = pr.produtoid) and '
                + ' (v.motoristaid = m.motoristaid) and '
                + ' (v.corretorid = c.corretorid) and '
                + ' (v.usinaid = u.usinaid) and '
                + ' (v.vendaid = parc.vendaid) and '
                + ' (v.estoqueid = eu.estoqueid) and '
                + ' (parc.status = :STATUS) and '
                + ' (v.postoid = :POSTO) and '
                + ' (v.nf = :NF) and '
                + ' (v.representanteid = :REPRESENTANTE) and '
                + ' (v.data_emissao_nf between :inicio and :fim)'
                + ' order by v.data_emissao_nf, nf, v.postoid  desc');
                    ParamByName('NF').AsInteger             := StrToInt(editNF.Text);
                    ParamByName('REPRESENTANTE').AsInteger  := qryRepresentante['REPRESENTANTEID'];
                    ParamByName('POSTO').AsInteger          := qryPosto['POSTOID'];
                 if rbAbertas.Checked = True then
                    ParamByName('STATUS').AsString          := 'ABERTO';
                 if rbPagas.Checked = True then
                    ParamByName('STATUS').AsString          := 'PAGO';
                    ParamByName('inicio').AsDate            := StrToDate(DateVencimentoDE.Text);
                    ParamByName('fim').AsDate               := StrToDate(DateVencimentoATE.Text);
               Open();
            end;
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

procedure TfrmRelatorioVenda.cbClienteClick(Sender: TObject);
begin
 if cbCliente.Checked = True then
     begin
       labelCliente.Visible := True;
       editPesquisa.Visible := True;
       editPesquisa.Clear;
       editPesquisa.SetFocus;
     end;
 if cbCliente.Checked = False then
     begin
      labelCliente.Visible := False;
      editPesquisa.Visible := False;
     end;
end;

procedure TfrmRelatorioVenda.cbNFClick(Sender: TObject);
begin
if cbNF.Checked = True then
     begin
       labelNF.Visible := True;
       editNF.Visible  := True;
       editNF.Clear;
       editNF.SetFocus;
     end;
 if cbNF.Checked = False then
     begin
       labelNF.Visible := False;
       editNF.Visible  := False;
     end;
end;

procedure TfrmRelatorioVenda.editPesquisaKeyDown(Sender: TObject; var Key: Word;
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
end;

procedure TfrmRelatorioVenda.FormShow(Sender: TObject);
begin
 qryPosto.Open();
 qryRepresentante.Open();
 qryRepresentante.Locate('representanteid', 6, [] );
 editRepresentantePrincipal.Text := qryRepresentante['NOME'];
 rbFechamentoNaoPago.Checked := True;

 DateVencimentoDE.Text := DateToStr(Date);
 DateVencimentoATE.Text := DateToStr(Date);
end;

end.
