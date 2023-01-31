unit UdefinirEstoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.StdCtrls;

type
  TfrmDefinirEstoque = class(TForm)
    gbUsina: TGroupBox;
    labelDefinirEstoque: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    painelClasseCancelar: TPanel;
    painelCancelar: TPanel;
    btnCancelar: TSpeedButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDefinirEstoque: TfrmDefinirEstoque;

implementation

{$R *.dfm}

uses UselecionarUsinaEproduto;

end.
