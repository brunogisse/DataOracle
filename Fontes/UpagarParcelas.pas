unit UpagarParcelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Mask, Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.ComCtrls, System.UITypes, Vcl.Imaging.pngimage, DateUtils;

type
  TdbGridPadrao = class(TDBGrid);
  TfrmPagarParcelas = class(TForm)
    PainelTopo: TPanel;
    PainelCentral: TPanel;
    gbPesquisaPosto: TGroupBox;
    editPesquisaNF: TEdit;
    qryPagarParcelas: TFDQuery;
    tcPagarParcelas: TFDTransaction;
    dsPagarParcelas: TDataSource;
    qryPagarParcelasPARCELAID: TFDAutoIncField;
    qryPagarParcelasVENDAID: TIntegerField;
    qryPagarParcelasFORMA_PGTO_ID: TIntegerField;
    qryPagarParcelasSTATUS: TStringField;
    qryPagarParcelasQTDE_PARCELAS: TIntegerField;
    qryPagarParcelasVALOR_PARCELA: TFMTBCDField;
    qryPagarParcelasDATA_PARCELA: TDateField;
    qryPagarParcelasDOCUMENTO: TStringField;
    qryPagarParcelasNF: TIntegerField;
    qryPagarParcelasEMISSAO_NF: TDateField;
    qryPagarParcelasACESSO: TStringField;
    qryPagarParcelasPARCELA: TStringField;
    qryVendas: TFDQuery;
    dsVendas: TDataSource;
    labelNF: TLabel;
    Panel1: TPanel;
    PainelConsultar: TPanel;
    btnConsultar: TSpeedButton;
    qryPagarParcelasDATA_PGTO_PARCELA: TDateField;
    qryPagarParcelasFORMAID: TIntegerField;
    qryPagarParcelasDESCRICAO: TStringField;
    DateVencimentoDE: TMaskEdit;
    Label2: TLabel;
    DateVencimentoATE: TMaskEdit;
    labelVencimento: TLabel;
    labelTituloParcelas: TLabel;
    painelGrid: TPanel;
    gridPagarParcelas: TDBGrid;
    qryUsina: TFDQuery;
    dsUsina: TDataSource;
    qryEstoqueUsina: TFDQuery;
    dsEstoqueUsina: TDataSource;
    qryUsinaUSINAID: TFDAutoIncField;
    qryUsinaRAZAO_SOCIAL: TStringField;
    qryUsinaNOME_FANTASIA: TStringField;
    qryUsinaENDERECO: TStringField;
    qryUsinaBAIRRO: TStringField;
    qryUsinaCIDADE: TStringField;
    qryUsinaUF: TStringField;
    qryUsinaTELEFONE: TStringField;
    qryPagarParcelasVALOR_TOTAL_NF: TFMTBCDField;
    qryPagarParcelasVOLUME_PARCELADO: TFMTBCDField;
    qryPagarParcelasVOLUME_RESTANTE: TFMTBCDField;
    qryVendasVENDAID: TFDAutoIncField;
    qryVendasREPRESENTANTEID: TIntegerField;
    qryVendasPOSTOID: TIntegerField;
    qryVendasPRODUTOID: TIntegerField;
    qryVendasMOTORISTAID: TIntegerField;
    qryVendasCORRETORID: TIntegerField;
    qryVendasUSINAID: TIntegerField;
    qryVendasNF: TIntegerField;
    qryVendasVALOR_NF: TFMTBCDField;
    qryVendasDATA_EMISSAO_NF: TDateField;
    qryVendasVOLUME: TFMTBCDField;
    qryVendasTAXA_FRETE: TBCDField;
    qryVendasVALOR_TOTAL_FRETE: TFMTBCDField;
    qryVendasTAXA_CORRETAGEM: TBCDField;
    qryVendasVALOR_TOTAL_CORRETAGEM: TFMTBCDField;
    qryVendasVENCIMENTO_NF_ATUAL: TDateField;
    qryVendasSTATUS: TStringField;
    qryVendasATUALIZAR_PARCELA: TIntegerField;
    qryVendasPARCELAS_GERADAS: TStringField;
    qryVendasTOTAL_NF_RECEBIDO: TFMTBCDField;
    qryVendasVOLUME_TOTAL_RETIRADO: TFMTBCDField;
    qryVendasVALOR_RECEBIDO_MES: TFMTBCDField;
    qryVendasVOLUME_RECEBIDO_MES: TFMTBCDField;
    qryPagarParcelasVOLUME_VENDA_TOTAL: TFMTBCDField;
    qryEstoqueUsinaESTOQUEID: TFDAutoIncField;
    qryEstoqueUsinaUSINAID: TIntegerField;
    qryEstoqueUsinaPRODUTOID: TIntegerField;
    qryEstoqueUsinaESTOQUE: TFMTBCDField;
    GroupBox1: TGroupBox;
    labelDataPagamento: TLabel;
    painelBotoes: TPanel;
    painelbtnPagar: TPanel;
    btnPagar: TSpeedButton;
    maskEditDataPagamento: TMaskEdit;
    painelReverter: TPanel;
    PainelReverterPagamento: TPanel;
    SpeedButton1: TSpeedButton;
    Image1: TImage;
    qryMovimento: TFDQuery;
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
    dsMovimento: TDataSource;
    labelCaracteres: TLabel;
    cbExcluir: TCheckBox;
    memoMotivo: TEdit;
    qryEstoqueUsinaREPRESENTANTEID: TIntegerField;
    qryMovimentoREPRESENTANTEID: TIntegerField;
    dsRepresentante: TDataSource;
    qryRepresentante: TFDQuery;
    qryRepresentanteREPRESENTANTEID: TIntegerField;
    qryRepresentanteNOME: TStringField;
    qryRepresentanteCIDADE: TStringField;
    qryRepresentanteCNPJ: TStringField;
    qryVendasESTOQUEID: TIntegerField;
    qryVendasVALOR_COMBUSTIVEL: TFMTBCDField;
    qryPagarParcelasREPRESENTANTEID: TIntegerField;
    Label1: TLabel;
    labelRepresentante: TLabel;
    editRepresentante: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnPagarClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure editPesquisaNFKeyPress(Sender: TObject; var Key: Char);
    procedure gridPagarParcelasDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cbExcluirClick(Sender: TObject);
    procedure memoMotivoChange(Sender: TObject);
    procedure editRepresentanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

  private
    { Private declarations }

    procedure EfetuarPGToDaParcela;
    procedure definirTamanhoDaLinhaDaGrid;
    procedure EditarEstoqueUsina( Action : string; usina, produto, estoqueid : integer);
    procedure RegistrarMovimentoEstoque( TypeAction : string);


  public
    { Public declarations }
  end;

