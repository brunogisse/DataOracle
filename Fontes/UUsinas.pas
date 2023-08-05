unit UUsinas;

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
  TfrmUsinas = class(TForm)
    PainelTopo: TPanel;
    tcUsina: TFDTransaction;
    qryUsina: TFDQuery;
    dsUsina: TDataSource;
    qryEstoqueUsina: TFDQuery;
    dsEstoqueUsina: TDataSource;
    qryProduto: TFDQuery;
    dsProduto: TDataSource;
    gbUsina: TGroupBox;
    gbEstoque: TGroupBox;
    Label1: TLabel;
    editNomeFantasia: TDBEdit;
    Label2: TLabel;
    editRazaoSocial: TDBEdit;
    Label3: TLabel;
    labelProduto: TLabel;
    editProduto: TEdit;
    painelBotoes: TPanel;
    painelBtnAdicionar: TPanel;
    btnOK: TSpeedButton;
    qryProdutoPRODUTOID: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    editEstoque: TEdit;
    qryEstoqueUsinaESTOQUEID: TFDAutoIncField;
    qryEstoqueUsinaUSINAID: TIntegerField;
    qryEstoqueUsinaPRODUTOID: TIntegerField;
    qryEstoqueUsinaPRODUTOID_1: TIntegerField;
    painelGrids: TPanel;
    painelSeparacao: TPanel;
    gbPesquisaUsina: TGroupBox;
    editPesquisaUsina: TEdit;
    Label4: TLabel;
    editEndereco: TDBEdit;
    Label5: TLabel;
    editCidade: TDBEdit;
    Label6: TLabel;
    editUF: TDBEdit;
    Label7: TLabel;
    editBairro: TDBEdit;
    Label8: TLabel;
    editTelefone: TDBEdit;
    qryUsinaUSINAID: TFDAutoIncField;
    qryUsinaRAZAO_SOCIAL: TStringField;
    qryUsinaNOME_FANTASIA: TStringField;
    qryUsinaENDERECO: TStringField;
    qryUsinaBAIRRO: TStringField;
    qryUsinaCIDADE: TStringField;
    qryUsinaUF: TStringField;
    qryUsinaTELEFONE: TStringField;
    gridMotorista: TDBGrid;
    gridPosto: TDBGrid;
    labelrotuloAcao: TLabel;
    painelBotoesEstoque: TPanel;
    painelEditarEstoque: TPanel;
    SpeedButton2: TSpeedButton;
    PainelNovoEstoqueUsina: TPanel;
    btnNovoEstoqueUsina: TSpeedButton;
    painelCancelarEstoque: TPanel;
    btnAdicionar: TSpeedButton;
    painelExcluirEstoque: TPanel;
    btnConsultar: TSpeedButton;
    rbNomeFantasia: TRadioButton;
    rbRazaoSocial: TRadioButton;
    rbCidade: TRadioButton;
    Panel1: TPanel;
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
    qryEstoqueUsinaESTOQUE: TFMTBCDField;
    qryEstoqueUsinaDESCRICAO: TStringField;
    Image1: TImage;
    Label9: TLabel;
    qryEstoqueUsinaREPRESENTANTEID: TIntegerField;
    labelRepresentante: TLabel;
    editRepresentante: TEdit;
    qryEstoqueUsinaREPRESENTANTEID_1: TIntegerField;
    qryEstoqueUsinaNOME: TStringField;
    qryEstoqueUsinaSeExiste: TFDQuery;
    dsEstoqueUsinaSeExiste: TDataSource;
    qryEstoqueUsinaSeExisteESTOQUEID: TIntegerField;
    qryEstoqueUsinaSeExisteUSINAID: TIntegerField;
    qryEstoqueUsinaSeExistePRODUTOID: TIntegerField;
    qryEstoqueUsinaSeExisteESTOQUE: TFMTBCDField;
    qryEstoqueUsinaSeExisteREPRESENTANTEID: TIntegerField;
    qryRepresentante: TFDQuery;
    qryRepresentanteREPRESENTANTEID: TIntegerField;
    qryRepresentanteNOME: TStringField;
    qryRepresentanteCIDADE: TStringField;
    qryRepresentanteCNPJ: TStringField;
    dsRepresentante: TDataSource;
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);


    procedure editCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure editEstoqueKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editDescricaoKeyPress(Sender: TObject; var Key: Char);
    procedure editCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure gridUsinaDblClick(Sender: TObject);
    procedure editProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure editProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnOKClick(Sender: TObject);
    procedure btnNovoEstoqueUsinaClick(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure editPesquisaUsinaChange(Sender: TObject);
    procedure rbNomeFantasiaClick(Sender: TObject);
    procedure rbRazaoSocialClick(Sender: TObject);
    procedure rbCidadeClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure editPesquisaUsinaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editPesquisaUsinaKeyPress(Sender: TObject; var Key: Char);
    procedure editRepresentanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }

    procedure configurarEnables(status : integer);
    procedure configurarEnablesEstoque(status : integer);
    procedure inserirProdutoGeral;
    function ChecarDuplicidadeEstoqueUsina : Boolean;

    function VerificarCamposVazios : Boolean;

  public
    { Public declarations }

     var DuploClickNaGrid, InserindoOuEditando : string;

     
  end;

