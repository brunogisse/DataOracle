unit URepresentante;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TdbGridPadrao = class(TDBGrid);
  TfrmRepresentante = class(TForm)
    PainelTopo: TPanel;
    qryRepresentante: TFDQuery;
    dsRepresentante: TDataSource;
    tcRepresentante: TFDTransaction;
    qryRepresentanteREPRESENTANTEID: TIntegerField;
    qryRepresentanteNOME: TStringField;
    qryRepresentanteCIDADE: TStringField;
    qryRepresentanteCNPJ: TStringField;
    Panel1: TPanel;
    gbEdit: TGroupBox;
    labelDestino: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    gbPesquisa: TGroupBox;
    editPesquisaRepresentantes: TEdit;
    rbNome: TRadioButton;
    rbCNPJ: TRadioButton;
    painelGrid: TPanel;
    gridRepresentante: TDBGrid;
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
    editCNPJ: TDBEdit;
    editCidade: TDBEdit;
    editNome: TDBEdit;
    Image1: TImage;
    labelTituloRepresentantes: TLabel;
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure editNomeKeyPress(Sender: TObject; var Key: Char);
    procedure editNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


    procedure editCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure editCNPJKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editCNPJKeyPress(Sender: TObject; var Key: Char);
    procedure gridRepresentanteDblClick(Sender: TObject);
    procedure editPesquisaRepresentantesChange(Sender: TObject);
    procedure editPesquisaRepresentantesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rbNomeClick(Sender: TObject);
    procedure rbCNPJClick(Sender: TObject);
    procedure gridRepresentanteDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure editPesquisaRepresentantesKeyPress(Sender: TObject;
      var Key: Char);
  private
    { Private declarations }

    procedure configurarEnables(status : integer);
    procedure capturarRepresentante;
    procedure definirTamanhoDaLinhaDaGrid;

  public
    { Public declarations }

    var Caminho : string;
  end;

var
  frmRepresentante: TfrmRepresentante;

implementation

{$R *.dfm}

uses UPrincipalPetrotorque, UVendaPosto, UUsinas, UCompraUsina,
  UMovimentoEstoqueUsina, URelatorioVendas, UTransferenciaEstoque,
  UEditarParcelas, UpagarParcelas, UReverterPagamentos, URelatorioMotorista,
  URelatorioCorretor, UdataModule;

procedure TfrmRepresentante.definirTamanhoDaLinhaDaGrid;
begin

  //Define o tamanho de cada linha do DBgrid ap�s ativar a QUERY
  TdbGridPadrao(gridRepresentante).DefaultRowHeight := 25;
  TdbGridPadrao(gridRepresentante).ClientHeight := ( 25 * TdbGridPadrao(gridRepresentante).RowCount ) + 25;

end;


procedure TfrmRepresentante.btnCancelarClick(Sender: TObject);
begin
 configurarEnables(0);
 qryRepresentante.Cancel;
end;

procedure TfrmRepresentante.btnEditarClick(Sender: TObject);
begin
 configurarEnables(1);
 qryRepresentante.Edit;
end;




