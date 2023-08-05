unit UProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmProdutos = class(TForm)
    PainelTopo: TPanel;
    labelDestino: TLabel;
    editNome: TDBEdit;
    tcProduto: TFDTransaction;
    qryProduto: TFDQuery;
    dsProduto: TDataSource;
    qryProdutoPRODUTOID: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    gridProduto: TDBGrid;
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
    Image1: TImage;
    labelTitulo: TLabel;
    editLocalizar: TEdit;
    labelPesquisa: TLabel;
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure gridProdutoDblClick(Sender: TObject);
    procedure editNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editLocalizarChange(Sender: TObject);
    procedure editLocalizarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editLocalizarKeyPress(Sender: TObject; var Key: Char);
    procedure gridProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridProdutoTitleClick(Column: TColumn);
  private
    { Private declarations }

    procedure configurarEnables(status : integer);
    procedure capturarProduto;

  public
    { Public declarations }

    var TabelaCapturando : string;

  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

uses UPrincipalPetrotorque, UVendaPosto, UUsinas, UFuncoes;

procedure TfrmProdutos.btnCancelarClick(Sender: TObject);
begin
 configurarEnables(0);
 qryProduto.Cancel;
end;

procedure TfrmProdutos.btnEditarClick(Sender: TObject);
begin
 configurarEnables(1);
 qryProduto.Edit;
end;


procedure TfrmProdutos.btnExcluirClick(Sender: TObject);
 var AuxErro : string;
   begin
    configurarEnables(0);
      if MessageBox(Application.Handle,'Deseja excluir esse registro?','Confirmação',MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
           try
              qryProduto.Delete;
             except
            on E : Exception do
             begin
               AuxErro := Copy(E.Message,0,25);
               MessageDlg('Não foi possível excluir esse registro. ' + #13
                         + #13 + 'Esse produto está sendo referenciado em alguma venda.  ' + #13 + #13
                         + 'Erro Técnico: '+  AuxErro,TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
             end;
           end;
        end;
   end;



procedure TfrmProdutos.btnNovoClick(Sender: TObject);
begin
  configurarEnables(1);
  editNome.SetFocus;
  qryProduto.Insert;
end;



procedure TfrmProdutos.btnSalvarClick(Sender: TObject);
begin
      qryProduto.Post;
      configurarEnables(0);

    try
      tcProduto.CommitRetaining;
    finally
       tcProduto.RollbackRetaining;
    end;
end;

procedure TfrmProdutos.capturarProduto;
begin
     if (qryProduto.RecordCount > 0) and (TabelaCapturando = 'VENDAPOSTO')  then
    begin
      frmVendaPostos.qryProduto.Refresh;
      frmVendaPostos.editProduto.Text := qryProduto['DESCRICAO'];
      frmVendaPostos.qryProduto.Locate('produtoid', qryProduto['PRODUTOID'] , []);
      Close;
    end;

   if (qryProduto.RecordCount > 0) and (TabelaCapturando = 'USINA')  then
    begin
      frmUsinas.qryProduto.Refresh;
      frmUsinas.editProduto.Text := qryProduto['DESCRICAO'];
      frmUsinas.qryProduto.Locate('produtoid', qryProduto['PRODUTOID'] , []);
      Close;
    end;
end;

procedure TfrmProdutos.configurarEnables(status: integer);
  begin
      if status = 0 then
    begin
      btnNovo.Enabled := True;
      btnNovo.Enabled := True;
      btnExcluir.Enabled := True;
      btnCancelar.Enabled := False;
      btnSalvar.Enabled := False;
      editNome.Enabled := False;
      editLocalizar.Enabled := True;
      gridProduto.Enabled := True;
    end
   else
    begin
      btnNovo.Enabled := False;
      btnNovo.Enabled := False;
      btnExcluir.Enabled := False;
      btnCancelar.Enabled := True;
      btnSalvar.Enabled := True;
      editNome.Enabled := True;
      editLocalizar.Enabled := False;
      gridProduto.Enabled := False;
    end;
  end;



procedure TfrmProdutos.editLocalizarChange(Sender: TObject);
begin
    with qryProduto do
      begin
       Close;
       SQL.Clear;
       SQL.Add('select * from produto where descricao like ' + QuotedStr('%' + editLocalizar.Text + '%') + 'order by descricao asc');
       Open;
     end;
end;

procedure TfrmProdutos.editLocalizarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_DOWN then
     qryProduto.Next;
 if Key = VK_UP then
     qryProduto.Prior;
 if Key = VK_RETURN then
     capturarProduto;

end;

procedure TfrmProdutos.editLocalizarKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #13 then
      key := #0;
end;

procedure TfrmProdutos.editNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_F12 then
       btnSalvar.Click;
end;

procedure TfrmProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryProduto.Close;
end;



procedure TfrmProdutos.FormShow(Sender: TObject);
begin
  qryProduto.Open;
  configurarEnables(0);
  editLocalizar.SetFocus;
end;

procedure TfrmProdutos.gridProdutoDblClick(Sender: TObject);
begin
  capturarProduto;
end;

procedure TfrmProdutos.gridProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
     capturarProduto;
end;

procedure TfrmProdutos.gridProdutoTitleClick(Column: TColumn);
begin
   procGridIndex(Column);
end;

end.
