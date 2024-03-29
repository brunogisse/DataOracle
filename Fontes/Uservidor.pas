unit Uservidor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmConfiguar_servidor = class(TForm)
    PainelTopo: TPanel;
    labelTituloEditsNF: TLabel;
    Panel2: TPanel;
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
    PainelCentral: TPanel;
    Image1: TImage;
    gbEdits: TGroupBox;
    labelDestino: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    editServidor: TEdit;
    editSenha: TEdit;
    editDatabase: TEdit;
    editUser: TEdit;
    painelBotoes: TPanel;
    painelImprimir: TPanel;
    btnImprimir: TSpeedButton;
    PainelConfirmar: TPanel;
    btnConfirmar: TSpeedButton;
    Label3: TLabel;
    lbDriverID: TLabel;
    editDriverID: TEdit;
    btnBanco: TSpeedButton;
    OpenDialog1: TOpenDialog;
    cbProtocolo: TComboBox;
    labelPorta: TLabel;
    editPorta: TEdit;
    labelProtocolo: TLabel;
    labelTextoSobreConfig: TLabel;
    Label4: TLabel;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnBancoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    PermissaoDeAcesso : Boolean;
  end;

var
  frmConfiguar_servidor: TfrmConfiguar_servidor;

implementation

{$R *.dfm}

uses UPrincipalPetrotorque, Uclasse.conexao;

procedure TfrmConfiguar_servidor.btnBancoClick(Sender: TObject);
begin
      if OpenDialog1.Execute() then;
         editDatabase.Text :=  OpenDialog1.FileName;
end;

procedure TfrmConfiguar_servidor.btnConfirmarClick(Sender: TObject);
begin
     frmMenu.novaConexao.Servidor  := editServidor.Text;
     frmMenu.novaConexao.User      := editUser.Text;
     frmMenu.novaConexao.Senha     := editSenha.Text;
     frmMenu.novaConexao.Database  := editDatabase.Text;
     frmMenu.novaConexao.DriverID  := editDriverID.Text;
     frmMenu.novaConexao.Protocol  := cbProtocolo.Text;
     frmMenu.novaConexao.Port      := editPorta.Text;

 if frmMenu.novaConexao.fnc_conectar_banco_dados('form') then
    begin
       frmMenu.novaConexao.prcGravarArquivoINI;
       ShowMessage('DataOracle - Conex�o com o banco efetuada com sucesso!');
       PermissaoDeAcesso := True;
       Close;
    end
  else
    begin
       ShowMessage('Falha na configura��o - encerrando o sistema');
       Application.Terminate;
    end;
end;

procedure TfrmConfiguar_servidor.btnImprimirClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmConfiguar_servidor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      if PermissaoDeAcesso = False then
         Application.Terminate;
end;

procedure TfrmConfiguar_servidor.FormShow(Sender: TObject);
begin
      PermissaoDeAcesso := False;
      cbProtocolo.Text := cbProtocolo.Items[0];
end;

end.