procedure TfrmRepresentante.btnExcluirClick(Sender: TObject);
 var AuxErro : string;
   begin
    configurarEnables(0);
      if MessageBox(Application.Handle,'Deseja excluir esse registro?','Confirma��o',MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
           try
              qryRepresentante.Delete;
             except
            on E : Exception do
             begin
               AuxErro := Copy(E.Message,0,25);
               MessageDlg('N�o foi poss�vel excluir esse registro. ' + #13
                         + #13 + 'Esse fornecedor est� sendo referenciado em alguma venda.  ' + #13 + #13
                         + 'Erro T�cnico: '+  AuxErro,TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
             end;
           end;
        end;

         try
            tcRepresentante.CommitRetaining;
         except
             tcRepresentante.RollbackRetaining;
         end;
   end;



procedure TfrmRepresentante.btnNovoClick(Sender: TObject);
begin
  configurarEnables(1);
  editNome.SetFocus;
  qryRepresentante.Insert;
end;





procedure TfrmRepresentante.btnSalvarClick(Sender: TObject);
begin
      qryRepresentante.Post;
      configurarEnables(0);

    try
      tcRepresentante.CommitRetaining;
    finally
       tcRepresentante.RollbackRetaining;
    end;
end;





procedure TfrmRepresentante.capturarRepresentante;
begin
  if qryRepresentante.RecordCount > 0 then
   begin

      if Caminho = 'vendas' then

         begin
           frmVendaPostos.qryRepresentante.Refresh;
           frmVendaPostos.editRepresentante.Text := qryRepresentante['NOME'];
           frmVendaPostos.qryRepresentante.Locate('representanteid',qryRepresentante['REPRESENTANTEID'],[]);
           frmVendaPostos.editUsina.Clear;
           frmVendaPostos.editPosto.SetFocus;
           Close;
         end;

     if Caminho = 'fornecedor' then

        begin
           frmUsinas.qryRepresentante.Refresh;
           frmUsinas.editRepresentante.Text := qryRepresentante['NOME'];
           frmUsinas.qryRepresentante.Locate('representanteid',qryRepresentante['REPRESENTANTEID'],[]);
           Close;
         end;

     if Caminho = 'comprausina' then

         begin
           frmCompraUsina.qryRepresentante.Refresh;
           frmCompraUsina.editRepresentante.Text := qryRepresentante['NOME'];
           frmCompraUsina.qryRepresentante.Locate('representanteid',qryRepresentante['REPRESENTANTEID'],[]);
           frmCompraUsina.editUsina.Clear;
           Close;
         end;

      if Caminho = 'movimento' then

         begin
           frmMovimentoEstoqueUsina.qryRepresentante.Refresh;
           frmMovimentoEstoqueUsina.editRepresentante.Text := qryRepresentante['NOME'];
           frmMovimentoEstoqueUsina.qryRepresentante.Locate('representanteid',qryRepresentante['REPRESENTANTEID'],[]);
           frmMovimentoEstoqueUsina.editFornecedor.Clear;
           Close;
         end;

         if Caminho = 'transferencia' then

         begin
           frmTransferencia.qryRepresentante.Refresh;
           frmTransferencia.editRepresentante.Text := qryRepresentante['NOME'];
           frmTransferencia.qryRepresentante.Locate('representanteid',qryRepresentante['REPRESENTANTEID'],[]);
           Close;
         end;

         if Caminho = 'editarparcelas' then

         begin
           frmEditarParcelas.qryRepresentante.Refresh;
           frmEditarParcelas.editRepresentante.Text := qryRepresentante['NOME'];
           frmEditarParcelas.qryRepresentante.Locate('representanteid',qryRepresentante['REPRESENTANTEID'],[]);
           Close;
         end;

         if Caminho = 'pagarparcelas' then

         begin
           frmPagarParcelas.qryRepresentante.Refresh;
           frmPagarParcelas.editRepresentante.Text := qryRepresentante['NOME'];
           frmPagarParcelas.qryRepresentante.Locate('representanteid',qryRepresentante['REPRESENTANTEID'],[]);
           Close;
         end;

         if Caminho = 'reverterpagamentos' then

         begin
           frmReverterPagamentos.qryRepresentante.Refresh;
           frmReverterPagamentos.editRepresentante.Text := qryRepresentante['NOME'];
           frmReverterPagamentos.qryRepresentante.Locate('representanteid',qryRepresentante['REPRESENTANTEID'],[]);
           Close;
         end;

         if Caminho = 'relatoriofrete' then

         begin
           frmRelatorioMotorista.qryRepresentante.Refresh;
           frmRelatorioMotorista.editRepresentante.Text := qryRepresentante['NOME'];
           frmRelatorioMotorista.qryRepresentante.Locate('representanteid',qryRepresentante['REPRESENTANTEID'],[]);
           Close;
         end;

         if Caminho = 'relatoriocorretor' then

         begin
           frmRelatorioCorretor.qryRepresentante.Refresh;
           frmRelatorioCorretor.editRepresentante.Text := qryRepresentante['NOME'];
           frmRelatorioCorretor.qryRepresentante.Locate('representanteid',qryRepresentante['REPRESENTANTEID'],[]);
           Close;
         end;

         if Caminho = 'relatoriovendaposto' then

         begin
           frmRelatorioVenda.qryRepresentante.Refresh;
           frmRelatorioVenda.editRepresentantePrincipal.Text := qryRepresentante['NOME'];
           frmRelatorioVenda.qryRepresentante.Locate('representanteid',qryRepresentante['REPRESENTANTEID'],[]);
           Close;
         end;

         if Caminho = 'menuvencimentos' then
         begin
           frmMenu.Representante := qryRepresentante['REPRESENTANTEID'];
           Close;
         end;
   end;
end;

procedure TfrmRepresentante.configurarEnables(status: integer);
  begin
      if status = 0 then
    begin
      btnNovo.Enabled := True;
      btnEditar.Enabled := True;
      btnExcluir.Enabled := True;
      btnCancelar.Enabled := False;
      btnSalvar.Enabled := False;
      gbEdit.Enabled := false;
      gridRepresentante.Enabled := True;
    end
   else
    begin
      btnNovo.Enabled := False;
      btnEditar.Enabled := False;
      btnExcluir.Enabled := False;
      btnCancelar.Enabled := True;
      btnSalvar.Enabled := True;
      gbEdit.Enabled := true;
      gridRepresentante.Enabled := False;
    end;
  end;



procedure TfrmRepresentante.editCidadeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
     begin
       editCidade.SetFocus;
       Key := #0;
     end;
end;



procedure TfrmRepresentante.editCNPJKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
   begin
     if Key = VK_F12 then
       begin
         btnSalvar.Click;

       end;
   end;

procedure TfrmRepresentante.editCNPJKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
       editCidade.SetFocus;
       Key := #0;
     end;
end;

procedure TfrmRepresentante.editCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_F12 then
      begin
       btnSalvar.Click;

      end;
end;


procedure TfrmRepresentante.editNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_F12 then
      begin
       btnSalvar.Click;

      end;
end;



procedure TfrmRepresentante.editNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
       editCNPJ.SetFocus;
       Key := #0;
     end;
end;


procedure TfrmRepresentante.editPesquisaRepresentantesChange(Sender: TObject);
begin

  if rbNome.Checked = true then
      begin
         With qryRepresentante do
           begin
             Close;
             SQL.Clear;
             SQL.Add('select * from representante where nome like '+ QuotedStr('%' + editPesquisaRepresentantes.Text + '%') + ' order by nome' );
             Open();
           end;
      end;

   if rbCNPJ.Checked = true then
      begin
         With qryRepresentante do
           begin
             Close;
             SQL.Clear;
             SQL.Add('select * from representante where CNPJ like '+ QuotedStr('%' + editPesquisaRepresentantes.Text + '%') + ' order by nome' );
             Open();
           end;
      end;

        definirTamanhoDaLinhaDaGrid;

end;

procedure TfrmRepresentante.editPesquisaRepresentantesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_DOWN then
        qryRepresentante.Next;
  if Key = VK_UP then
        qryRepresentante.Prior;
end;

procedure TfrmRepresentante.editPesquisaRepresentantesKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     begin
       capturarRepresentante;
       Key := #0;
     end;
end;

procedure TfrmRepresentante.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryRepresentante.Close;
end;


procedure TfrmRepresentante.FormShow(Sender: TObject);
begin
  qryRepresentante.Open;
  editPesquisaRepresentantes.SetFocus;
  definirTamanhoDaLinhaDaGrid;
  configurarEnables(0);
end;




procedure TfrmRepresentante.gridRepresentanteDblClick(Sender: TObject);
begin
 capturarRepresentante;
end;

procedure TfrmRepresentante.gridRepresentanteDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

    //zebrando o dbgrid
    if Odd(gridRepresentante.DataSource.DataSet.RecNo) then
        gridRepresentante.Canvas.Brush.Color := $00CFCFCF
       else
          gridRepresentante.Canvas.Brush.Color := clWhite;


    //mudando a cor da sele��o
    if ( gdSelected in State ) then
         begin
            gridRepresentante.Canvas.Brush.Color := $00BC7B50;
             gridRepresentante.Canvas.Font.Color := clWhite;
              gridRepresentante.Canvas.Font.Style := [fsBold];
         end;



        gridRepresentante.Canvas.FillRect( Rect );
        gridRepresentante.DefaultDrawColumnCell( Rect, DataCol, Column, State );


   //  mudando a posi��o e alinhamento vertical do texto de cada linha
     gridRepresentante.Canvas.TextRect(Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText);

end;

procedure TfrmRepresentante.rbCNPJClick(Sender: TObject);
begin
    editPesquisaRepresentantes.Clear;
    editPesquisaRepresentantes.SetFocus;
end;

procedure TfrmRepresentante.rbNomeClick(Sender: TObject);
begin
  editPesquisaRepresentantes.Clear;
  editPesquisaRepresentantes.SetFocus;
end;

initialization
RegisterClass(TfrmRepresentante);

finalization
UnRegisterClass(TfrmRepresentante);

end.
