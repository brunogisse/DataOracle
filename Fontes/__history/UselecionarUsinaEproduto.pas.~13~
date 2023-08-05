unit UselecionarUsinaEproduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.Imaging.pngimage;



type
   TdbGridPadrao = class(TDBGrid);
  TfrmSelecionarEstoqueProduto = class(TForm)
    Panel1: TPanel;
    qryUsina: TFDQuery;
    dsUsina: TDataSource;
    qryEstoqueUsina: TFDQuery;
    dsEstoqueUsina: TDataSource;
    qryProduto: TFDQuery;
    qryProdutoPRODUTOID: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    dsProduto: TDataSource;
    painelGrids: TPanel;
    painelSeparacao: TPanel;
    gbUsina: TGroupBox;
    editPesquisaUsina: TEdit;
    painelBotoes: TPanel;
    painelBtnAdicionar: TPanel;
    btnAdicionar: TSpeedButton;
    PainelNovaUsina: TPanel;
    btnConsultar: TSpeedButton;
    qryUsinaUSINAID: TFDAutoIncField;
    qryUsinaRAZAO_SOCIAL: TStringField;
    qryUsinaNOME_FANTASIA: TStringField;
    qryUsinaENDERECO: TStringField;
    qryUsinaBAIRRO: TStringField;
    qryUsinaCIDADE: TStringField;
    qryUsinaUF: TStringField;
    qryUsinaTELEFONE: TStringField;
    gridUsina: TDBGrid;
    painelGridEstoque: TPanel;
    gridEstoqueUsina: TDBGrid;
    Image1: TImage;
    rbNomeFantasia: TRadioButton;
    rbRazaoSocial: TRadioButton;
    rbCidade: TRadioButton;
    qryEstoqueUsinaESTOQUEID: TFDAutoIncField;
    qryEstoqueUsinaUSINAID: TIntegerField;
    qryEstoqueUsinaPRODUTOID: TIntegerField;
    qryEstoqueUsinaREPRESENTANTEID: TIntegerField;
    qryEstoqueUsinaESTOQUE: TFMTBCDField;
    qryEstoqueUsinaPRODUTOID_1: TIntegerField;
    qryEstoqueUsinaDESCRICAO: TStringField;
    qryEstoqueUsinaREPRESENTANTEID_1: TIntegerField;
    qryEstoqueUsinaNOME: TStringField;
    qryRepresentante: TFDQuery;
    dsRepresentante: TDataSource;
    qryRepresentanteREPRESENTANTEID: TIntegerField;
    qryRepresentanteNOME: TStringField;
    qryRepresentanteCIDADE: TStringField;
    qryRepresentanteCNPJ: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure editPesquisaUsinaChange(Sender: TObject);
    procedure rbNomeFantasiaClick(Sender: TObject);
    procedure rbRazaoSocialClick(Sender: TObject);
    procedure rbCidadeClick(Sender: TObject);
    procedure editPesquisaUsinaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editPesquisaUsinaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }


    procedure definirTamanhoDaLinhaDaGrid;

    procedure AbrirQuerryUsina;
  public
    { Public declarations }

   var
      caminhoEntrega, transferenciaDePara : string;

   procedure CapturarUsinaeEstoque( caminho : string );

  end;

var
  frmSelecionarEstoqueProduto: TfrmSelecionarEstoqueProduto;

implementation

{$R *.dfm}

uses UPrincipalPetrotorque, UVendaPosto, UCompraUsina, UMovimentoEstoqueUsina,
  UTransferenciaEstoque, UConverterFloat;

procedure TfrmSelecionarEstoqueProduto.definirTamanhoDaLinhaDaGrid;
begin

  //Define o tamanho de cada linha do DBgrid após ativar a QUERY
  TdbGridPadrao(gridUsina).DefaultRowHeight := 25;
  TdbGridPadrao(gridUsina).ClientHeight := ( 25 * TdbGridPadrao(gridUsina).RowCount ) + 25;

  TdbGridPadrao(gridEstoqueUsina).DefaultRowHeight := 25;
  TdbGridPadrao(gridEstoqueUsina).ClientHeight := ( 25 * TdbGridPadrao(gridUsina).RowCount ) + 25;


end;

procedure TfrmSelecionarEstoqueProduto.AbrirQuerryUsina;

