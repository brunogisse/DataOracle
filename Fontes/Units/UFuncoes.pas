unit UFuncoes;

interface

function Criptografia(Senha, Chave: String): String;
function MD5(const Value: String): String;
procedure procGridIndex(Sender: TObject);

implementation

uses
   Windows, Messages, Dialogs, SysUtils, StrUtils, IdHashMessageDigest,
   FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
   FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
   FireDAC.Comp.DataSet, FireDAC.Comp.Client,
   {cxGridTableView, cxGridDBTableView, cxGrid,}
   Data.DB, Datasnap.DBClient,
   Vcl.Grids, Vcl.DBGrids;


function Criptografia(Senha, Chave: String): String;
var
   x, y: Integer;
   NovaSenha: String;
begin
   for x := 1 to Length(Chave) do
   begin
      NovaSenha := '';

      for y := 1 to Length(Senha) do
      begin
         NovaSenha := NovaSenha + Chr((Ord(Chave[x]) xor Ord(Senha[y])));
      end;

      Senha := NovaSenha;
   end;

   Result := Senha;
end;

function MD5(const Value: String): String;
var
   xMD5: TIdHashMessageDigest5;
begin
   xMD5 := TIdHashMessageDigest5.Create;

   try
      Result := LowerCase(xMD5.HashStringAsHex(Value));
   finally
      xMD5.Free;
   end;
end;

procedure procGridIndex(Sender: TObject);
// Uses necess�rias ----------------------------------------------------------
// FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
// FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
// FireDAC.Comp.DataSet, FireDAC.Comp.Client,
// cxGridTableView, cxGridDBTableView, cxGrid,
// Data.DB, Datasnap.DBClient,
// Vcl.Grids, Vcl.DBGrids;
// ---------------------------------------------------------------------------
// No cxGrid
// procGridIndex(AColumn);
// ---------------------------------------------------------------------------
// No dbGrid
// procGridIndex(Column);
// ---------------------------------------------------------------------------
// Componentes que aceita ordena��o Crescente e Decrescente
// TClientDataSet
// TFDMemTable
// TFDQuery
// ---------------------------------------------------------------------------
var
  strCampo: string;
  qry: TFDQuery;
  procedure procIndexTFDQuery(qry: TFDQuery; strCampo: string);
  begin
    if (qry.IndexFieldNames = '') then
      qry.IndexFieldNames := strCampo
    else
    begin
      if (qry.IndexFieldNames = strCampo) then
        qry.IndexFieldNames := strCampo + ':D'
      else if (qry.IndexFieldNames = strCampo + ':D') then
        qry.IndexFieldNames := strCampo
      else
        qry.IndexFieldNames := strCampo;
    end;
  end;
//--- a parte acima � declara��o no escopo de vari�vel-------------

begin
  if (Sender <> nil) then
  begin
    if (Sender is TColumn) then
    begin
  if (TColumn(Sender).Grid.DataSource.DataSet is TFDQuery) then
      begin
        qry := (TColumn(Sender).Grid.DataSource.DataSet as TFDQuery);
        strCampo := TColumn(Sender).FieldName;
        procIndexTFDQuery(qry, strCampo);
      end;
    end;
  end;
end;

end.
