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
      FDriverID: String;

      public

      constructor Create(NomeConexao : TFDConnection);
      destructor Destroy; override;

      function fnc_conectar_banco_dados(origem : String) : Boolean;
      procedure prcGravarArquivoINI;
      procedure prc_ler_arquiivoIni;

      property Conexao  : TFDconnection Read FConexao Write Fconexao;
      property Servidor : String Read FServidor Write FServidor;
      property User     : String Read FUserName Write FUserName;
      property Senha    : String Read FSenha Write FSenha;
      property Database : String Read FDatabase Write FDatabase;
      property DriverID : String Read FDriverID Write FDriverId;
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

procedure Tconexao.prc_ler_arquiivoIni;
var
   Ini : TIniFile;
begin
   if FConexao.Connected then
      FConexao.Close;

      Ini := TIniFile.Create(System.SysUtils.ExtractFilePath(ParamStr(0))+'Config.ini');

      FDatabase := Ini.ReadString('Sistema', 'Database', '');
      FUserName := Ini.ReadString('Sistema', 'User', '');
      FSenha    := Ini.ReadString('Sistema', 'Password', '');
      FServidor := Ini.ReadString('Sistema', 'Server', '');
      FDriverID := Ini.ReadString('Sistema', 'DriverID', '');
end;

function Tconexao.fnc_conectar_banco_dados(origem : String): Boolean;
begin
   try
      if origem <> 'form' then
         prc_ler_arquiivoIni;
         Result := True;
         FConexao.Params.Strings[2] := 'Database='   + FDatabase;
         FConexao.Params.Strings[0] := 'User_Name='  + FUserName;
         FConexao.Params.Strings[1] := 'Password='   + FSenha;
         FConexao.Params.Strings[3] := 'Server='     + FServidor;
         FConexao.Params.Strings[3] := 'DriverID='   + FDriverID;
         FConexao.Connected := True;
  Except
   on E : Exception do
     begin
       showmessage('Falha na conex�o com o banco de dados ' + #13 + #13 + E.Message);
       Result := False;
     end;
  end;
end;

procedure Tconexao.prcGravarArquivoINI;
  var
    IniFile: String;
    Ini    : Tinifile;
begin
    // IniFile := ChangeFileExt( Application.Exename, '.ini' ); //cria uma copia do execut�vel e muda a extens�o para .ini
     Ini     := TIniFile.Create(System.SysUtils.ExtractFilePath(ParamStr(0))+'Config.ini');

     try
       Ini.WriteString('Sistema', 'Server', FServidor);
       Ini.WriteString('Sistema', 'User', FUserName);
       Ini.WriteString('Sistema', 'Password', FSenha);
       Ini.WriteString('Sistema', 'Database', FDatabase);
       Ini.WriteString('Sistema', 'DriverID', FDriverID);
     finally
       Ini.Free;
     end;
end;

end.
