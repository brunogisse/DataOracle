unit UCompraUsina;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.StdCtrls, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, System.UITypes;

type
  TdbGridPadrao = class(TDBGrid);
  TfrmCompraUsina = class(TForm)
    PainelTOPO: TPanel;
    painelBotoes: TPanel;
    painelBtnNovo: TPanel;
    btnNovo: TSpeedButton;
    PainelCancelar: TPanel;
    btnCancelar: TSpeedButton;
    painelSalvar: TPanel;
    btnSalvar: TSpeedButton;
    PainelExcluir: TPanel;
    btnExcluir: TSpeedButton;
    labelTitulo: TLabel;
    qryUsina: TFDQuery;
    qryUsinaUSINAID: TFDAutoIncField;
    qryUsinaRAZAO_SOCIAL: TStringField;
    qryUsinaNOME_FANTASIA: TStringField;
    qryUsinaENDERECO: TStringField;
    qryUsinaBAIRRO: TStringField;
    qryUsinaCIDADE: TStringField;
    qryUsinaUF: TStringField;
    qryUsinaTELEFONE: TStringField;
    dsUsina: TDataSource;
    qryProduto: TFDQuery;
    qryProdutoPRODUTOID: TIntegerField;
    qryProdutoDESCRICAO: TStringField;
    dsProduto: TDataSource;
    tcCompraUsina: TFDTransaction;
    qryCompraUsina: TFDQuery;
    dsCompraUsina: TDataSource;
    qryCompraUsinaCOMPRAID: TIntegerField;
    qryCompraUsinaUSINAID: TIntegerField;
    qryCompraUsinaDATA_COMPRA: TDateField;
    qryCompraUsinaVOLUME_COMPRA: TFMTBCDField;
    qryCompraUsinaVALOR_COMPRA: TFMTBCDField;
    qryCompraUsinaPRODUTOID: TIntegerField;
    qryCompraUsinaPRODUTO: TStringField;
    qryCompraUsinaUSINAID_FROMU: TIntegerField;
    qryCompraUsinaESTOQUEID: TIntegerField;
    qryCompraUsinaUSINAID_EU: TIntegerField;
    qryCompraUsinaPRODUTOID_EU: TIntegerField;
    gridCompra: TDBGrid;
    qryEstoqueUsina: TFDQuery;
    qryEstoqueUsinaESTOQUEID: TFDAutoIncField;
    qryEstoqueUsinaUSINAID: TIntegerField;
    qryEstoqueUsinaPRODUTOID: TIntegerField;
    qryEstoqueUsinaESTOQUE: TFMTBCDField;
    dsEstoqueUsina: TDataSource;
    qryCompraUsinaESTOQUE_USINA_ID: TIntegerField;
    qryCompraUsinaUSINA: TStringField;
    PainelCentral: TPanel;
    gbEdits: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    maskeditdata: TMaskEdit;
    editUsina: TEdit;
    editProduto: TEdit;
    editEstoque: TEdit;
    editVolume: TEdit;
    editValor: TEdit;
    gbMotivo: TGroupBox;
    qryMovimento: TFDQuery;
    dsMovimento: TDataSource;
    qryMovimentoMOVIMENTOID: TIntegerField;
    qryMovimentoPRODUTOID: TIntegerField;
    qryMovimentoESTOQUEID: TIntegerField;
    qryMovimentoUSINAID: TIntegerField;
    qryMovimentoDATA: TDateField;
    qryMovimentoTIPO: TStringField;
    qryMovimentoVOLUME: TFMTBCDField;
    qryMovimentoVALOR: TFMTBCDField;
    qryMovimentoMOTIVO: TStringField;
    qryMovimentoESTOQUE_ANTERIOR: TFMTBCDField;
    cbExcluir: TCheckBox;
    labelCaracteres: TLabel;
    labelOperation: TLabel;
    ImgPrincipal: TImage;
    gbPesquisaCompra: TGroupBox;
    memoMotivo: TEdit;
    Label7: TLabel;
    DateVencimentoDE: TMaskEdit;
    Label8: TLabel;
    DateVencimentoATE: TMaskEdit;
    Panel1: TPanel;
    PainelConsultar: TPanel;
    btnConsultar: TSpeedButton;
    qryCompraUsinaREPRESENTANTEID: TIntegerField;
    qryEstoqueUsinaREPRESENTANTEID: TIntegerField;
    qryMovimentoREPRESENTANTEID: TIntegerField;
    labelRepresentante: TLabel;
    editRepresentante: TEdit;
    dsRepresentante: TDataSource;
    qryRepresentante: TFDQuery;
    qryRepresentanteREPRESENTANTEID: TIntegerField;
    qryRepresentanteNOME: TStringField;
    qryRepresentanteCIDADE: TStringField;
    qryRepresentanteCNPJ: TStringField;
    labelConsulta: TLabel;
    procedure editUsinaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editUsinaKeyPress(Sender: TObject; var Key: Char);
    procedure editProdutoKeyPress(Sender: TObject; var Key: Char);
    procedure editEstoqueKeyPress(Sender: TObject; var Key: Char);
    procedure editVolumeKeyPress(Sender: TObject; var Key: Char);
    procedure editValorKeyPress(Sender: TObject; var Key: Char);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure DateVencimentoDEKeyPress(Sender: TObject; var Key: Char);
    procedure DateVencimentoATEKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure gridCompraDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure memoMotivoEnter(Sender: TObject);
    procedure cbExcluirClick(Sender: TObject);
    procedure memoMotivoChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure editValorChange(Sender: TObject);
    procedure editRepresentanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editRepresentanteKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    procedure ConfigurarEnables( status : integer );
    function VerificarCamposVazios : boolean ;
    procedure EditarEstoqueUsina( Action : string; usina, produto, representante : integer);
    procedure AtualizarQuerrys;
    procedure TrabalharEdits;
    procedure definirTamanhoDaLinhaDaGrid;
    procedure RegistrarMovimentoEstoque( TypeAction : string);
    procedure DataParametro;



  public
    { Public declarations }
  end;

