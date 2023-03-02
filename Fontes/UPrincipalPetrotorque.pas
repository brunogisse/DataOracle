unit UPrincipalPetrotorque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IniFiles, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, Vcl.Menus, System.UITypes, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.ComCtrls, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, frxClass,
  frxDBSet, Uclasse.conexao;

type
  TfrmMenu = class(TForm)
    painelFundo: TPanel;
    painelTopo: TPanel;
    btnMaximizar: TSpeedButton;
    btnFechar: TSpeedButton;
    imagemLogo: TImage;
    labelNomeSistema: TLabel;
    btnMenu: TSpeedButton;
    painelUnderlineTopo: TPanel;
    painelMenuLateral: TPanel;
    painelMenuCategoria1: TPanel;
    painelMenuCategoria2: TPanel;
    painelMenuCategoria3: TPanel;
    painelSubmenuCategoria1: TPanel;
    btnPosto: TSpeedButton;
    btnCorretores: TSpeedButton;
    btnUsinas: TSpeedButton;
    btnMotorista: TSpeedButton;
    btnRepresentante: TSpeedButton;
    FDconexao: TFDConnection;
    btnMenuCategoria2: TSpeedButton;
    painelSubmenuCategoria2: TPanel;
    btnVendaPostos: TSpeedButton;
    btnfrmCompraUsina: TSpeedButton;
    btnMenuCategoria3: TSpeedButton;
    painelSubmenuCategoria3: TPanel;
    btnfrmMovimentoEstoqueUsina: TSpeedButton;
    btnMenuCategoria1: TSpeedButton;
    painelMenuCategoria4: TPanel;
    btnMenuCategoria4: TSpeedButton;
    painelSubmenuCategoria4: TPanel;
    btnfrmEditarParcelas: TSpeedButton;
    btnfrmPagarParcelas: TSpeedButton;
    btnfrmReverterPagamentos: TSpeedButton;
    painelMenuCategoria5: TPanel;
    btnMenuCategoria5: TSpeedButton;
    painelSubmenuCategoria5: TPanel;
    btnfrmRelatorioMotorista: TSpeedButton;
    btnfrmRelatorioCorretor: TSpeedButton;
    btnfrmRelatorioVenda: TSpeedButton;
    StatusBar1: TStatusBar;
    btnCadastroUsuario: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btnRelatorioClientes: TSpeedButton;
    btnTransferencia: TSpeedButton;
    painelVencimentos: TPanel;
    btnVencimentos: TSpeedButton;
    frxDBVencimentos: TfrxDBDataset;
    reportVencimentos: TfrxReport;
    procedure FormCreate(Sender: TObject);
    procedure mCorretorClick(Sender: TObject);
    procedure mPostoClick(Sender: TObject);
    procedure mMotoristaClick(Sender: TObject);
    procedure mRepresentanteClick(Sender: TObject);
    procedure mProdutoClick(Sender: TObject);
    procedure mUsinaClick(Sender: TObject);
    procedure itemPesquisaVendasClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnMaximizarClick(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);

    //CRIADAS POR MIM
    procedure abrirSubmenu( Sender : TObject );
    procedure abrirFormulario( Sender : TObject );
    //fim
    procedure btnMenuClick(Sender: TObject);
    procedure btnUsinasClick(Sender: TObject);
    procedure btnfrmCompraUsinaDblClick(Sender: TObject);
    procedure btnVendaPostosClick(Sender: TObject);
    procedure btnfrmMovimentoEstoqueUsinaClick(Sender: TObject);
    procedure btnfrmEditarParcelasClick(Sender: TObject);
    procedure btnfrmPagarParcelasClick(Sender: TObject);
    procedure btnfrmReverterPagamentosClick(Sender: TObject);
    procedure btnfrmRelatorioCorretorClick(Sender: TObject);
    procedure btnfrmRelatorioMotoristaClick(Sender: TObject);
    procedure btnfrmRelatorioVendaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnRelatorioClientesClick(Sender: TObject);
    procedure btnTransferenciaClick(Sender: TObject);
    procedure btnVencimentosClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);


  private
    { Private declarations }


    procedure CaminhoBanco;
    procedure conferirVencimentos;
  public
  novaConexao : Tconexao;
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

  Expandir : Boolean;


implementation

{$R *.dfm}

