unit UCadastroUsuario;

interface

uses
   Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
   System.Classes, Vcl.Graphics,
   Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
   Vcl.Buttons,
   Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Stan.Intf, FireDAC.Comp.Client,
   FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
   FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
   FireDAC.Comp.DataSet;

type
   TfrmCadastroUsuario = class(TForm)
      painelFundo: TPanel;
      labelTitulo: TLabel;
      painelUnderline: TPanel;
      painelFundoConfirma: TPanel;
      painelBtnConfirma: TPanel;
      btnConfirma: TSpeedButton;
      PainelCancelar: TPanel;
      btnCancelar: TSpeedButton;
      painelEditar: TPanel;
      btnEditar: TSpeedButton;
      PainelExcluir: TPanel;
      btnExcluir: TSpeedButton;
      painelNovo: TPanel;
      painelBtnNovo: TPanel;
      btnNovo: TSpeedButton;
      DBGrid1: TDBGrid;
      tcCadastroUsuario: TFDTransaction;
      dsusuario: TDataSource;
      qryUsuario: TFDQuery;
      qryUsuarioUSUARIOID: TIntegerField;
      qryUsuarioNIVEL: TIntegerField;
      qryUsuarioUSUARIO: TStringField;
      qryUsuarioNOME: TStringField;
      qryUsuarioSENHA: TStringField;
      painelEdits: TPanel;
      labelNomeUsuario: TLabel;
      editUsuario: TEdit;
      labelNome: TLabel;
      editNome: TEdit;
      labelPermissao: TLabel;
      cbNivel: TComboBox;
      editSenha: TEdit;
      labelSenha: TLabel;
      labelConfirmarSenha: TLabel;
      editConfirmarSenha: TEdit;
      procedure btnCancelarClick(Sender: TObject);
      procedure btnConfirmaClick(Sender: TObject);
      procedure btnNovoClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure btnEditarClick(Sender: TObject);
      procedure btnExcluirClick(Sender: TObject);
   private
      { Private declarations }

      procedure ConfiguarEnables(status: integer);

   public
      { Public declarations }
   end;

var
   frmCadastroUsuario: TfrmCadastroUsuario;

implementation

{$R *.dfm}

uses UPrincipalPetrotorque, UdataModule, UFuncoes;

procedure TfrmCadastroUsuario.btnCancelarClick(Sender: TObject);
begin
    if MessageBox(Application.Handle,'Deseja realmente sair?' , 'Confirma��o', MB_YESNO + MB_ICONQUESTION) = mrYes then
       Close;
end;

procedure TfrmCadastroUsuario.btnConfirmaClick(Sender: TObject);
begin

   if (editSenha.Text = editConfirmarSenha.Text) and (editSenha.Text <> '') and
     (editConfirmarSenha.Text <> '') then
   begin
      qryUsuario['NIVEL'] := cbNivel.ItemIndex + 1;
      qryUsuario['USUARIO'] := editUsuario.Text;
      qryUsuario['NOME'] := editNome.Text;
      qryUsuario['SENHA'] := MD5(editSenha.Text);
      qryUsuario.Post;
      try
         tcCadastroUsuario.CommitRetaining;
      finally
         tcCadastroUsuario.RollbackRetaining;
      end;

      qryUsuario.Close;
      qryUsuario.Open();

      editUsuario.Clear;
      editSenha.Clear;
      editConfirmarSenha.Clear;
      editNome.Clear;

      ConfiguarEnables(1);
   end
   else
   begin
      ShowMessage('As senhas digitadas n�o s�o iguais');
      editSenha.SetFocus;
   end;
end;

procedure TfrmCadastroUsuario.btnEditarClick(Sender: TObject);
begin

   ConfiguarEnables(0);

   editUsuario.Text := qryUsuario['USUARIO'];
   editNome.Text := qryUsuario['NOME'];
   cbNivel.ItemIndex := qryUsuario['NIVEL'] - 1;
   cbNivel.Text := IntToStr(qryUsuario['NIVEL']);

   qryUsuario.Edit;

end;

procedure TfrmCadastroUsuario.btnExcluirClick(Sender: TObject);
var
   ErrorMsg: String;
begin

   if qryUsuario.RecordCount = 1  then
   begin
     MessageDlg('Imposs�vel excluir o usu�rio.' +
              #13 + 'Motivo: Ao menos um usu�rio deve permanecer cadastrado.' + ErrorMsg,
              TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
     Exit;
   end;


   if MessageBox(Application.Handle,'Deseja excluir esse usu�rio?' , 'Confirma��o', MB_YESNO + MB_ICONQUESTION) = mrYes then
      try
         qryUsuario.Delete;
      except
         on E: Exception do
         begin
            ErrorMsg := Copy(E.Message, 1, 500);
            MessageDlg('Erro ao excluir usu�rio.' +
              #13 + 'Motivo: ' + ErrorMsg,
              TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
         end;
      end;

end;

procedure TfrmCadastroUsuario.btnNovoClick(Sender: TObject);
begin
   ConfiguarEnables(0);
   editUsuario.SetFocus;
   qryUsuario.Insert;

end;

procedure TfrmCadastroUsuario.ConfiguarEnables(status: integer);
begin
   if status = 0 then
   begin
      painelEdits.Enabled := true;
      painelBtnNovo.Enabled := False;
     // PainelCancelar.Enabled := True;
      PainelExcluir.Enabled := False;
      painelEditar.Enabled := False;
   end;
   if status = 1 then
   begin
      painelBtnNovo.Enabled := true;
      painelEdits.Enabled := False;
   //   PainelCancelar.Enabled := False;
      PainelExcluir.Enabled := True;
      painelEditar.Enabled := True;
   end;
end;

procedure TfrmCadastroUsuario.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qryUsuario.Close;
end;

procedure TfrmCadastroUsuario.FormShow(Sender: TObject);
begin
   qryUsuario.Open();
   ConfiguarEnables(1);
end;

initialization

RegisterClass(TfrmCadastroUsuario);

finalization

UnRegisterClass(TfrmCadastroUsuario);

end.