var
  frmCompraUsina: TfrmCompraUsina;

implementation

{$R *.dfm}

uses UPrincipalPetrotorque, UselecionarUsinaEproduto, UProduto, UUsinas,
  UdefinirEstoque, UConverterFloat, URepresentante;


procedure TfrmCompraUsina.definirTamanhoDaLinhaDaGrid;
begin

  //Define o tamanho de cada linha do DBgrid ap�s ativar a QUERY
  TdbGridPadrao(gridCompra).DefaultRowHeight := 25;
  TdbGridPadrao(gridCompra).ClientHeight := ( 25 * TdbGridPadrao(gridCompra).RowCount ) + 25;

end;


procedure TfrmCompraUsina.EditarEstoqueUsina( Action : string; usina, produto, representante : integer);
begin


        if Action = 'editando' then
           begin
             with qryEstoqueUsina do
                 begin
                   Close;
                   SQL.Clear;
                   SQL.Add('select * from estoque_usina where (usinaid = :usina) and (produtoid = :produto) and (representanteid = :representante)');
                   ParamByName('representante').AsInteger := representante;
                   ParamByName('usina').AsInteger := usina;
                   ParamByName('produto').AsInteger := produto;
                   open;
                 end;
           end;

        if Action = 'concluido' then
           begin
              with qryEstoqueUsina do
                 begin
                   Close;
                   SQL.Clear;
                   SQL.Add('select * from estoque_usina ');
                   open;
                 end;
           end;

end;

procedure TfrmCompraUsina.AtualizarQuerrys;
begin
   qryUsina.Close;
   qryEstoqueUsina.Close;
   qryProduto.Close;
   qryCompraUsina.Close;
   qryUsina.Open();
   qryEstoqueUsina.Open();
   qryProduto.Open();
   qryCompraUsina.Open();
end;

procedure TfrmCompraUsina.btnCancelarClick(Sender: TObject);
begin
 TrabalharEdits;
 ConfigurarEnables(0);
 labelOperation.Visible := False;
 editRepresentante.Clear;
 qryCompraUsina.Cancel;

end;

procedure TfrmCompraUsina.btnConsultarClick(Sender: TObject);
begin
    DataParametro;
end;

procedure TfrmCompraUsina.btnEditarClick(Sender: TObject);
begin
 ConfigurarEnables(1);
 qryCompraUsina.Edit;
end;

procedure TfrmCompraUsina.btnExcluirClick(Sender: TObject);
var AuxErro, Fornecedor, Valor, Volume : string;