uses UCorretores, Uposto, UMotorista, URepresentante, UProduto, UUsinas,
  UVendaPosto, UPesquisaVendas, UpagarParcelas, UConverterFloat, UGerarParcelas,
  URelatorioVendas, UselecionarUsinaEproduto, UCompraUsina, UdefinirEstoque,
  UMovimentoEstoqueUsina, URelatorioMotorista, UReverterPagamentos,
  URelatorioCorretor, UEditarParcelas, ULogin, UdataModule, UCadastroUsuario,
  UbackUp, UrelatorioCliente, UTransferenciaEstoque, UAlterarQtdeParcelas, Uservidor;

{ TfrmMenu }

procedure TfrmMenu.conferirVencimentos;
begin
    with dm.qryVencimentos do
     begin
       close;
       ParamByName('date').AsDate := date;
       open();
     end;

     if dm.qryVencimentos.RecordCount > 0 then
       begin
         painelVencimentos.Visible := True;
         btnVencimentos.Caption := IntToStr(dm.qryVencimentos.RecordCount) + ' pagamento(s) vencendo';
       end
     else
         painelVencimentos.Visible := False;
end;

procedure TfrmMenu.abrirFormulario(Sender: TObject);
  var    Formulario                         : TForm;
        FormularioClasse                    : TFormClass;
       NomeClasseFormulario, NomeFormulario : String;
   begin
       NomeClasseFormulario  := StringReplace(TSpeedButton(Sender).Name, 'btn','Tfrm', [rfReplaceAll]);
      NomeFormulario         := StringReplace(NomeClasseFormulario, 'Tfrm','frm', [rfReplaceAll]);

           try
            FormularioClasse := TFormClass(FindClass(NomeClasseFormulario));
             Formulario      := TForm(NomeFormulario);
              Application.CreateForm( FormularioClasse, Formulario );
               Formulario.ShowModal;
              finally
             FreeAndNil( Formulario );
           end;

         {Except
             on E : EClassNotFound do
            begin
               ShowMessage('Tela não encontrada');
            end;
        end;}
   end;


procedure TfrmMenu.abrirSubmenu(Sender: TObject);
 var NomePainelMenu, NomePainelSubmenu : string;
     i, Dimensao : integer;
  begin

     //Definir qual vai ser o painel manipulado através do nome do SpeedButton. Paa isso, o SpeedButton tem que ter o mesmo nome que o painel:
       NomePainelMenu     := StringReplace(TSpeedButton(Sender).Name, 'btn','painel', [ rfReplaceAll ]);
       NomePainelSubmenu  := StringReplace(TSpeedButton(Sender).Name, 'btn', 'painelSub', [ rfReplaceAll ]);
       Dimensao           := 70;


     for I := ComponentCount -1 downto 0 do //Percorre os componentes da tela...
       begin
        //Checa se é o menu clicado. Se não for e se estiver expandido verticalmente, ele recolhe:
        if (Components[i].GetParentComponent = TPanel(FindComponent('painelMenuLateral'))) and
           (Tpanel(Components[i]).Height <> 70) and
           (TPanel(Components[i]).Name <> NomePainelMenu) then
            TPanel(Components[i]).Height := 70;

        //Calcular a dimensão necessária para o painel expandir:
        if Components[i].GetParentComponent = TPanel(FindComponent(NomePainelSubmenu)) then
           begin
             Dimensao := Dimensao + 43;
           end;
       end;

      //Atribuir o tamanho de abertura ou do fechamento do submenu:
     if TPanel(FindComponent(NomePainelMenu)).Height = 70 then
       begin
        TPanel(FindComponent(NomePainelMenu)).Height := Dimensao;
       end else
       begin
        TPanel(FindComponent(NomePainelMenu)).Height := 70;
       end;

     //Verifica se o painel lateral está mostrando só os ícones. Se estiver, ele expande lateralmente para mostrar todo o conteúdo.
     if not Expandir then

       begin
        btnMenu.Width := 294;
        painelMenuLateral.Width := 298;
       end;
  end;


procedure TfrmMenu.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmMenu.btnfrmCompraUsinaDblClick(Sender: TObject);
begin
  try
    Application.CreateForm( TfrmCompraUsina, frmCompraUsina );
    frmCompraUsina.ShowModal;
  finally
     FreeAndNil( frmCompraUsina );
  end;
