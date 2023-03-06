unit UdataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  Tdm = class(TDataModule)
    dsLogin: TDataSource;
    qryLogin: TFDQuery;
    qryLoginUSUARIOID: TIntegerField;
    qryLoginNIVEL: TIntegerField;
    qryLoginUSUARIO: TStringField;
    qryLoginNOME: TStringField;
    qryLoginSENHA: TStringField;
    qryVencimentos: TFDQuery;
    dsVencimentos: TDataSource;
    qryVencimentosQTDE_PARCELAS: TIntegerField;
    qryVencimentosVALOR_PARCELA: TFMTBCDField;
    qryVencimentosDATA_PARCELA: TDateField;
    qryVencimentosVOLUME_PARCELADO: TFMTBCDField;
    qryVencimentosNF: TIntegerField;
    qryVencimentosEMISSAO_NF: TDateField;
    qryVencimentosPARCELA: TStringField;
    qryVencimentosSTATUS: TStringField;
    qryVencimentosPOSTOID: TIntegerField;
    qryVencimentosSTATUSVENDA: TStringField;
    qryVencimentosIDPOSTO: TIntegerField;
    qryVencimentosNOME_FANTASIA: TStringField;
    qryVencimentosBase: TFDQuery;
    IntegerField1: TIntegerField;
    FMTBCDField1: TFMTBCDField;
    DateField1: TDateField;
    FMTBCDField2: TFMTBCDField;
    IntegerField2: TIntegerField;
    DateField2: TDateField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField3: TIntegerField;
    StringField3: TStringField;
    IntegerField4: TIntegerField;
    StringField4: TStringField;
    dsVencimentosBase: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses ULogin, UPrincipalPetrotorque, UCadastroUsuario;

{$R *.dfm}

end.
