unit UEditarParcelas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Buttons, Vcl.Mask,
  Vcl.Imaging.pngimage, System.UITypes, System.ImageList, Vcl.ImgList;

type
  TdbGridPadrao = class(TDBGrid);

  TfrmEditarParcelas = class(TForm)
    painelTopo: TPanel;
    PainelCentro: TPanel;
    gbCampos: TGroupBox;
    labelDocumentoEditado: TLabel;
    labelValorParcela: TLabel;
    labelVolume: TLabel;
    editEditarDocumento: TEdit;
    editValorParcela: TEdit;
    editVolumeParcelado: TEdit;
    tcParcelas: TFDTransaction;
    qryParcelas: TFDQuery;
    dsParcelas: TDataSource;
    qryFormaPgto: TFDQuery;
    qryFormaPgtoFORMAID: TIntegerField;
    qryFormaPgtoDESCRICAO: TStringField;
    dsFormaPgto: TDataSource;
    qryVendaPosto: TFDQuery;
    dsVendaPosto: TDataSource;
    PainelConfirmar: TPanel;
    painelBtnConfirmar: TPanel;
    btnConfirmar: TSpeedButton;
    labelDataPagamento: TLabel;
    Image1: TImage;
    Label1: TLabel;
    labelNF: TLabel;
    editNF: TEdit;
    qryParcelasPARCELAID: TFDAutoIncField;
    qryParcelasVENDAID: TIntegerField;
    qryParcelasFORMA_PGTO_ID: TIntegerField;
    qryParcelasSTATUS: TStringField;
    qryParcelasQTDE_PARCELAS: TIntegerField;
    qryParcelasVALOR_TOTAL_NF: TFMTBCDField;
    qryParcelasVALOR_PARCELA: TFMTBCDField;
    qryParcelasDATA_PARCELA: TDateField;
    qryParcelasVOLUME_VENDA_TOTAL: TFMTBCDField;
    qryParcelasVOLUME_PARCELADO: TFMTBCDField;
    qryParcelasDOCUMENTO: TStringField;
    qryParcelasVOLUME_RESTANTE: TFMTBCDField;
    qryParcelasNF: TIntegerField;
    qryParcelasEMISSAO_NF: TDateField;
    qryParcelasACESSO: TStringField;
    qryParcelasPARCELA: TStringField;
    qryParcelasDATA_PGTO_PARCELA: TDateField;
    qryParcelasFORMAID: TIntegerField;
    qryParcelasDESCRICAO: TStringField;
    qryParcelasVENDAFK: TIntegerField;
    qryParcelasNFVENDA: TIntegerField;
    painelClasseCancelar: TPanel;
    painelCancelar: TPanel;
    btnCancelar: TSpeedButton;
    maskEditDataPagamento: TMaskEdit;
    gbExcluirParcelas: TGroupBox;
    painelCentralExcluir: TPanel;
    PainelExcluir: TPanel;
    btnExcluir: TSpeedButton;
    qryVendaPostoVENDAID: TIntegerField;
    qryVendaPostoREPRESENTANTEID: TIntegerField;
    qryVendaPostoPOSTOID: TIntegerField;
    qryVendaPostoPRODUTOID: TIntegerField;
    qryVendaPostoMOTORISTAID: TIntegerField;
    qryVendaPostoCORRETORID: TIntegerField;
    qryVendaPostoUSINAID: TIntegerField;
    qryVendaPostoNF: TIntegerField;
    qryVendaPostoVALOR_NF: TFMTBCDField;
    qryVendaPostoDATA_EMISSAO_NF: TDateField;
    qryVendaPostoVOLUME: TFMTBCDField;
    qryVendaPostoTAXA_FRETE: TBCDField;
    qryVendaPostoVALOR_TOTAL_FRETE: TFMTBCDField;
    qryVendaPostoTAXA_CORRETAGEM: TBCDField;
    qryVendaPostoVALOR_TOTAL_CORRETAGEM: TFMTBCDField;
    qryVendaPostoVENCIMENTO_NF_ATUAL: TDateField;
    qryVendaPostoSTATUS: TStringField;
    qryVendaPostoATUALIZAR_PARCELA: TIntegerField;
    qryVendaPostoPARCELAS_GERADAS: TStringField;
    qryVendaPostoTOTAL_NF_RECEBIDO: TFMTBCDField;
    qryVendaPostoVOLUME_TOTAL_RETIRADO: TFMTBCDField;
    qryVendaPostoVALOR_RECEBIDO_MES: TFMTBCDField;
    qryVendaPostoVOLUME_RECEBIDO_MES: TFMTBCDField;
    qryVendaPostoESTOQUEID: TIntegerField;
    qryVendaPostoVALOR_COMBUSTIVEL: TFMTBCDField;
    painelFundoConfirma: TPanel;
    painelModificarParcelas: TPanel;
    btnModificarParcelas: TSpeedButton;
    gridEditarParcela: TDBGrid;
    labelRepresentante: TLabel;
    editRepresentante: TEdit;
    qryRepresentante: TFDQuery;
    qryRepresentanteREPRESENTANTEID: TIntegerField;
    qryRepresentanteNOME: TStringField;
    qryRepresentanteCIDADE: TStringField;
    qryRepresentanteCNPJ: TStringField;
    dsRepresentante: TDataSource;
    imgTipoPagamento: TImageList;
    procedure editNFKeyPress(Sender: TObject; var Key: Char);
    procedure editNFKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure gridEditarParcelaDblClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnModificarParcelasClick(Sender: TObject);
    procedure editRepresentanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editValorParcelaChange(Sender: TObject);
    procedure gridEditarParcelaTitleClick(Column: TColumn);
    procedure gridEditarParcelaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);

  private
    function TratarValor(str: String): double;
    { Private declarations }


  public
    { Public declarations }
    procedure consultarNotaFiscal;
  end;

