unit cMotorista;

interface

uses Firedac.Comp.Client, FireDAC.DApt, System.SysUtils, Vcl.Graphics;

Type
   TMotorista = class
      private
          FConn : TFDConnection;
          FMOTORISTA_ID: Integer;
          FCPF: String;
          FNOME: String;
          FCIDADE: String;
      public

      constructor Create(conn : TFDConnection);

      property MOTORISTA_ID : Integer read FMOTORISTA_ID write FMOTORISTA_ID;
      property NOME : String read FNOME write FNOME;
      property CIDADE : String read FCIDADE write FCIDADE;
      property CPF : String read FCPF write FCPF;

      function Inserir(out erro : String) : Boolean;


   end;

implementation



{ TMotorista }

constructor TMotorista.Create(conn: TFDConnection);
begin
  FConn := conn;
end;



function TMotorista.Inserir(out erro: String): Boolean;
var
   qry : TFDQuery;
begin

   if NOME = '' then
        begin
           erro := 'Informe o nome do Motorista';
           Result := False;
           Exit;
        end;

       try
            try
               qry := TFDQuery.Create(nil);
               qry.Connection := FConn;

               with qry do
                  begin
                     Active := False;
                     SQL.Clear;
                     SQL.Add('INSERT INTO MOTORISTA (NOME, CIDADE, CPF) ');
                     SQL.Add('VALUES (:NOME, :CIDADE, :CPF)            ');
                     ParamByName('NOME').AsString   := NOME;
                     ParamByName('CIDADE').AsString := CIDADE;
                     ParamByName('CPF').AsString    := CPF;
                     ExecSQL;
                  end;
               Result := True;
               erro := '';
             except
               on E : exception do
               begin
                  Result := False;
                  erro := 'Erro ao inserir motorista: ' + E.Message;
               end;
            end;
       finally
         qry.DisposeOf;
       end;
end;

end.
