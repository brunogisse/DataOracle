unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmLogin = class(TForm)
    painelFundo: TPanel;
    painelLateral: TPanel;
    labelDesenvolvido: TLabel;
    labelVersion: TLabel;
    imagemLogo: TImage;
    labelBemVindo: TLabel;
    labelDigite: TLabel;
    painelUsuario: TPanel;
    labelNomeSistema: TLabel;
    labelUsuario: TLabel;
    editUsuario: TEdit;
    painelUnderlineUsuario: TPanel;
    painelFundoSenha: TPanel;
    labelSenha: TLabel;
    editSenha: TEdit;
    painelUnderlineSenha: TPanel;
    painelFundoConfirma: TPanel;
    painelBtnConfirma: TPanel;
    btnConfirma: TSpeedButton;
    btnTerminar: TSpeedButton;
    procedure btnTerminarClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure editUsuarioKeyPress(Sender: TObject; var Key: Char);
    procedure editSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure editUsuarioKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure ValidarUsuario( usuario, senha : string );
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;


implementation

{$R *.dfm}

uses UPrincipalPetrotorque, UdataModule;

procedure TfrmLogin.btnConfirmaClick(Sender: TObject);
begin
   ValidarUsuario( editUsuario.Text, editSenha.Text );
end;

procedure TfrmLogin.btnTerminarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.editSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
   btnConfirma.Click;
end;

procedure TfrmLogin.editSenhaKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
    Key := #0;
end;

procedure TfrmLogin.editUsuarioKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
      editSenha.SetFocus;
end;

procedure TfrmLogin.editUsuarioKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
    Key := #0;
end;

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
   painelFundo.Left := Round(( frmLogin.Width - painelFundo.Width ) / 2);
   painelFundo.Top  := Round(( frmLogin.Height - painelFundo.Height ) / 2);
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_F4 then
     Application.Terminate;
end;

procedure TfrmLogin.ValidarUsuario( usuario, senha : string );
begin

  with dm.qryLogin do
     begin
       Close;
       ParamByName('usuario').AsString := usuario;
       ParamByName('senha').AsString   := senha;
       Open();
     end;

     if dm.qryLogin.RecordCount > 0 then
    close

    else

       begin
        Application.MessageBox('Usu�rio n�o cadastrado' , '  DataOracle informa:', MB_ICONWARNING + MB_OK);
        editSenha.Clear;
        editUsuario.SetFocus;
       end;
end;

end.