begin
  qryEstoqueUsina.Open;
  qryRepresentante.Open();
  qryProduto.Open;

   with qryEstoqueUsina do
          begin
            if caminhoEntrega = 'vendaposto' then
               qryRepresentante.Locate('representanteid', frmVendaPostos.qryRepresentante['REPRESENTANTEID'], []);

            if caminhoEntrega = 'comprausina' then
               qryRepresentante.Locate('representanteid', frmCompraUsina.qryRepresentante['REPRESENTANTEID'], []);

            if caminhoEntrega = 'movimento' then
               qryRepresentante.Locate('representanteid', frmMovimentoEstoqueUsina.qryRepresentante['REPRESENTANTEID'], []);

            if caminhoEntrega = 'transferencia' then
                  qryRepresentante.Locate('representanteid', frmTransferencia.qryRepresentante['REPRESENTANTEID'], []);

                    Close;
                    ParamByName('representante').AsInteger := qryRepresentante['REPRESENTANTEID'];
                    Open();
          end;

   with qryUsina do
          begin
            Close;
            ParamByName('representante').AsInteger := qryRepresentante['REPRESENTANTEID'];
            Open();
          end;
end;

procedure TfrmSelecionarEstoqueProduto.btnAdicionarClick(Sender: TObject);
begin
  CapturarUsinaeEstoque(caminhoEntrega);
end;

procedure TfrmSelecionarEstoqueProduto.CapturarUsinaeEstoque( caminho : string );
begin
     if caminho = 'vendaposto' then
      begin
        frmVendaPostos.qryUsina.Refresh;
        frmVendaPostos.qryVendaPosto['USINAID'] := qryUsina['USINAID'];
        frmVendaPostos.editUsina.Text := qryUsina['NOME_FANTASIA'];
        frmVendaPostos.qryEstoqueUsina.Locate('estoqueid', qryEstoqueUsina['ESTOQUEID'], []); // lançando o estoqueid para gravar em qryvendaposto em vendas...
        frmVendaPostos.editEstoque.Text := FloatToStr(qryEstoqueUsina['ESTOQUE']);
        frmVendaPostos.qryProduto.Locate('produtoid', qryEstoqueUsina['PRODUTOID'], []);
        frmVendaPostos.editProduto.Text := qryEstoqueUsina['DESCRICAO'];
        frmVendaPostos.editNF.SetFocus;
        Close;
      end;

     if caminho = 'comprausina' then
      begin
        frmCompraUsina.qryUsina.Refresh;
        frmCompraUsina.qryCompraUsina['USINAID'] := qryUsina['USINAID'];
        frmCompraUsina.editUsina.Text := qryUsina['NOME_FANTASIA'];
        frmCompraUsina.editEstoque.Text := FloatToStr(qryEstoqueUsina['ESTOQUE']);
        frmCompraUsina.qryProduto.Locate('produtoid', qryEstoqueUsina['PRODUTOID'], []);
        frmCompraUsina.editProduto.Text := qryEstoqueUsina['DESCRICAO'];
        Close;
      end;

     if caminho = 'movimento' then
      begin
        frmMovimentoEstoqueUsina.qryUsina.Refresh;
        frmMovimentoEstoqueUsina.qryUsina.Locate('usinaid', qryUsina['USINAID'], []);
        frmMovimentoEstoqueUsina.editFornecedor.Text := qryUsina['NOME_FANTASIA'];
        frmMovimentoEstoqueUsina.qryProduto.Locate('produtoid', qryEstoqueUsina['PRODUTOID'], []);
        Close;
      end;

     if (caminho = 'transferencia')  then
         begin
            qryProduto.Locate('produtoid', qryEstoqueUsina['PRODUTOID']);
               if transferenciaDePara = 'transferenciaDe' then
                   begin
                      frmTransferencia.editDeFornecedor.Text := qryUsina['NOME_FANTASIA'];
                      frmTransferencia.editEstoqueID.Text := IntToStr(qryEstoqueUsina['ESTOQUEID']);
                      frmTransferencia.editProduto.Text := qryProduto['DESCRICAO'];
                      frmTransferencia.editQtde.Text := qryEstoqueUsina['ESTOQUE'];
                   end
                else if transferenciaDePara = 'transferenciaPara' then
                   begin
                      frmTransferencia.editParaFornecedor.Text := qryUsina['NOME_FANTASIA'];
                      frmTransferencia.editParaEstoqueID.Text := IntToStr(qryEstoqueUsina['ESTOQUEID']);
                      frmTransferencia.editParaProduto.Text := qryProduto['DESCRICAO'];
                      frmTransferencia.editParaQtde.Text := qryEstoqueUsina['ESTOQUE'];
                   end;
             Close;
         end;
    Close;
end;