var
  frmPagarParcelas: TfrmPagarParcelas;

implementation

{$R *.dfm}

uses UPrincipalPetrotorque, UReverterPagamentos, URepresentante;



procedure TfrmPagarParcelas.RegistrarMovimentoEstoque( TypeAction : string);
var NF : string;
begin

      if qryMovimento.Active = false then qryMovimento.Open();



     if TypeAction = 'salvando' then
         begin
           NF := qryPagarParcelas['NF'];
           qryMovimento.Insert;
           qryMovimento['REPRESENTANTEID']    := qryVendas['REPRESENTANTEID'];
           qryMovimento['PRODUTOID']          := qryVendas['PRODUTOID'];
           qryMovimento['USINAID']            := qryVendas['USINAID'];
           qryMovimento['ESTOQUEID']          := qryEstoqueUsina['ESTOQUEID'];
           qryMovimento['DATA']               := StrToDate(maskEditDataPagamento.Text);
           qryMovimento['VALOR']              := qryPagarParcelas['VALOR_PARCELA'];
           qryMovimento['VOLUME']             := qryPagarParcelas['VOLUME_PARCELADO'];
           qryMovimento['ESTOQUE_ANTERIOR']   := qryEstoqueUsina['ESTOQUE'];
           qryMovimento['TIPO']               := 'S';
           qryMovimento['MOTIVO']             := 'Pagamento de Parcela. Ref: NF '  + NF +' | Motivo: '+ memoMotivo.Text;
         end;

       qryMovimento.Post;

       labelCaracteres.Visible := False;
       memoMotivo.Visible := False;
       cbExcluir.Checked := False;

end;

procedure TfrmPagarParcelas.EditarEstoqueUsina( Action : string; usina, produto, estoqueid : integer);
begin

        if Action = 'editando' then
            begin
             with qryEstoqueUsina do
                 begin
                   Close;
                   SQL.Clear;
                   SQL.Add('select * from estoque_usina where (usinaid = :usina) and (produtoid = :produto) and (estoqueid = :estoqueid)');
                   ParamByName('usina').AsInteger := usina;
                   ParamByName('produto').AsInteger := produto;
                   ParamByName('estoqueid').AsInteger := estoqueid;
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

procedure TfrmPagarParcelas.btnConsultarClick(Sender: TObject);
 var mes : word;