end;

procedure TfrmMenu.btnfrmEditarParcelasClick(Sender: TObject);
begin
   try
     Application.CreateForm( TfrmEditarParcelas, frmEditarParcelas );
     frmEditarParcelas.ShowModal;
   finally
      FreeAndNil( frmEditarParcelas );
   end;
end;

procedure TfrmMenu.btnfrmMovimentoEstoqueUsinaClick(Sender: TObject);
begin
    try
      Application.CreateForm( TfrmMovimentoEstoqueUsina, frmMovimentoEstoqueUsina );
      frmMovimentoEstoqueUsina.ShowModal
    finally
        FreeAndNil( frmMovimentoEstoqueUsina );
    end;
end;

procedure TfrmMenu.btnfrmPagarParcelasClick(Sender: TObject);
begin
    try
      Application.CreateForm(TfrmPagarParcelas, frmPagarParcelas);
      frmPagarParcelas.ShowModal;
    finally
       FreeAndNil(frmPagarParcelas);
       conferirVencimentos;
    end;
end;

procedure TfrmMenu.btnfrmRelatorioCorretorClick(Sender: TObject);
begin
   try
     Application.CreateForm( TfrmRelatorioCorretor, frmRelatorioCorretor );
     frmRelatorioCorretor.ShowModal;
   finally
      FreeAndNil( frmRelatorioCorretor );
   end;
end;

procedure TfrmMenu.btnfrmRelatorioMotoristaClick(Sender: TObject);
begin
 try
   Application.CreateForm( TfrmRelatorioMotorista, frmRelatorioMotorista );
   frmRelatorioMotorista.ShowModal;
 finally
    FreeAndNil( frmMotorista );
 end;
end;

procedure TfrmMenu.btnfrmRelatorioVendaClick(Sender: TObject);
begin
    try
      Application.CreateForm(TfrmRelatorioVenda, frmRelatorioVenda);
      frmRelatorioVenda.ShowModal;
    finally
        FreeAndNil(frmRelatorioVenda);
    end;
end;

procedure TfrmMenu.btnfrmReverterPagamentosClick(Sender: TObject);
begin
   try
       Application.CreateForm( TfrmReverterPagamentos, frmReverterPagamentos );
       frmReverterPagamentos.ShowModal;
   finally
        FreeAndNil(frmReverterPagamentos);
        conferirVencimentos;
   end;
end;

procedure TfrmMenu.btnMaximizarClick(Sender: TObject);
begin

  if Self.WindowState = wsNormal then
     Self.WindowState := wsMaximized
    else
     Self.WindowState := wsNormal;
end;



procedure TfrmMenu.btnMenuClick(Sender: TObject);

begin

    if Expandir then
      begin
       btnMenu.Width     := 58;
       painelMenuLateral.Width := 53;

       painelMenuCategoria1.Height := 70;
       painelMenuCategoria2.Height := 70;
       painelMenuCategoria3.Height := 70;
       painelMenuCategoria4.Height := 70;
       painelMenuCategoria5.Height := 70;

      end
     else
      begin
       btnMenu.Width := 294;
       painelMenuLateral.Width := 298;
      end;

      Expandir := not Expandir;

end;

procedure TfrmMenu.btnRelatorioClientesClick(Sender: TObject);
begin
  try
     Application.CreateForm( TfrmRelatorioClientes, frmRelatorioClientes );
     frmRelatorioClientes.ShowModal;
   finally
     FreeAndNil( frmRelatorioClientes );
  end;
end;

procedure TfrmMenu.btnTransferenciaClick(Sender: TObject);
begin
    try
      Application.CreateForm( TfrmTransferencia, frmTransferencia );
      frmTransferencia.ShowModal;
    finally
      FreeAndNil( frmTransferencia );
    end;
end;

procedure TfrmMenu.btnUsinasClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmUsinas, frmUsinas);
    frmUsinas.ShowModal;
  finally
     FreeAndNil(frmUsinas);
  end;
end;

procedure TfrmMenu.btnVencimentosClick(Sender: TObject);
  var caminhorelatorio : string;
begin
    caminhoRelatorio := ExtractFilePath(Application.ExeName);
    reportVencimentos.LoadFromFile(caminhoRelatorio +'RelContasVencendo.fr3');
    reportVencimentos.ShowReport();