begin
    Fornecedor := qryUsina['NOME_FANTASIA'];
    Valor      := FormatFloat('R$ #,0.00', qryCompraUsina['VALOR_COMPRA']);
    Volume     := FormatFloat('#,0.00', qryCompraUsina['VOLUME_COMPRA']);

   if MessageBox( Application.Handle, PChar('Voc� est� prestes excluir a compra.  ' +#13 + 'Por favor, verifique os detalhes antes de confirmar:' + #13 + #13 +
                                            'FORNECEDOR:  ' + Fornecedor + #13
                                          + 'VALOR:               ' + Valor + #13
                                          + 'VOLUME:           ' + Volume +
                                             #13 + #13 + 'Deseja continuar? '),'Aten��o', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
       try
         //localiza o estoque e faz a altera��o diminuindo o saldo de acordo com o valor que havia sido comprado...
         qryEstoqueUsina.Locate('estoqueid' , qryCompraUsina['ESTOQUE_USINA_ID'], []);
         qryEstoqueUsina.Edit;
         qryEstoqueUsina['ESTOQUE'] := qryEstoqueUsina['ESTOQUE'] - qryCompraUsina['VOLUME_COMPRA'];

         //registra a movimenta��o do estoque como "S" (sa�da)...
         RegistrarMovimentoEstoque('excluindo');

         qryEstoqueUsina.Post;
         tcCompraUsina.CommitRetaining;
         TrabalharEdits;

         //deleta a compra...
         qryCompraUsina.Delete;
        except
         on E : Exception do
           begin
             tcCompraUsina.RollbackRetaining;
             AuxErro := Copy(E.Message,0,500);
             MessageDlg('Erro ao excluir a compra. ' + #13 + #13 +'Informa��o T�cnica: '+#13+#13 + AuxErro,TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
           end;
       end;
    end
     else
      begin
        memoMotivo.Clear;
        memoMotivo.Visible := False;
        cbExcluir.Checked := False;
      end;

    AtualizarQuerrys;
    definirTamanhoDaLinhaDaGrid;
end;

procedure TfrmCompraUsina.btnNovoClick(Sender: TObject);
begin
  ConfigurarEnables(1);
  editRepresentante.SetFocus;
  definirTamanhoDaLinhaDaGrid;
  labelOperation.Visible := True; labelOperation.Caption := 'Registrando nova compra...';
  qryCompraUsina.Insert;
end;


procedure TfrmCompraUsina.TrabalharEdits;
begin


      begin
        editUsina.Clear;
        editProduto.Clear;
        editEstoque.Clear;
        editVolume.Clear;
        editValor.Clear;
      end;

end;

procedure TfrmCompraUsina.btnSalvarClick(Sender: TObject);
begin

 if VerificarCamposVazios = True then
     begin
      //procedure que seleciona o estoque correto na tabela estoque_usina para ser editado...
        EditarEstoqueUsina('editando', qryCompraUsina['USINAID'], qryProduto['PRODUTOID'], qryRepresentante['REPRESENTANTEID']);

      //captura os valores informados para serem gravados na tabela de compras...
        qryCompraUsina['ESTOQUE_USINA_ID'] := qryEstoqueUsina['ESTOQUEID'];
        qryCompraUsina['DATA_COMPRA']      := StrToDate(maskeditdata.Text);
        qryCompraUsina['VALOR_COMPRA']     := StrToFloat(editValor.Text);
        qryCompraUsina['VOLUME_COMPRA']    := StrToFloat(editVolume.Text);
        qryCompraUsina.Post;

      //abre edi��o na tabela estoque_usina e soma o estoque comprado...
        qryEstoqueUsina.Edit;
        qryEstoqueUsina['ESTOQUE'] := qryEstoqueUsina['ESTOQUE'] + StrToFloat(editVolume.Text);

        //procedure que registra a movimenta��o do estoque como tipo "E" (entrada)...
        RegistrarMovimentoEstoque('salvando');

        qryEstoqueUsina.Post;

        EditarEstoqueUsina('concluido', 0, 0, 0);

       try
         tcCompraUsina.CommitRetaining;
       except
          tcCompraUsina.RollbackRetaining;
       end;
        AtualizarQuerrys;
        TrabalharEdits;
        definirTamanhoDaLinhaDaGrid;
        ConfigurarEnables(0);
        labelOperation.Visible := False;
      end;

end;

procedure TfrmCompraUsina.cbExcluirClick(Sender: TObject);
begin
  if cbExcluir.Checked = true then
     begin
      memoMotivo.Visible := true;
      memoMotivo.SetFocus;
      labelCaracteres.Visible := True;
     end;
  if cbExcluir.Checked = false then
     begin
      labelCaracteres.Visible := false;
      memoMotivo.Clear;
      PainelExcluir.Visible := False;
      memoMotivo.Visible := False;
     end;
end;

procedure TfrmCompraUsina.ConfigurarEnables(status: integer);
begin
   if status = 0 then
       begin
         btnNovo.Enabled := True;
         btnExcluir.Enabled := True;
         gridCompra.Enabled := True;
         btnCancelar.Enabled := False;
         btnSalvar.Enabled := False;
         gbEdits.Enabled := False;
         gbPesquisaCompra.Enabled := True;
       end;
   if status = 1 then
       begin
         btnNovo.Enabled := False;
         btnExcluir.Enabled := False;
         gridCompra.Enabled := False;
         btnCancelar.Enabled := True;
         btnSalvar.Enabled := True;
         gbEdits.Enabled := True;
         gbPesquisaCompra.Enabled := False;
       end;
end;

procedure TfrmCompraUsina.DataParametro;
begin
 with qryCompraUsina do
      begin
        Close;
        ParamByName('inicio').AsDate := StrToDate(DateVencimentoDE.Text);
        ParamByName('fim').AsDate    := StrToDate(DateVencimentoATE.Text);
        Open();
      end;

      definirTamanhoDaLinhaDaGrid;
end;

procedure TfrmCompraUsina.DateVencimentoATEKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
      begin
        Key := #0;
      end;
end;

procedure TfrmCompraUsina.DateVencimentoDEKeyPress(Sender: TObject;
  var Key: Char);
begin
 if Key = #13 then
      begin
        Key := #0;
      end;
end;

procedure TfrmCompraUsina.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
      begin
        Key := #0;
      end;
end;

procedure TfrmCompraUsina.editEstoqueKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
      begin
        Key := #0;
      end;
end;

procedure TfrmCompraUsina.editProdutoKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
      begin
        Key := #0;
      end;
end;

procedure TfrmCompraUsina.editRepresentanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_RETURN then
     begin
          try
            Application.CreateForm(TfrmRepresentante, frmRepresentante);
            frmRepresentante.Caminho := 'comprausina';
            frmRepresentante.ShowModal;
          finally
              FreeAndNil(frmRepresentante);
          end;
     end;
end;

procedure TfrmCompraUsina.editRepresentanteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     Key := #0;
end;

procedure TfrmCompraUsina.editUsinaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = VK_RETURN then
      begin
        try
          Application.CreateForm(TfrmSelecionarEstoqueProduto, frmSelecionarEstoqueProduto);
          frmSelecionarEstoqueProduto.caminhoEntrega := 'comprausina';
          frmSelecionarEstoqueProduto.ShowModal;
          editVolume.SetFocus;
        finally
            FreeAndNil(frmSelecionarEstoqueProduto);
        end;
      end;

end;

procedure TfrmCompraUsina.editUsinaKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
      begin
        Key := #0;
      end;
end;

procedure TfrmCompraUsina.editValorChange(Sender: TObject);
begin
 editValor.Text := FormatarMoeda(editValor.Text);
 editValor.SelStart := Length(editValor.Text);
end;

procedure TfrmCompraUsina.editValorKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
      begin
        Key := #0;
      end;
end;

procedure TfrmCompraUsina.editVolumeKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
      begin
        Key := #0;
      end;
end;

procedure TfrmCompraUsina.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 qryUsina.Close;
 qryEstoqueUsina.Close;
 qryProduto.Close;
 qryCompraUsina.Close;
 qryRepresentante.Close;
end;

procedure TfrmCompraUsina.FormShow(Sender: TObject);
begin
 qryUsina.Open();
 qryEstoqueUsina.Open();
 qryProduto.Open();
 qryCompraUsina.Open();
 qryRepresentante.Open();
 ConfigurarEnables(0);

 maskeditdata.EditText  := DateToStr(Date);
 DateVencimentoDE.Text  := DateToStr(Date);
 DateVencimentoATE.Text := DateToStr(Date);

 DataParametro;

end;



procedure TfrmCompraUsina.gridCompraDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
      //zebrando o dbgrid
    if Odd(gridCompra.DataSource.DataSet.RecNo) then
        gridCompra.Canvas.Brush.Color := $00E2E2E2
       else
          gridCompra.Canvas.Brush.Color := clWhite;


    //mudando a cor da sele��o
    if ( gdSelected in State ) then
         begin
            gridCompra.Canvas.Brush.Color := $00BC7B50;
             gridCompra.Canvas.Font.Color := clWhite;
              gridCompra.Canvas.Font.Style := [fsBold];
         end;



        gridCompra.Canvas.FillRect( Rect );
        gridCompra.DefaultDrawColumnCell( Rect, DataCol, Column, State );

           //  mudando a posi��o e alinhamento vertical do texto de cada linha
     gridCompra.Canvas.TextRect(Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText);
end;


    procedure TfrmCompraUsina.memoMotivoChange(Sender: TObject);
begin
  if ( memoMotivo.GetTextLen > 9 ) then
       PainelExcluir.Visible := True
      else
       PainelExcluir.Visible := False;
end;

procedure TfrmCompraUsina.memoMotivoEnter(Sender: TObject);
begin
 if memoMotivo.Text = 'Digite aqui o motivo...' then
      memoMotivo.Clear;
end;

procedure TfrmCompraUsina.RegistrarMovimentoEstoque( TypeAction : string);
begin

      if qryMovimento.Active = false then qryMovimento.Open();

     if TypeAction = 'salvando' then
         begin
           qryMovimento.Insert;
           qryMovimento['PRODUTOID']          := qryProduto['PRODUTOID'];
           qryMovimento['REPRESENTANTEID']    := qryRepresentante['REPRESENTANTEID'];
           qryMovimento['USINAID']            := qryCompraUsina['USINAID'];
           qryMovimento['ESTOQUEID']          := qryEstoqueUsina['ESTOQUEID'];
           qryMovimento['DATA']               := StrToDate(maskeditdata.Text);
           qryMovimento['VALOR']              := StrToFloat(editValor.Text);
           qryMovimento['VOLUME']             := StrToFloat(editVolume.Text);
           qryMovimento['ESTOQUE_ANTERIOR']   := qryEstoqueUsina['ESTOQUE'];
           qryMovimento['TIPO']               := 'E';
           qryMovimento['MOTIVO']             := 'Entrada autom�tica referente � compra';
         end;
     if TypeAction = 'excluindo' then
         begin

           qryMovimento.Insert;
           qryMovimento['ESTOQUEID']          := qryEstoqueUsina['ESTOQUEID'];
           qryMovimento['REPRESENTANTEID']    := qryRepresentante['REPRESENTANTEID'];
           qryMovimento['USINAID']            := qryEstoqueUsina['USINAID'];
           qryMovimento['PRODUTOID']          := qryEstoqueUsina['PRODUTOID'];
           qryMovimento['DATA']               := qryCompraUsina['DATA_COMPRA'];
           qryMovimento['VALOR']              := qryCompraUsina['VALOR_COMPRA'];
           qryMovimento['VOLUME']             := qryCompraUsina['VOLUME_COMPRA'];
           qryMovimento['ESTOQUE_ANTERIOR']   := qryEstoqueUsina['ESTOQUE'];
           qryMovimento['TIPO']               := 'S';
           qryMovimento['MOTIVO']             := 'Exclus�o da Compra. Motivo:' + memoMotivo.Text;
         end;

       qryMovimento.Post;

end;

//verificando se os componentes s�o edits e se est�o vazios...
function TfrmCompraUsina.VerificarCamposVazios : Boolean;
 var i : integer;
  begin
   Result := True;
    for I := 0 to gbEdits.ControlCount -1 do
       begin
         if (gbEdits.Controls[i] is TEdit) then
         if Tedit(gbEdits.Controls[i]).Text = '' then
           begin
                MessageDlg('Por favor, preencha o(s) campo(s) vazio(s)',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
               (gbEdits.Controls[i] as TEdit).SetFocus;
                Result := False;
                break;
           end;
       end;
  end;

end.