var
  frmUsinas: TfrmUsinas;

implementation

{$R *.dfm}

uses UPrincipalPetrotorque, UVendaPosto, UProduto, URepresentante, UFuncoes;

procedure TfrmUsinas.btnOKClick(Sender: TObject);

  var Fornecedor, comportamento : string;
  var i : Integer;

begin


 if VerificarCamposVazios = True then
   begin

         if InserindoOuEditando = 'editando' then
            comportamento := 'alterar o estoque do';
         if InserindoOuEditando = 'inserindo' then
            comportamento := 'cadastrar um estoque para o';

      if (ChecarDuplicidadeEstoqueUsina = True) and (InserindoOuEditando = 'inserindo')  then
         begin
             MessageDlg('Estoque já cadastrado para esse representante ',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
             Abort;
         end;
      begin
       Fornecedor := qryUsina['NOME_FANTASIA'];
          if MessageBox( Application.Handle, PChar('Você está prestes a '+ comportamento +' Fornecedor abaixo: ' + #13 + #13 +
                                            'FORNECEDOR:     ' + Fornecedor  + #13
                                          + 'PRODUTO:            ' + editProduto.Text + #13
                                          + 'REPRESENTANTE: ' + editRepresentante.Text + #13
                                          + 'ESTOQUE:             ' + editEstoque.Text
                                           + #13 + #13 + 'Deseja continuar? '),'Atenção', MB_YESNO + MB_ICONQUESTION) = mrYes then
       begin
           if InserindoOuEditando = 'inserindo' then
              begin
                qryEstoqueUsina.Locate('usinaid', qryUsina['USINAID'], []);
                qryEstoqueUsina.Insert;
             end;
           if InserindoOuEditando = 'editando' then
                qryEstoqueUsina.Edit;
                qryEstoqueUsina['PRODUTOID']        := qryProduto['PRODUTOID'];
                qryEstoqueUsina['REPRESENTANTEID']  := qryRepresentante['REPRESENTANTEID'];
                qryEstoqueUsina['ESTOQUE']          := StrToFloat(editEstoque.Text);
                qryEstoqueUsina.Post;

         try
           tcUsina.CommitRetaining;
         finally
            tcUsina.RollbackRetaining;
         end;

           qryUsina.Close;
           qryProduto.Close;
           qryEstoqueUsina.Close;
           qryRepresentante.Close;
           qryUsina.Open;
           qryProduto.Open;
           qryEstoqueUsina.Open;
           qryRepresentante.Open();

           painelGrids.Enabled := True;
           editProduto.Clear;
           editEstoque.Clear;
           editRepresentante.Clear;
           labelrotuloAcao.Visible := False;
           configurarEnablesEstoque(0);
        end;
      end;
   end;
end;

procedure TfrmUsinas.btnAdicionarClick(Sender: TObject);
begin
  labelrotuloAcao.Visible := False;
  qryEstoqueUsina.Cancel;
  editProduto.Text := '';
  editEstoque.Text := '';
  editRepresentante.Clear;
  gbEstoque.Enabled := False;
  painelGrids.Enabled := True;
  configurarEnablesEstoque(0);
end;

procedure TfrmUsinas.btnCancelarClick(Sender: TObject);
begin
 configurarEnables(0);
 qryUsina.Cancel;
end;



procedure TfrmUsinas.btnConsultarClick(Sender: TObject);
var AuxErro : string;
  begin
          if MessageBox(Application.Handle,'Deseja excluir o estoque selecionado?','Confirmação',MB_YESNO + MB_ICONQUESTION) = mrYes then
    try
     qryEstoqueUsina.Delete;
     except
      on E : exception do
        begin
         AuxErro := Copy(E.Message, 0, 500);
         MessageDlg('Erro ao excluir o estoque selecionado. Motivo ' + AuxErro,TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
        end;
    end;
         configurarEnablesEstoque(0);
  end;



procedure TfrmUsinas.btnEditarClick(Sender: TObject);
begin
 configurarEnables(1);
 qryUsina.Edit;
end;




procedure TfrmUsinas.btnExcluirClick(Sender: TObject);
 var AuxErro : string;
   begin
    configurarEnables(0);
      if MessageBox(Application.Handle,'Deseja excluir esse registro?','Confirmação',MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
           try
              qryUsina.Delete;
             except
            on E : Exception do
             begin
               AuxErro := Copy(E.Message,0,25);
               ShowMessage(AuxErro);
             end;
           end;
        end;
   end;



procedure TfrmUsinas.btnNovoClick(Sender: TObject);
begin
  configurarEnables(1);
  editNomeFantasia.SetFocus;
  qryUsina.Insert;
end;


procedure TfrmUsinas.btnNovoEstoqueUsinaClick(Sender: TObject);
begin
 gbEstoque.Enabled := True;
 labelrotuloAcao.Visible := True;
 labelrotuloAcao.Caption := '* Cadastrando novo estoque...';
 InserindoOuEditando := 'inserindo';
 painelGrids.Enabled := False;
 editRepresentante.SetFocus;
 configurarEnablesEstoque(1);
end;

procedure TfrmUsinas.btnSalvarClick(Sender: TObject);
begin
      qryUsina.Post;
      configurarEnables(0);

    try
      tcUsina.CommitRetaining;
    finally
       tcUsina.RollbackRetaining;
    end;
end;



function TfrmUsinas.ChecarDuplicidadeEstoqueUsina: Boolean;
begin
    with qryEstoqueUsinaSeExiste do
         begin
                Close;
                ParamByName('usina').AsInteger          := qryUsina['USINAID'];
                ParamByName('representante').AsInteger  := qryRepresentante['REPRESENTANTEID'];
                ParamByName('produto').AsInteger        := qryProduto['PRODUTOID'];
                open;

             if RecordCount > 0 then

                Result := True

               else

                Result := False;
         end;
end;

procedure TfrmUsinas.configurarEnables(status: integer);
  begin
      if status = 0 then
    begin
      btnNovo.Enabled := True;
      btnNovo.Enabled := True;
      btnExcluir.Enabled := True;
      btnCancelar.Enabled := False;
      btnSalvar.Enabled := False;
      editNomeFantasia.Enabled := False;
      editRazaoSocial.Enabled := False;
      editEndereco.Enabled := False;
      editUF.Enabled := False;
      editTelefone.Enabled := False;
      editBairro.Enabled := False;
      editCidade.Enabled := False;
     // gbEstoque.Enabled := True;
      gbPesquisaUsina.Enabled := True;
      painelBotoesEstoque.Enabled := True; 
      painelGrids.Enabled := True; 


    end
   else
    begin
      btnNovo.Enabled := False;
      btnNovo.Enabled := False;
      btnExcluir.Enabled := False;
      btnCancelar.Enabled := True;
      btnSalvar.Enabled := True;
      editNomeFantasia.Enabled := True;
      editRazaoSocial.Enabled := True;
      editEndereco.Enabled := True;
      editUF.Enabled := True;
      editTelefone.Enabled := True;
      editBairro.Enabled := True;
      editCidade.Enabled := True;
      //gbEstoque.Enabled := False;
      gbPesquisaUsina.Enabled := False;
      painelBotoesEstoque.Enabled := False;      
      painelGrids.Enabled := False; 
    end;
  end;








procedure TfrmUsinas.configurarEnablesEstoque(status: integer);
begin
 if status = 0 then
     begin
       PainelNovoEstoqueUsina.Enabled := True;
       painelEditarEstoque.Enabled := True;
       painelExcluirEstoque.Enabled := True;
       painelCancelarEstoque.Enabled := False;
       gbEstoque.Enabled := False;
     end;
 if status = 1 then
     begin
       PainelNovoEstoqueUsina.Enabled := False;
       painelEditarEstoque.Enabled := False;
       painelExcluirEstoque.Enabled := False;;
       painelCancelarEstoque.Enabled := True;
       gbEstoque.Enabled := True;
     end;
end;

procedure TfrmUsinas.editCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_F12 then
      begin
       btnSalvar.Click;
       //btnNovo.SetFocus;
      end;
end;



procedure TfrmUsinas.editCidadeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
     begin
       //editEstoque.SetFocus;
       Key := #0;
     end;
end;

procedure TfrmUsinas.editDescricaoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F12 then
      begin
       btnSalvar.Click;
     //  btnNovo.SetFocus;
      end;
end;

procedure TfrmUsinas.editDescricaoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
       editCidade.SetFocus;
       Key := #0;
     end;
end;

procedure TfrmUsinas.editEstoqueKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F12 then
      begin
       btnSalvar.Click;
      // btnNovo.SetFocus;
      end;
end;

procedure TfrmUsinas.editPesquisaUsinaChange(Sender: TObject);
begin
 if rbNomeFantasia.Checked = True then

   with qryUsina do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from usina where NOME_FANTASIA like '+ QuotedStr('%' + editPesquisaUsina.Text + '%') +' order by NOME_FANTASIA asc ');
        Open();
      end;

   if rbRazaoSocial.Checked = True then

   with qryUsina do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from usina where RAZAO_SOCIAL like '+ QuotedStr('%' + editPesquisaUsina.Text + '%') +' order by RAZAO_SOCIAL asc ');
        Open();
      end;


   if rbCidade.Checked = True then

   with qryUsina do
      begin
        Close;
        SQL.Clear;
        SQL.Add('select * from usina where CIDADE like '+ QuotedStr('%' + editPesquisaUsina.Text + '%') +' order by NOME_FANTASIA asc ');
        Open();
      end;
end;

procedure TfrmUsinas.editPesquisaUsinaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_UP then
      qryUsina.Prior;
  if Key = VK_DOWN then
      qryUsina.Next;
end;

procedure TfrmUsinas.editPesquisaUsinaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
       Key := #0;
end;

procedure TfrmUsinas.editProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
        begin
          try
            Application.CreateForm(TfrmProdutos, frmProdutos);
            frmProdutos.TabelaCapturando := 'USINA';
            frmProdutos.ShowModal;
          finally
             FreeAndNil(frmProdutos);
          end;
        end;
end;

procedure TfrmUsinas.editProdutoKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
    Key := #0;
end;

procedure TfrmUsinas.editRepresentanteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then
     Try
       Application.CreateForm( TfrmRepresentante, frmRepresentante );
       frmRepresentante.Caminho := 'fornecedor';
       frmRepresentante.ShowModal;
     Finally
        FreeAndNil( frmRepresentante );
     End;

end;

procedure TfrmUsinas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryUsina.Close;
  qryProduto.Close;
  qryEstoqueUsina.Close;
  qryRepresentante.Close;
end;



procedure TfrmUsinas.FormShow(Sender: TObject);
begin
  qryUsina.Open;
  qryProduto.Open;
  qryEstoqueUsina.Open;
  qryRepresentante.Open();
  configurarEnables(0);
  configurarEnablesEstoque(0);
  editPesquisaUsina.SetFocus;
end;

procedure TfrmUsinas.gridUsinaDblClick(Sender: TObject);
begin
  frmVendaPostos.qryUsina.Refresh;
  qryEstoqueUsina.Locate('produtoid', frmVendaPostos.qryProduto['PRODUTOID'], []);
  frmVendaPostos.editUsina.Text := qryUsina['DESCRICAO'];
  frmVendaPostos.editEstoque.Text := qryEstoqueUsina['ESTOQUE'];
  frmVendaPostos.qryUsina.Locate('usinaid', qryUsina['USINAID'], []);
  Close;
end;

procedure TfrmUsinas.inserirProdutoGeral; // **ATENÇÃO!! - procedure chamada apenas tecnicamente, para inserir produto em todos os fornecedores de uma vez
    var TotalRegistros : Integer;
begin
   TotalRegistros := qryUsina.RecordCount;
   qryUsina.First;
   while not qryUsina.Eof do
      begin
        qryEstoqueUsina.Insert;
        qryEstoqueUsina['USINAID'] := qryUsina['USINAID'];
        qryEstoqueUsina['PRODUTOID'] := 3;
        qryEstoqueUsina['ESTOQUE'] := 0;
        qryEstoqueUsina.Post;
        qryUsina.Next;
      end;

      try
        tcUsina.CommitRetaining;
      finally
          tcUsina.RollbackRetaining;
      end;
end;

procedure TfrmUsinas.rbCidadeClick(Sender: TObject);
begin
editPesquisaUsina.Clear;
  editPesquisaUsina.SetFocus;
end;

procedure TfrmUsinas.rbNomeFantasiaClick(Sender: TObject);
begin
  editPesquisaUsina.Clear;
  editPesquisaUsina.SetFocus;
end;

procedure TfrmUsinas.rbRazaoSocialClick(Sender: TObject);
begin
editPesquisaUsina.Clear;
  editPesquisaUsina.SetFocus;
end;

procedure TfrmUsinas.SpeedButton2Click(Sender: TObject);
begin

     if qryEstoqueUsina.RecordCount > 0 then
        begin
         if MessageBox(Application.Handle,'Deseja realmente alterar o estoque deste fornecedor?', 'Pergunta', MB_YESNO + MB_ICONQUESTION) = mrYes then
            begin
              gbEstoque.Enabled := True;
              labelrotuloAcao.Visible := True;
              labelrotuloAcao.Caption := '* Alterando Estoque...';
              InserindoOuEditando     := 'editando';
              editEstoque.Text        := FloatToStr(qryEstoqueUsina['ESTOQUE']);
              editProduto.Text        := qryEstoqueUsina['DESCRICAO'];
              qryRepresentante.Locate('representanteid', qryEstoqueUsina['REPRESENTANTEID'], []);
              editRepresentante.Text  := qryRepresentante['NOME'];
              painelGrids.Enabled := False;
              configurarEnablesEstoque(1);
            end;
        end;
end;

function TfrmUsinas.VerificarCamposVazios: Boolean;
  var i : Integer;
begin
  Result := True;
    for I := 0 to gbEstoque.ControlCount - 1 do
      begin
         if (gbEstoque.Controls[i] is TEdit) then
         if (gbEstoque.Controls[i] as TEdit).Text = '' then
           begin
             MessageDlg('Por favor, preencha o(s) campo(s) vazio(s)',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
             (gbEstoque.Controls[i] as TEdit).SetFocus;
             Result := False;
             break;
           end;
      end;
end;


  initialization
  RegisterClass(TfrmUsinas);

  finalization
  UnRegisterClass(TfrmUsinas);

end.