begin

      if editPesquisaNF.Text = '' then
         try
           with qryPagarParcelas do
              begin
                 Close;
                 SQL.Clear;
                 SQL.Clear;
                 SQL.Add('SELECT parc.parcelaid, parc.vendaid, parc.forma_pgto_id, parc.status, parc.qtde_parcelas, parc.valor_total_nf,');
                 SQL.Add('parc.valor_parcela, parc.data_parcela, parc.volume_venda_total,');
                 SQL.Add('parc.volume_parcelado, parc.documento, parc.volume_restante, parc.nf, parc.emissao_nf,');
                 SQL.Add('parc.acesso, parc.parcela, parc.data_pgto_parcela,');

                 SQL.Add('fp.formaid, fp.descricao,');

                 SQL.Add('v.vendaid as vendaFK, v.nf as nfVenda,');

                 SQL.Add('r.representanteid ');

                 SQL.Add('from parcela_venda_para_postos PARC, forma_pgto FP, venda_para_postos V, representante r ');

                 SQL.Add('where ') ;
                 SQL.Add('(PARC.forma_pgto_id = FP.formaid) and ');
                 SQL.Add('(parc.vendaid = v.vendaid) and ');
                 SQL.Add('(data_parcela between :DE and :ATE) and  (parc.status = ''ABERTO'') and (v.representanteid = r.representanteid) and');
                 SQL.Add('(r.representanteid = :representanteid)');
                 ParamByName('representanteid').AsInteger := qryRepresentante['REPRESENTANTEID'];
                 ParamByName('DE').AsDate :=  StrToDate(DateVencimentoDE.EditText);
                 ParamByName('ATE').AsDate := StrToDate(DateVencimentoATE.EditText);
                 Open();
              end;
         Except
             on E : Exception do
                MessageDlg('Informe um per�odo v�lido',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
         end
            else
              with qryPagarParcelas do
                  begin
                       Close;
                       SQL.Clear;
                       SQL.Add('SELECT parc.parcelaid, parc.vendaid, parc.forma_pgto_id, parc.status, parc.qtde_parcelas, parc.valor_total_nf,');
                       SQL.Add('parc.valor_parcela, parc.data_parcela, parc.volume_venda_total,');
                       SQL.Add('parc.volume_parcelado, parc.documento, parc.volume_restante, parc.nf, parc.emissao_nf,');
                       SQL.Add('parc.acesso, parc.parcela, parc.data_pgto_parcela,');

                       SQL.Add('fp.formaid, fp.descricao,');

                       SQL.Add('v.vendaid as vendaFK, v.nf as nfVenda,');

                       SQL.Add('r.representanteid ');

                       SQL.Add('from parcela_venda_para_postos PARC, forma_pgto FP, venda_para_postos V, representante r ');

                       SQL.Add('where ') ;

                       SQL.Add('(v.representanteid = r.representanteid) and ') ;
                       SQL.Add('(PARC.forma_pgto_id = FP.formaid) and ');
                       SQL.Add('(parc.vendaid = v.vendaid) and ');
                       SQL.Add('(parc.status = ''ABERTO'') and ');
                       SQL.Add('(parc.nf = :NF) and');
                       SQL.Add('(r.representanteid = :representanteid)');
                       ParamByName('NF').AsInteger := StrToInt(editPesquisaNF.Text);
                       ParamByName('representanteid').AsInteger := qryRepresentante['REPRESENTANTEID'];
                       Open();
                  end;

                     definirTamanhoDaLinhaDaGrid;


end;

procedure TfrmPagarParcelas.btnPagarClick(Sender: TObject);
 var AuxError : string;
begin
    if (qryPagarParcelas.RecordCount > 0) then
               begin
                  if MessageBox(Application.Handle,'Confirma o pagamento da parcela?','Confirma��o', MB_YESNO + MB_ICONQUESTION) = mrYes  then
                    try
                       EfetuarPGToDaParcela;
                    except
                    on E : exception do
                      begin
                        AuxError := Copy( E.Message,0,500);
                        MessageDlg('Erro ao pagar a parcela. ' + #13 + #13 +
                                   'Cheque se a data de pagamento � v�lida ou se o problema � diferente da indica��o t�cnica abaixo: ' + #13 + #13 +
                                   'Erro T�cnico: '+#13+#13 + AuxError,TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
                      end;
                    end;
               end
            else
              MessageDlg('N�o h� parcelas a serem pagas'+#13+#13,TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
end;

procedure TfrmPagarParcelas.cbExcluirClick(Sender: TObject);
begin
  if cbExcluir.Checked = true then
     begin
      memoMotivo.Visible := true;
      labelCaracteres.Visible := True;
     end;
  if cbExcluir.Checked = false then
     begin
      labelCaracteres.Visible := false;
      memoMotivo.Clear;
      painelbtnPagar.Visible := False;
      memoMotivo.Visible := False;
     end;
end;

procedure TfrmPagarParcelas.definirTamanhoDaLinhaDaGrid;
begin

  //Define o tamanho de cada linha do DBgrid ap�s ativar a QUERY
  TdbGridPadrao(gridPagarParcelas).DefaultRowHeight := 25;
  TdbGridPadrao(gridPagarParcelas).ClientHeight := ( 25 * TdbGridPadrao(gridPagarParcelas).RowCount ) + 25;

end;

procedure TfrmPagarParcelas.editPesquisaNFKeyPress(Sender: TObject;
  var Key: Char);
begin
   if Key = #13 then
      begin
        btnConsultar.Click;
        Key := #0;
      end;
end;

procedure TfrmPagarParcelas.editRepresentanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_RETURN then
     begin
          try
            Application.CreateForm(TfrmRepresentante, frmRepresentante);
            frmRepresentante.Caminho := 'pagarparcelas';
            frmRepresentante.ShowModal;
            qryPagarParcelas.Close;
          finally
            FreeAndNil(frmRepresentante);
          end;
     end;
end;

procedure TfrmPagarParcelas.EfetuarPGToDaParcela;
   var MesDoPagamento : word;
       i, QtdParcelas : integer;
       ValorParcela, VolumeParcelado : Double;

begin
        ValorParcela    := 0;
        VolumeParcelado := 0;

     // identifca��o de qual venda se trata. Importante para editar os valores de vendas e tamb�m para dar baixa
     // no estoque da usina correta, localizada na venda espec�fica....
        qryVendas.Locate('vendaid', qryPagarParcelas['VENDAID'], []);

        ValorParcela    := qryPagarParcelas['VALOR_PARCELA'];
        VolumeParcelado := qryPagarParcelas['VOLUME_PARCELADO'];


     // Atualiza��o na tabela das parcelas, identificando o status como pago e registrando a data de pagamento...
        qryPagarParcelas.Edit;
        qryPagarParcelas['STATUS'] := 'PAGO';
        qryPagarParcelas['DATA_PGTO_PARCELA'] := StrToDate(maskEditDataPagamento.EditText);
        qryPagarParcelas.Post;

     // Indica que todas as parcelas est�o bloqueadas para cancelamento de venda....
        QtdParcelas := qryPagarParcelas['QTDE_PARCELAS'];
        qryPagarParcelas.First;
          for i := 1 to QtdParcelas do
            begin
              qryPagarParcelas['PARCELAID'];
              qryPagarParcelas.Edit;
              qryPagarParcelas['ACESSO'] := 'BLOQUEADO';
              qryPagarParcelas.Post;
              qryPagarParcelas.Next;
            end;

     // Identificando a usina na tabela "ESTOQUE_USINA" atrav�s da tabela "VENDA_POSTOS"...
        EditarEstoqueUsina('editando', qryVendas['USINAID'], qryVendas['PRODUTOID'], qryVendas['ESTOQUEID']);

        qryEstoqueUsina.Edit;
        qryEstoqueUsina['ESTOQUE'] := qryEstoqueUsina['ESTOQUE'] - VolumeParcelado;

        //Registrando a movimenta��o de sa�da do estoque mediante o pagamento da parcela.
        //Est� neste trecho para captura a ID da tabela "Estoque_usina" que est� logo acima...
        RegistrarMovimentoEstoque('salvando');

        qryEstoqueUsina.Post;


       {editando a tabela vendas, ajustando o valor recebido at� o momento. Sequ�ncia:
        1 - captura o mes na vari�vel "CompararMes" para compara��o do mes de recebimento do valor.
        2 - se for o mesmo mes (ex: duas parcelas recebidas no mesmo m�s), o "VALOR_RECEBIDO_MES"
            recebe a soma da parcelas. Sen�o, substitui o valor pela parcela daquele m�s.}
            qryVendas.Edit;
            MesDoPagamento := MonthOf(StrToDate(maskEditDataPagamento.EditText));
        if qryVendas['VENCIMENTO_NF_ATUAL'] = Null then   //esse primeiro if contempla os casos de primeiro pagamentos...
            begin
            qryVendas['VALOR_RECEBIDO_MES']  := ValorParcela;
            qryVendas['VOLUME_RECEBIDO_MES'] := VolumeParcelado;
            end
           else
              begin
                 if ((MonthOf(qryVendas['VENCIMENTO_NF_ATUAL'])) = MesDoPagamento) then
                    begin
                      qryVendas['VALOR_RECEBIDO_MES']  := qryVendas['VALOR_RECEBIDO_MES'] + ValorParcela;
                      qryVendas['VOLUME_RECEBIDO_MES'] := qryVendas['VOLUME_RECEBIDO_MES'] + VolumeParcelado;
                    end
                   else
                     begin
                      qryVendas['VALOR_RECEBIDO_MES']  := ValorParcela;
                      qryVendas['VOLUME_RECEBIDO_MES'] := VolumeParcelado;
                     end;
              end;

      // 1 Recebe o valor da parcela e vai somando ao total recebido no momento, at� que seja o valor original da NF
      // 2 Faz a mesma coisa com o volume
      // 3 Atualiza a data de vencimento para ser usada como par�metro no relat�rio de fechamento
      // 4 bloqueia a venda para que n�o seja poss�vel fazer altera��es.
         qryVendas['TOTAL_NF_RECEBIDO']       := qryVendas['TOTAL_NF_RECEBIDO'] + ValorParcela;
         qryVendas['VOLUME_TOTAL_RETIRADO']   := qryVendas['VOLUME_TOTAL_RETIRADO'] + VolumeParcelado;
         qryVendas['STATUS']                  := '';
         qryVendas['VENCIMENTO_NF_ATUAL']     := StrToDate(maskEditDataPagamento.EditText);  {"Vencimento atual da NF" recebe a data escolhida
                                                                                                como data de quita��o}
         qryVendas.Post;

            try
              tcPagarParcelas.CommitRetaining;
            except
               tcPagarParcelas.RollbackRetaining;
            end;


    EditarEstoqueUsina('', 0, 0, 0);
    qryPagarParcelas.Close;
    qryPagarParcelas.Open();
    qryVendas.Close;
    qryVendas.Open();
    qryMovimento.Close;
    qryMovimento.Open();
    qryEstoqueUsina.Close;
    qryEstoqueUsina.Open();
    definirTamanhoDaLinhaDaGrid;

end;

procedure TfrmPagarParcelas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 qryPagarParcelas.Close;
 qryVendas.Close;
 qryUsina.Close;
 qryEstoqueUsina.Close;
 qryRepresentante.Close;

end;

procedure TfrmPagarParcelas.FormShow(Sender: TObject);
begin
 qryPagarParcelas.Open();
 qryVendas.Open();
 qryUsina.Open();
 qryEstoqueUsina.Open();
 qryRepresentante.Open();
 qryRepresentante.Locate('representanteid', 6, [] );
 editRepresentante.Text := qryRepresentante['NOME'];

// DateVencimentoDE.EditMask  := DateToStr(Date);
// DateVencimentoATE.EditMask := DateToStr(Date);

  definirTamanhoDaLinhaDaGrid;
end;

procedure TfrmPagarParcelas.gridPagarParcelasDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin



    //zebrando o dbgrid
    if Odd(gridPagarParcelas.DataSource.DataSet.RecNo) then
        gridPagarParcelas.Canvas.Brush.Color := $00CFCFCF
       else
          gridPagarParcelas.Canvas.Brush.Color := clWhite;


    //mudando a cor da sele��o
    if ( gdSelected in State ) then
         begin
            gridPagarParcelas.Canvas.Brush.Color := $00BC7B50;
             gridPagarParcelas.Canvas.Font.Color := clWhite;
              gridPagarParcelas.Canvas.Font.Style := [fsBold];
         end;



        gridPagarParcelas.Canvas.FillRect( Rect );
        gridPagarParcelas.DefaultDrawColumnCell( Rect, DataCol, Column, State );


   //  mudando a posi��o e alinhamento vertical do texto de cada linha
     gridPagarParcelas.Canvas.TextRect(Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText);


end;

procedure TfrmPagarParcelas.memoMotivoChange(Sender: TObject);
begin
  if ( memoMotivo.GetTextLen > 9 ) then
       painelbtnPagar.Visible := True
      else
       painelbtnPagar.Visible := False;
end;

procedure TfrmPagarParcelas.SpeedButton1Click(Sender: TObject);
begin
   try
       Application.CreateForm( TfrmReverterPagamentos, frmReverterPagamentos );
       frmReverterPagamentos.ShowModal;
   finally
        FreeAndNil(frmReverterPagamentos);
   end;
end;

end.
