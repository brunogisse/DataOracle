unit UMotorista;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  Vcl.Imaging.pngimage;

type
  TfrmMotorista = class(TForm)
    PainelCentral: TPanel;
    qryMotorista: TFDQuery;
    tcMotorista: TFDTransaction;
    qryMotoristaMOTORISTAID: TIntegerField;
    qryMotoristaNOME: TStringField;
    qryMotoristaCIDADE: TStringField;
    qryMotoristaCPF: TStringField;
    gbPesquisaPosto: TGroupBox;
    rbNome: TRadioButton;
    rbCPF: TRadioButton;
    editPesquisaMotorista: TEdit;
    PainelTopo: TPanel;
    painelEsquerdo: TPanel;
    gridMotorista: TDBGrid;
    gbEdits: TGroupBox;
    labelDestino: TLabel;
    editNome: TDBEdit;
    Label1: TLabel;
    editCPF: TDBEdit;
    editCidade: TDBEdit;
    Label2: TLabel;
    dsMotorista: TDataSource;
    labelTituloEditsNF: TLabel;
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
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure editNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editNomeKeyPress(Sender: TObject; var Key: Char);
    procedure editCidadeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure editCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure editCPFKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure gridMotoristaDblClick(Sender: TObject);
    procedure gridMotoristaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure rbCPFClick(Sender: TObject);
    procedure rbNomeClick(Sender: TObject);
    procedure editPesquisaMotoristaChange(Sender: TObject);
    procedure editPesquisaMotoristaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure editPesquisaMotoristaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

    Procedure configurarEnables(status : integer);


  public
    { Public declarations }
    Procedure CapturarMotorista;
    var  Action : string;
  end;

var
  frmMotorista: TfrmMotorista;

implementation

{$R *.dfm}

uses UPrincipalPetrotorque, UVendaPosto, URelatorioMotorista,
  UTransferenciaEstoque;


procedure TfrmMotorista.btnCancelarClick(Sender: TObject);
begin
 configurarEnables(0);
 qryMotorista.Cancel;
 gridMotorista.Enabled := True;
end;

procedure TfrmMotorista.btnEditarClick(Sender: TObject);
begin
 configurarEnables(1);
 gridMotorista.Enabled := False;
 qryMotorista.Edit;
end;



procedure TfrmMotorista.btnExcluirClick(Sender: TObject);
 var AuxErro : string;
   begin
    configurarEnables(0);
      if MessageBox(Application.Handle,'Deseja excluir esse registro?','Confirma��o',MB_YESNO + MB_ICONQUESTION) = mrYes then
        begin
           try
              qryMotorista.Delete;
             except
            on E : Exception do
             begin
               MessageDlg('N�o foi poss�vel excluir esse registro. ' + #13
                         + #13 + 'Esse motorista est� sendo referenciado em alguma venda.  ' + #13 + #13
                         + 'Erro T�cnico: '+  AuxErro,TMsgDlgType.mtWarning,[TMsgDlgBtn.mbOK],0);
             end;
           end;
        end;
   end;


procedure TfrmMotorista.btnNovoClick(Sender: TObject);
begin
  configurarEnables(1);
  gridMotorista.Enabled := False;
  editNome.SetFocus;
  qryMotorista.Insert;
end;


procedure TfrmMotorista.btnSalvarClick(Sender: TObject);
begin
      qryMotorista.Post;
      configurarEnables(0);
      gridMotorista.Enabled := True;

    try
      tcMotorista.CommitRetaining;
    finally
       tcMotorista.RollbackRetaining;
    end;
end;



procedure TfrmMotorista.CapturarMotorista;
begin
 if qryMotorista.RecordCount > 0 then
      begin
       if Action = 'venda' then
         begin
          frmVendaPostos.qryMotorista.Refresh;
          frmVendaPostos.editMotorista.Text := qryMotorista['NOME'];
          frmVendaPostos.qryMotorista.Locate('motoristaid', qryMotorista['MOTORISTAID'] , []);
          frmVendaPostos.editTaxaFrete.SetFocus;
          Close;
         end;
       if Action = 'relatoriomotorista' then
          begin
          frmRelatorioMotorista.qryMotorista.Refresh;
          frmRelatorioMotorista.editPesquisaMotorista.Text := qryMotorista['NOME'];
          frmRelatorioMotorista.qryMotorista.Locate('motoristaid', qryMotorista['MOTORISTAID'] , []);
          Close;
         end;
       if Action = 'transferencia' then
        begin
        frmTransferencia.qryMotorista.Refresh;
        frmTransferencia.editMotorista.Text := qryMotorista['NOME'];
        frmTransferencia.qryMotorista.Locate('motoristaid', qryMotorista['MOTORISTAID'] , []);
        Close;
       end;
      end;

