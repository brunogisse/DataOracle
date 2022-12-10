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