procedure TfrmSelecionarEstoqueProduto.editPesquisaUsinaChange(Sender: TObject);
begin
   if rbNomeFantasia.Checked = True then
      with qryUsina do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT '
             + ' u.usinaid, u.razao_social, u.nome_fantasia, u.endereco, u.bairro, u.cidade, u.uf, u.telefone, '
             +' eu.usinaid as usinafk, eu.representanteid, eu.produtoid, '
             +'r.representanteid, '
             +'pr.produtoid '
             +' from '
             +' usina u, estoque_usina eu, representante r, produto pr '
             + ' where '
             +' (u.usinaid = eu.usinaid) and '
             +' (r.representanteid = eu.representanteid) and '
             +' (eu.produtoid = pr.produtoid) and '
             +' (eu.representanteid = :representante) and '
             +' NOME_FANTASIA like '+ QuotedStr('%' + editPesquisaUsina.Text + '%') +' order by NOME_FANTASIA asc ');
        ParamByName('representante').AsInteger := qryRepresentante['REPRESENTANTEID'];
        Open();
      end;

   if rbRazaoSocial.Checked = True then

   with qryUsina do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT '
             + ' u.usinaid, u.razao_social, u.nome_fantasia, u.endereco, u.bairro, u.cidade, u.uf, u.telefone, '
             +' eu.usinaid as usinafk, eu.representanteid, eu.produtoid, '
             +'r.representanteid, '
             +'pr.produtoid '
             +' from '
             +' usina u, estoque_usina eu, representante r, produto pr '
             + ' where '
             +' (u.usinaid = eu.usinaid) and '
             +' (r.representanteid = eu.representanteid) and '
             +' (eu.produtoid = pr.produtoid) and '
             +' (eu.representanteid = :representante) and '
             +' RAZAO_SOCIAL like '+ QuotedStr('%' + editPesquisaUsina.Text + '%') +' order by RAZAO_SOCIAL asc ');
        ParamByName('representante').AsInteger := qryRepresentante['REPRESENTANTEID'];
        Open();
      end;


   if rbCidade.Checked = True then

   with qryUsina do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT '
             + ' u.usinaid, u.razao_social, u.nome_fantasia, u.endereco, u.bairro, u.cidade, u.uf, u.telefone, '
             +' eu.usinaid as usinafk, eu.representanteid, eu.produtoid, '
             +'r.representanteid, '
             +'pr.produtoid '
             +' from '
             +' usina u, estoque_usina eu, representante r, produto pr '
             + ' where '
             +' (u.usinaid = eu.usinaid) and '
             +' (r.representanteid = eu.representanteid) and '
             +' (eu.produtoid = pr.produtoid) and '
             +' (eu.representanteid = :representante) and '
             +' u.CIDADE like '+ QuotedStr('%' + editPesquisaUsina.Text + '%') +' order by u.CIDADE asc ');
        ParamByName('representante').AsInteger := qryRepresentante['REPRESENTANTEID'];
        Open();
      end;


     // definirTamanhoDaLinhaDaGrid;

end;

procedure TfrmSelecionarEstoqueProduto.editPesquisaUsinaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_UP then
      qryUsina.Prior;
  if Key = VK_DOWN then
      qryUsina.Next;
  if Key = VK_RETURN then
     CapturarUsinaeEstoque(caminhoEntrega);
end;

procedure TfrmSelecionarEstoqueProduto.editPesquisaUsinaKeyPress(
  Sender: TObject; var Key: Char);
begin
  if Key = #13 then
       Key := #0;
end;

procedure TfrmSelecionarEstoqueProduto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qryUsina.Close;
  qryEstoqueUsina.Close;
  qryProduto.Close;
end;

procedure TfrmSelecionarEstoqueProduto.FormShow(Sender: TObject);
begin
  AbrirQuerryUsina; //parametriza a querry com o representante que vem de vendas;
  editPesquisaUsina.SetFocus;
end;

procedure TfrmSelecionarEstoqueProduto.rbCidadeClick(Sender: TObject);
begin
  editPesquisaUsina.Clear;
  editPesquisaUsina.SetFocus;
end;

procedure TfrmSelecionarEstoqueProduto.rbNomeFantasiaClick(Sender: TObject);
begin
  editPesquisaUsina.Clear;
  editPesquisaUsina.SetFocus;
end;

procedure TfrmSelecionarEstoqueProduto.rbRazaoSocialClick(Sender: TObject);
begin
  editPesquisaUsina.Clear;
  editPesquisaUsina.SetFocus;
end;

end.