end;

procedure TfrmMenu.btnVendaPostosClick(Sender: TObject);
begin
   try
     Application.CreateForm(TfrmVendaPostos, frmVendaPostos);
     frmVendaPostos.ShowModal;
   finally
       FreeAndNil(frmVendaPostos);
   end;
end;

procedure TfrmMenu.CaminhoBanco;
  var
      ArquivoINI : TIniFile;
      server, user, password, database, AuxErro : string;
   begin
      if FDconexao.Connected = True then
         FDconexao.Connected := False;
         ArquivoINI := TIniFile.Create(System.SysUtils.ExtractFilePath(ParamStr(0))+'config.ini');
         server := ArquivoINI.ReadString('Sistema','Server','');
         user := ArquivoINI.ReadString('Sistema','User','');
         password := ArquivoINI.ReadString('Sistema','Password','');
         database := ArquivoINI.ReadString('Sistema','database','');
        try
          FDconexao.Params.Strings[0] := 'User_Name=' + user;
          FDconexao.Params.Strings[1] := 'Password=' + password;
          FDconexao.Params.Strings[2] := 'Database=' + database;
          FDconexao.Params.Strings[3] := 'Server=' + server;
          FDconexao.Connected := True;
        except
           on E : Exception do
             begin
               AuxErro := Copy(E.Message,20,500);
               MessageDlg('Erro ao tentar se conectar com o banco de dados.'+#13
                        +#13+'Sugestão: certifique-se de ter inserido o caminho correto no arquivo Config.INI'+#13
                        +#13+'Notificação técnica do erro:'+#13+#13+'' + AuxErro,TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
               Application.Terminate;
             end;
        end;
   end;

procedure TfrmMenu.FormCreate(Sender: TObject);
begin
 CaminhoBanco;

  //novaConexao := Tconexao.Create(FDconexao);
end;

procedure TfrmMenu.FormDestroy(Sender: TObject);
begin
  FDconexao.Destroy;
end;

procedure TfrmMenu.FormShow(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Usuário Logado: ' + dm.qryLogin.FieldByName('NOME').AsString;

  conferirVencimentos;

end;

procedure TfrmMenu.itemPesquisaVendasClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmPesquisaVendas, frmPesquisaVendas);
    frmPesquisaVendas.ShowModal;
  finally
     FreeAndNil(frmPesquisaVendas);
  end;
end;

procedure TfrmMenu.mCorretorClick(Sender: TObject);
begin
 try
   Application.CreateForm(TfrmCorretores, frmCorretores);
    frmCorretores.ShowModal;
  finally
     FreeAndNil(frmCorretores);
 end;
end;

procedure TfrmMenu.mMotoristaClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmMotorista, frmMotorista);
    frmMotorista.ShowModal;
  finally
     FreeAndNil(frmMotorista);
  end;
end;

procedure TfrmMenu.mPostoClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmPosto, frmPosto);
    frmPosto.ShowModal;
  finally
     FreeAndNil(frmPosto);
  end;
end;

procedure TfrmMenu.mProdutoClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmProdutos, frmProdutos);
    frmProdutos.ShowModal;
  finally
     FreeAndNil(frmProdutos);
  end;
end;

procedure TfrmMenu.mRepresentanteClick(Sender: TObject);
 begin
   try
      Application.CreateForm(TfrmRepresentante, frmRepresentante);
      frmRepresentante.ShowModal;
   finally
      FreeAndNil(frmRepresentante);
   end;
 end;

procedure TfrmMenu.mUsinaClick(Sender: TObject);
begin
  try
    Application.CreateForm(TfrmUsinas, frmUsinas);
    frmUsinas.ShowModal;
  finally
     FreeAndNil(frmUsinas);
  end;
end;

procedure TfrmMenu.SpeedButton1Click(Sender: TObject);
begin
try
     Application.CreateForm( TfrmBackUp, frmBackUp );
     frmBackUp.ShowModal;
   finally
     FreeAndNil( frmBackUp );
   end;
end;

procedure TfrmMenu.SpeedButton6Click(Sender: TObject);
begin
 try
   Application.CreateForm(TfrmCorretores, frmCorretores);
    frmCorretores.ShowModal;
  finally
     FreeAndNil(frmCorretores);
 end;
end;

end.