var
  frmEditarParcelas: TfrmEditarParcelas;

implementation

{$R *.dfm}

uses UPrincipalPetrotorque, UConverterFloat, UVendaPosto, UAlterarQtdeParcelas,
  URepresentante, uFormat, UFuncoes;


procedure TfrmEditarParcelas.btnCancelarClick(Sender: TObject);
begin
  qryParcelas.Cancel;
  gridEditarParcela.Enabled   := True;
  painelBtnConfirmar.Visible  := False;
  editEditarDocumento.Text    := '';
  editValorParcela.Text       := '';
  editVolumeParcelado.Text    := '';
  maskEditDataPagamento.Text  := DateToStr(Date);
end;

procedure TfrmEditarParcelas.btnConfirmarClick(Sender: TObject);
begin

   if MessageBox(Application.Handle,'Confirma a altera��o da parcela?','Confirma��o',MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
            qryParcelas.Edit;
            qryParcelas['DOCUMENTO']        := editEditarDocumento.Text;
            qryParcelas['DATA_PARCELA']     := StrToDate(maskEditDataPagamento.Text);
            qryParcelas['VALOR_PARCELA']    := TratarValor(editValorParcela.Text); //TextToCurr(editValorParcela.Text);
            qryParcelas['VOLUME_PARCELADO'] := StrToFloat(editVolumeParcelado.Text);
            qryParcelas.Post;
            painelBtnConfirmar.Visible := False;
            editEditarDocumento.Clear;
            editValorParcela.Clear;
            editVolumeParcelado.Clear;
            maskEditDataPagamento.Text := DateToStr(Date);
          try
            tcParcelas.CommitRetaining;
           except
            tcParcelas.RollbackRetaining;
          end;
            gridEditarParcela.Enabled := True;
        end;


end;



procedure TfrmEditarParcelas.btnExcluirClick(Sender: TObject);
  var QtdeParcelas, i : Integer;
      AuxErro : string;
    begin
        if qryParcelas.RecordCount > 0 then
          begin
             QtdeParcelas := qryParcelas['QTDE_PARCELAS'];
                if MessageBox(Application.Handle,'Aten��o!' + #13 + #13
                                               + 'Voc� est� prestes a excluir todas as parcelas abaixo.' +#13 + #13
                                               + 'Confirma a opera��o?','Confirma��o',MB_YESNO + MB_ICONQUESTION) = mrYes then
            if qryParcelas.RecordCount = QtdeParcelas then
                    begin
                      try
                        qryVendaPosto.Locate('vendaid' , qryParcelas['VENDAID'], []);
                        qryParcelas.First;
                          for I := 1 to QtdeParcelas do
                             begin
                               qryParcelas.Delete;
                               qryParcelas.Next;
                             end;

                               qryVendaPosto.Edit;
                               qryVendaPosto['PARCELAS_GERADAS']  := 'N';
                               qryVendaPosto['STATUS']            := 'EM ABERTO';
                               qryVendaPosto['ATUALIZAR_PARCELA'] := 1;
                            if frmVendaPostos <> Nil then
                               frmVendaPostos.ParcelasGeradas     := 'N�o';
                               qryVendaPosto.Post;
                               tcParcelas.CommitRetaining;

                               qryParcelas.Close;
                               qryParcelas.Open();

                      except
                        on E : exception do
                         begin
                           tcParcelas.RollbackRetaining;
                           AuxErro := Copy(E.Message, 0, 500);
                           MessageDlg('Erro ao Excluir parcelas. Motivo: ' + AuxErro,TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
                         end;
                      end;
                    end;
          end;
    end;

procedure TfrmEditarParcelas.btnModificarParcelasClick(Sender: TObject);
begin
    if qryParcelas.RecordCount > 0 then
        begin
          try
            Application.CreateForm( TfrmAlterarQtdeParcelas, frmAlterarQtdeParcelas );
            frmAlterarQtdeParcelas.ShowModal;
          finally
            FreeAndNil( frmAlterarQtdeParcelas );
          end;
        end;
end;

procedure TfrmEditarParcelas.consultarNotaFiscal;
begin
 if editNF.Text <> '' then
     begin
         with qryParcelas do
              begin
                Close;
                ParamByName('NF').AsInteger := StrToInt(editNF.Text);
                ParamByName('representante').AsInteger := qryRepresentante['REPRESENTANTEID'];
                Open();
                if RecordCount = qryParcelas['QTDE_PARCELAS'] then
                   PainelExcluir.Visible := True;
              end;
        if not qryParcelas.Locate('NF', editNF.Text, []) then
               MessageDlg('NF n�o encontrada',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0)
     end;
end;

procedure TfrmEditarParcelas.editNFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
      consultarNotaFiscal;
end;

procedure TfrmEditarParcelas.editNFKeyPress(Sender: TObject; var Key: Char);
begin
 if Key = #13 then
      Key := #0;
end;

procedure TfrmEditarParcelas.editRepresentanteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_RETURN then
     begin
          try
            Application.CreateForm(TfrmRepresentante, frmRepresentante);
            frmRepresentante.Caminho := 'editarparcelas';
            frmRepresentante.ShowModal;
            editNF.SetFocus;
          finally
              FreeAndNil(frmRepresentante);
          end;
     end;
end;

function TfrmEditarParcelas.TratarValor(str : String) : double;
begin
   str := StringReplace(str, '.', '', [rfReplaceAll]);
   str := StringReplace(str, ',', '', [rfReplaceAll]);

   try
      Result := StrToFloat(str) / 100;
   except
      Result := 0;
   end;

end;

procedure TfrmEditarParcelas.editValorParcelaChange(Sender: TObject);
begin
      Formatar(editValorParcela, TFormato.Valor);
end;

procedure TfrmEditarParcelas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

    qryParcelas.Close;
    qryVendaPosto.Close;
    qryFormaPgto.Close;
    qryRepresentante.Close;
end;

procedure TfrmEditarParcelas.FormShow(Sender: TObject);
begin
    qryParcelas.Open;
    qryVendaPosto.Open;
    qryFormaPgto.Open;
    qryRepresentante.Open();
    qryRepresentante.Locate('representanteid', 6, [] );
    editRepresentante.Text := qryRepresentante['NOME'];
    editNF.SetFocus;
end;

procedure TfrmEditarParcelas.gridEditarParcelaDblClick(Sender: TObject);
  var ValorParcela : Currency;
begin

 //   ValorParcela := (qryParcelas['VALOR_PARCELA']);

 if qryParcelas.RecordCount > 0 then

  begin
   if qryParcelas['DOCUMENTO'] <> null then
      editEditarDocumento.Text     := qryParcelas['DOCUMENTO'];
      maskEditDataPagamento.Text   := DateToStr(qryParcelas['DATA_PARCELA']);
      editValorParcela.Text        := FormatFloat('#,##0.00', qryParcelas['VALOR_PARCELA']);
      editVolumeParcelado.Text     := FloatToStr(qryParcelas['VOLUME_PARCELADO']);
      gridEditarParcela.Enabled    := False;
      painelBtnConfirmar.Visible   := True;
  end
   else
      MessageDlg('N�o h� parcelas para serem alteradas',TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
end;

procedure TfrmEditarParcelas.gridEditarParcelaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   Grid: TDBGrid;
   ImageIndex: Integer;
   ImageRect: TRect;
   RectTeste : TRect;

begin
   if Column.FieldName = 'DESCRICAO' then
   begin
      Grid := Sender as TDBGrid;
      ImageRect := Rect;
      ImageRect.Left := ImageRect.Left +
        (ImageRect.Width - imgTipoPagamento.Width) div 2;
      ImageRect.Top := ImageRect.Top +
        (ImageRect.Height - imgTipoPagamento.Height) div 2;

      Grid.Canvas.FillRect(Rect);

      if Grid.DataSource.DataSet.FieldByName('DESCRICAO').AsString = 'BOLETO'
      then
         ImageIndex := 0
      else if Grid.DataSource.DataSet.FieldByName('DESCRICAO').AsString = 'PIX'
      then
         ImageIndex := 1
      else
         Exit; // Caso n�o haja imagem correspondente

      if ImageIndex >= 0 then
         imgTipoPagamento.Draw(Grid.Canvas, ImageRect.Left, ImageRect.Top,
           ImageIndex);
   end;

end;

procedure TfrmEditarParcelas.gridEditarParcelaTitleClick(Column: TColumn);
begin
   procGridIndex(Column);
end;

end.
