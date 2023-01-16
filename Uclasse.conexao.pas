unit Uclasse.conexao;

interface

uses
  FireDAC.Comp.Client;

  Type
    Tconexao = class
      private
      FServidor: String;
      FSenha: String;
      FDatabase: String;
      FUserName: String;
      FConexao: TFDconnection;
      public

      constructor Create(NomeConexao : TFDConnection);
      destructor Destroy; override;

      function fnc_conectar_banco_dados: Boolean;
      procedure prcGravarArquivoINI;

      property Conexao : TFDconnection Read FConexao Write Fconexao;
      property Servidor: String Read FServidor Write FServidor;
      property Database: String REad FDatabase Write FDatabase;
      property Login   : String Read FUserName Write FUserName;
      property Senha   : String Read FSenha Write FSenha;
    end;

implementation

uses
  FireDAC.Stan.Intf, System.SysUtils, Vcl.Dialogs, System.IniFiles, Vcl.Forms,
  UPrincipalPetrotorque;

{ Tconexao }

constructor Tconexao.Create(NomeConexao: TFDConnection);
begin
  FConexao := NomeConexao;
end;

destructor Tconexao.Destroy;
begin
  FConexao.Connected := False;
  inherited;
end;

function Tconexao.fnc_conectar_banco_dados: Boolean;
begin
   Result := True;
   FConexao.Params.Clear;
   FConexao.Params.Add('Server=' + FServidor);
   FConexao.Params.Add('User_name=' + FUserName);
   FConexao.Params.Add('Password=' + FSenha);
   FConexao.Params.Add('Database=' + FDatabase);
  try
   FConexao.Connected := True;
  Except
    on E : Exception do
      begin
         showmessage('N�o funcionou');
         Result := False;
      end;
  end;
end;

procedure Tconexao.prcGravarArquivoINI;
  var
    IniFile: String;
    Ini    : Tinifile;
begin
     IniFile := ChangeFileExt( Application.Exename, '.ini' );
     Ini     := TIniFile.Create( IniFile );

     try
       Ini.WriteString('Sistema', 'Servidor', FServidor);
       Ini.WriteString('Sistema', 'User_name', FUserName);
       Ini.WriteString('Sistema', 'Password', FSenha);
       Ini.WriteString('Sistema', 'Database', FDatabase);
     finally
       Ini.Free;
     end;
end;

end.
