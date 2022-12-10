unit UPesquisaVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  frxClass, frxDBSet;

type
  TfrmPesquisaVendas = class(TForm)
    PainelCentral: TPanel;
    labelTituloEditsNF: TLabel;
    gbPesquisaPosto: TGroupBox;
    rbPosto: TRadioButton;
    rbNF: TRadioButton;
    gridPesquisarVendas: TDBGrid;
    qryPesquisaVenda: TFDQuery;
    tcPesquisaVenda: TFDTransaction;
    dsPesquisaVenda: TDataSource;
    reportPesquisaVenda: TfrxReport;
    dbReportPesquisaVenda: TfrxDBDataset;
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
    qryPosto: TFDQuery;
    qryPostoPOSTOID: TIntegerField;
    qryPostoNOME_FANTASIA: TStringField;
    qryPostoRAZAO_SOCIAL: TStringField;
    qryPostoCNPJ: TStringField;
    qryProduto: TFDQuery;
    qryProdutoPRODUTOID: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    qryRepresentante: TFDQuery;
    qryRepresentanteREPRESENTANTEID: TIntegerField;
    qryRepresentanteNOME: TStringField;
    qryRepresentanteCIDADE: TStringField;
    qryRepresentanteCNPJ: TStringField;
    qryUsina: TFDQuery;
    dsCorretor: TDataSource;
    dsMotorista: TDataSource;
    dsPosto: TDataSource;
    dsProduto: TDataSource;
    dsRepresentante: TDataSource;
    dsUsina: TDataSource;
    qryPagarParcelas: TFDQuery;
    dsPagarParcelas: TDataSource;
    Edit1: TEdit;
    rbUsina: TRadioButton;
    qryUsinaUSINAID: TIntegerField;
    qryUsinaRAZAO_SOCIAL: TStringField;
    qryUsinaNOME_FANTASIA: TStringField;
    qryUsinaENDERECO: TStringField;
    qryUsinaBAIRRO: TStringField;
    qryUsinaCIDADE: TStringField;
    qryUsinaUF: TStringField;
    qryUsinaTELEFONE: TStringField;
    qryPesquisaVendaVENDAID: TIntegerField;
    qryPesquisaVendaREPRESENTANTEID: TIntegerField;
    qryPesquisaVendaPOSTOID: TIntegerField;
    qryPesquisaVendaPRODUTOID: TIntegerField;
    qryPesquisaVendaMOTORISTAID: TIntegerField;
    qryPesquisaVendaCORRETORID: TIntegerField;
    qryPesquisaVendaUSINAID: TIntegerField;
    qryPesquisaVendaNF: TIntegerField;
    qryPesquisaVendaVALOR_NF: TFMTBCDField;
    qryPesquisaVendaDATA_EMISSAO_NF: TDateField;
    qryPesquisaVendaVENCIMENTO_NF_ATUAL: TDateField;
    qryPesquisaVendaVOLUME: TFMTBCDField;
    qryPesquisaVendaTAXA_FRETE: TBCDField;
    qryPesquisaVendaVALOR_TOTAL_FRETE: TFMTBCDField;
    qryPesquisaVendaTAXA_CORRETAGEM: TBCDField;
    qryPesquisaVendaVALOR_TOTAL_CORRETAGEM: TFMTBCDField;
    qryPesquisaVendaSTATUS: TStringField;
    qryPesquisaVendaATUALIZAR_PARCELA: TIntegerField;
    qryPesquisaVendaPARCELAS_GERADAS: TStringField;
    qryPesquisaVendaTOTAL_NF_RECEBIDO: TFMTBCDField;
    qryPesquisaVendaVOLUME_TOTAL_RETIRADO: TFMTBCDField;
    qryPesquisaVendaVALOR_RECEBIDO_MES: TFMTBCDField;
    qryPesquisaVendaVOLUME_RECEBIDO_MES: TFMTBCDField;
    qryPagarParcelasPARCELAID: TFDAutoIncField;
    qryPagarParcelasVENDAID: TIntegerField;
    qryPagarParcelasFORMA_PGTO_ID: TIntegerField;
    qryPagarParcelasSTATUS: TStringField;
    qryPagarParcelasQTDE_PARCELAS: TIntegerField;
    qryPagarParcelasVALOR_TOTAL_NF: TFMTBCDField;
    qryPagarParcelasVALOR_PARCELA: TFMTBCDField;
    qryPagarParcelasDATA_PARCELA: TDateField;
    qryPagarParcelasVOLUME_VENDA_TOTAL: TFMTBCDField;
    qryPagarParcelasVOLUME_PARCELADO: TFMTBCDField;
    qryPagarParcelasDOCUMENTO: TStringField;
    qryPagarParcelasVOLUME_RESTANTE: TFMTBCDField;
    qryPagarParcelasNF: TIntegerField;
    qryPagarParcelasEMISSAO_NF: TDateField;
    qryPagarParcelasACESSO: TStringField;
    qryPagarParcelasPARCELA: TStringField;
    qryPagarParcelasDATA_PGTO_PARCELA: TDateField;
    gbPeriodo: TGroupBox;
    labelDe: TLabel;
    labelATE: TLabel;
    DateVencimentoDE: TMaskEdit;
    DateVencimentoATE: TMaskEdit;
    painelFundobtn: TPanel;
    PainelConsultar: TPanel;
    btnConsultar: TSpeedButton;
    qryPesquisaVendaVALOR_COMBUSTIVEL: TFMTBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisaVendas: TfrmPesquisaVendas;

implementation

{$R *.dfm}

uses UPrincipalPetrotorque;

procedure TfrmPesquisaVendas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
qryPesquisaVenda.Close;
qryPagarParcelas.Close;
end;

procedure TfrmPesquisaVendas.FormShow(Sender: TObject);
begin
qryPesquisaVenda.Open();
qryPagarParcelas.Open();
end;

end.