end;

procedure TfrmMotorista.configurarEnables(status: integer);
  begin
      if status = 0 then
    begin
      btnNovo.Enabled := True;
      btnNovo.Enabled := True;
      btnExcluir.Enabled := True;
      btnCancelar.Enabled := False;
      btnSalvar.Enabled := False;
      editNome.Enabled := False;
      editCidade.Enabled := False;
      editCPF.Enabled := False;

    end
   else
    begin
      btnNovo.Enabled := False;
      btnNovo.Enabled := False;
      btnExcluir.Enabled := False;
      btnCancelar.Enabled := True;
      btnSalvar.Enabled := True;
      editNome.Enabled := True;
      editCidade.Enabled := True;
      editCPF.Enabled := True;
    end;
  end;




procedure TfrmMotorista.editCidadeKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
     begin
       editCidade.SetFocus;
       Key := #0;
     end;
end;

procedure TfrmMotorista.editCPFKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_F12 then
       btnSalvar.Click;
end;

procedure TfrmMotorista.editCidadeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_F12 then
       btnSalvar.Click;
end;



procedure TfrmMotorista.editNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key = VK_F12 then
       btnSalvar.Click;
end;



procedure TfrmMotorista.editNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
     begin
       editCPF.SetFocus;
       Key := #0;
     end;
end;



procedure TfrmMotorista.editPesquisaMotoristaChange(Sender: TObject);
begin
    if rbCPF.Checked = True then

   with qryMotorista do
      begin
       Close;
       SQL.Clear;
       SQL.Add('select * from motorista where cpf like ' + QuotedStr('%' + editPesquisaMotorista.Text + '%') + 'order by cpf asc');
       Open;
     end;

  if rbNome.Checked = True then

   with qryMotorista do
      begin
       Close;
       SQL.Clear;
       SQL.Add('select * from motorista where nome like ' + QuotedStr('%' + editPesquisaMotorista.Text + '%') + 'order by nome asc');
       Open;
     end;
end;

procedure TfrmMotorista.editPesquisaMotoristaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_DOWN then
        qryMotorista.Next;
   if Key = VK_UP then
        qryMotorista.Prior;
end;

procedure TfrmMotorista.editPesquisaMotoristaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
     begin
       CapturarMotorista;
       Key := #0;
     end;
end;

procedure TfrmMotorista.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryMotorista.Close;
end;


procedure TfrmMotorista.FormShow(Sender: TObject);
begin
  qryMotorista.Open;
  configurarEnables(0);
  editPesquisaMotorista.SetFocus;

end;


procedure TfrmMotorista.gridMotoristaDblClick(Sender: TObject);
begin
      CapturarMotorista;
end;

procedure TfrmMotorista.gridMotoristaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

    //zebrando o dbgrid
    if Odd(gridMotorista.DataSource.DataSet.RecNo) then
        gridMotorista.Canvas.Brush.Color := $00CFCFCF
       else
          gridMotorista.Canvas.Brush.Color := clWhite;


    //mudando a cor da sele��o
    if ( gdSelected in State ) then
         begin
            gridMotorista.Canvas.Brush.Color := $00BC7B50;
             gridMotorista.Canvas.Font.Color := clWhite;
              gridMotorista.Canvas.Font.Style := [fsBold];
         end;



        gridMotorista.Canvas.FillRect( Rect );
        gridMotorista.DefaultDrawColumnCell( Rect, DataCol, Column, State );


     //mudando a posi��o e alinhamento vertical do texto de cada linha
   //  gridPosto.Canvas.TextRect(Rect, Rect.Left + 8, Rect.Top + 8, Column.Field.DisplayText);
end;

procedure TfrmMotorista.rbCPFClick(Sender: TObject);
begin
    editPesquisaMotorista.Clear;
    editPesquisaMotorista.SetFocus;
end;

procedure TfrmMotorista.rbNomeClick(Sender: TObject);
begin
  editPesquisaMotorista.Clear;
  editPesquisaMotorista.SetFocus;
end;


initialization
RegisterClass(TfrmMotorista);

finalization
UnRegisterClass(TfrmMotorista);

end.
