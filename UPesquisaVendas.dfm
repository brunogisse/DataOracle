object frmPesquisaVendas: TfrmPesquisaVendas
  Left = 0
  Top = 0
  Caption = 'Pesquisa Vendas'
  ClientHeight = 643
  ClientWidth = 1021
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PainelCentral: TPanel
    Left = 0
    Top = 0
    Width = 1021
    Height = 234
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 9408399
    Font.Height = -11
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object labelTituloEditsNF: TLabel
      Left = 412
      Top = 26
      Width = 158
      Height = 28
      Caption = 'Pesquisar Vendas'
      Font.Charset = ANSI_CHARSET
      Font.Color = clSilver
      Font.Height = -20
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object gbPesquisaPosto: TGroupBox
      Left = 188
      Top = 122
      Width = 485
      Height = 89
      Color = clWhite
      Font.Charset = ANSI_CHARSET
      Font.Color = 9408399
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      object rbPosto: TRadioButton
        Left = 16
        Top = 17
        Width = 58
        Height = 16
        Caption = 'Cliente'
        Checked = True
        Font.Charset = ANSI_CHARSET
        Font.Color = 10395294
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object rbNF: TRadioButton
        Left = 128
        Top = 16
        Width = 35
        Height = 17
        Caption = 'NF'
        Font.Charset = ANSI_CHARSET
        Font.Color = 10395294
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object Edit1: TEdit
        Left = 16
        Top = 38
        Width = 417
        Height = 25
        TabOrder = 2
        Text = 'Edit1'
      end
      object rbUsina: TRadioButton
        Left = 207
        Top = 16
        Width = 73
        Height = 17
        Caption = 'Usina'
        TabOrder = 3
      end
    end
    object gbPeriodo: TGroupBox
      Left = 679
      Top = 122
      Width = 330
      Height = 89
      TabOrder = 1
      object labelDe: TLabel
        Left = 14
        Top = 17
        Width = 17
        Height = 13
        Caption = 'De:'
      end
      object labelATE: TLabel
        Left = 121
        Top = 18
        Width = 21
        Height = 13
        Caption = 'At'#233':'
      end
      object DateVencimentoDE: TMaskEdit
        Left = 11
        Top = 38
        Width = 96
        Height = 25
        EditMask = '!99/99/9999;1;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9408399
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 0
        Text = '  /  /    '
      end
      object DateVencimentoATE: TMaskEdit
        Left = 118
        Top = 38
        Width = 98
        Height = 25
        EditMask = '!99/99/9999;1;_'
        Font.Charset = ANSI_CHARSET
        Font.Color = 9408399
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        MaxLength = 10
        ParentFont = False
        TabOrder = 1
        Text = '  /  /    '
      end
      object painelFundobtn: TPanel
        Left = 232
        Top = 29
        Width = 90
        Height = 41
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 2
        object PainelConsultar: TPanel
          Left = 8
          Top = 8
          Width = 75
          Height = 25
          BevelOuter = bvNone
          Caption = 'Consultar'
          Color = 11360274
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object btnConsultar: TSpeedButton
            Left = 0
            Top = 0
            Width = 75
            Height = 25
            Align = alClient
            Flat = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitTop = -3
            ExplicitWidth = 73
            ExplicitHeight = 27
          end
        end
      end
    end
  end
  object gridPesquisarVendas: TDBGrid
    Left = 0
    Top = 234
    Width = 1021
    Height = 409
    Align = alClient
    BorderStyle = bsNone
    DataSource = dsPesquisaVenda
    DrawingStyle = gdsClassic
    FixedColor = 7428151
    Font.Charset = ANSI_CHARSET
    Font.Color = 7428151
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgTitles, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -12
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'VENDAID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REPRESENTANTEID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSTOID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUTOID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTORISTAID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CORRETORID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USINAID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_NF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_EMISSAO_NF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOLUME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAXA_FRETE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL_FRETE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TAXA_CORRETAGEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_TOTAL_CORRETAGEM'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR_COMBUSTIVEL'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'STATUS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ATUALIZAR_PARCELA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PARCELAS_GERADAS'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CORRETOR'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'MOTORISTA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'POSTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRODUTO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REPRESENTANTE'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'USINA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_NF_RECEBIDO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VOLUME_TOTAL_RETIRADO'
        Visible = True
      end>
  end
  object qryPesquisaVenda: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcPesquisaVenda
    UpdateOptions.UpdateTableName = 'PARCELA_VENDA_PARA_POSTOS'
    SQL.Strings = (
      'select'
      ''
      
        '  v.vendaid, v.representanteid, v.postoid, v.produtoid, v.motori' +
        'staid, v.corretorid, v.usinaid,'
      ''
      
        '  v.nf, v.valor_nf, v.data_emissao_nf, v.vencimento_nf_atual, v.' +
        'volume, v.taxa_frete, v.valor_total_frete,'
      
        '  v.taxa_corretagem, v.valor_total_corretagem, v.valor_combustiv' +
        'el, V.STATUS, V.ATUALIZAR_PARCELA, v.parcelas_geradas, V.TOTAL_N' +
        'F_RECEBIDO, V.VOLUME_TOTAL_RETIRADO, V.VALOR_RECEBIDO_MES, V.VOL' +
        'UME_RECEBIDO_MES'
      ''
      'from'
      ''
      
        ' venda_para_postos v, corretor c, motorista m, posto p, produto ' +
        'pr, representante re, usina u'
      ''
      ''
      'where'
      ''
      ' (v.representanteid = re.representanteid) and'
      ' (v.postoid = p.postoid) and'
      ' (v.produtoid = pr.produtoid) and'
      ' (v.motoristaid = m.motoristaid) and'
      ' (v.corretorid = c.corretorid) and'
      ' (v.usinaid = u.usinaid) '
      ''
      'order by v.vencimento_nf_atual asc')
    Left = 40
    Top = 296
    object qryPesquisaVendaVENDAID: TIntegerField
      FieldName = 'VENDAID'
      Origin = 'VENDAID'
      Required = True
    end
    object qryPesquisaVendaREPRESENTANTEID: TIntegerField
      FieldName = 'REPRESENTANTEID'
      Origin = 'REPRESENTANTEID'
    end
    object qryPesquisaVendaPOSTOID: TIntegerField
      FieldName = 'POSTOID'
      Origin = 'POSTOID'
    end
    object qryPesquisaVendaPRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
      Origin = 'PRODUTOID'
    end
    object qryPesquisaVendaMOTORISTAID: TIntegerField
      FieldName = 'MOTORISTAID'
      Origin = 'MOTORISTAID'
    end
    object qryPesquisaVendaCORRETORID: TIntegerField
      FieldName = 'CORRETORID'
      Origin = 'CORRETORID'
    end
    object qryPesquisaVendaUSINAID: TIntegerField
      FieldName = 'USINAID'
      Origin = 'USINAID'
    end
    object qryPesquisaVendaNF: TIntegerField
      FieldName = 'NF'
      Origin = 'NF'
    end
    object qryPesquisaVendaVALOR_NF: TFMTBCDField
      FieldName = 'VALOR_NF'
      Origin = 'VALOR_NF'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryPesquisaVendaDATA_EMISSAO_NF: TDateField
      FieldName = 'DATA_EMISSAO_NF'
      Origin = 'DATA_EMISSAO_NF'
    end
    object qryPesquisaVendaVENCIMENTO_NF_ATUAL: TDateField
      FieldName = 'VENCIMENTO_NF_ATUAL'
      Origin = 'VENCIMENTO_NF_ATUAL'
    end
    object qryPesquisaVendaVOLUME: TFMTBCDField
      FieldName = 'VOLUME'
      Origin = 'VOLUME'
      Precision = 18
      Size = 2
    end
    object qryPesquisaVendaTAXA_FRETE: TBCDField
      FieldName = 'TAXA_FRETE'
      Origin = 'TAXA_FRETE'
      Precision = 18
    end
    object qryPesquisaVendaVALOR_TOTAL_FRETE: TFMTBCDField
      FieldName = 'VALOR_TOTAL_FRETE'
      Origin = 'VALOR_TOTAL_FRETE'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryPesquisaVendaTAXA_CORRETAGEM: TBCDField
      FieldName = 'TAXA_CORRETAGEM'
      Origin = 'TAXA_CORRETAGEM'
      Precision = 18
    end
    object qryPesquisaVendaVALOR_TOTAL_CORRETAGEM: TFMTBCDField
      FieldName = 'VALOR_TOTAL_CORRETAGEM'
      Origin = 'VALOR_TOTAL_CORRETAGEM'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryPesquisaVendaSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 10
    end
    object qryPesquisaVendaATUALIZAR_PARCELA: TIntegerField
      FieldName = 'ATUALIZAR_PARCELA'
      Origin = 'ATUALIZAR_PARCELA'
    end
    object qryPesquisaVendaPARCELAS_GERADAS: TStringField
      FieldName = 'PARCELAS_GERADAS'
      Origin = 'PARCELAS_GERADAS'
      FixedChar = True
      Size = 1
    end
    object qryPesquisaVendaTOTAL_NF_RECEBIDO: TFMTBCDField
      FieldName = 'TOTAL_NF_RECEBIDO'
      Origin = 'TOTAL_NF_RECEBIDO'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryPesquisaVendaVOLUME_TOTAL_RETIRADO: TFMTBCDField
      FieldName = 'VOLUME_TOTAL_RETIRADO'
      Origin = 'VOLUME_TOTAL_RETIRADO'
      Precision = 18
      Size = 2
    end
    object qryPesquisaVendaVALOR_RECEBIDO_MES: TFMTBCDField
      FieldName = 'VALOR_RECEBIDO_MES'
      Origin = 'VALOR_RECEBIDO_MES'
      currency = True
      Precision = 18
      Size = 2
    end
    object qryPesquisaVendaVOLUME_RECEBIDO_MES: TFMTBCDField
      FieldName = 'VOLUME_RECEBIDO_MES'
      Origin = 'VOLUME_RECEBIDO_MES'
      Precision = 18
      Size = 2
    end
    object qryPesquisaVendaVALOR_COMBUSTIVEL: TFMTBCDField
      FieldName = 'VALOR_COMBUSTIVEL'
      Origin = 'VALOR_COMBUSTIVEL'
      Precision = 18
      Size = 10
    end
  end
  object tcPesquisaVenda: TFDTransaction
    Options.AutoStop = False
    Connection = frmMenu.FDconexao
    Left = 40
    Top = 352
  end
  object dsPesquisaVenda: TDataSource
    DataSet = qryPesquisaVenda
    Left = 144
    Top = 296
  end
  object reportPesquisaVenda: TfrxReport
    Version = '6.7.6'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44816.601607164400000000
    ReportOptions.LastChange = 44816.620435706020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 456
    Datasets = <
      item
        DataSet = dbReportPesquisaVenda
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object Header1: TfrxHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 207.874150000000000000
          Top = -7.559060000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Teste Impress'#227'o')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 64.252010000000000000
        Width = 718.110700000000000000
        DataSet = dbReportPesquisaVenda
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1VALOR_TOTAL_NF: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 7.559060000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR_TOTAL_NF'
          DataSet = dbReportPesquisaVenda
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."VALOR_TOTAL_NF"]')
        end
        object frxDBDataset1PARCELA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 7.559060000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'PARCELA'
          DataSet = dbReportPesquisaVenda
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."PARCELA"]')
        end
        object frxDBDataset1VALOR_PARCELA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 381.732530000000000000
          Top = 7.559060000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataField = 'VALOR_PARCELA'
          DataSet = dbReportPesquisaVenda
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."VALOR_PARCELA"]')
        end
      end
    end
  end
  object dbReportPesquisaVenda: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = qryPesquisaVenda
    BCDToCurrency = False
    Left = 40
    Top = 512
  end
  object qryCorretor: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcPesquisaVenda
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_CORRETOR_ID'
    UpdateOptions.KeyFields = 'CORRETORID'
    SQL.Strings = (
      'select * from corretor')
    Left = 432
    Top = 549
    object qryCorretorCORRETORID: TIntegerField
      FieldName = 'CORRETORID'
      Origin = 'CORRETORID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCorretorNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object qryCorretorCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 13
    end
    object qryCorretorCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 60
    end
  end
  object qryMotorista: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcPesquisaVenda
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_MOTORISTA_ID'
    UpdateOptions.KeyFields = 'MOTORISTAID'
    SQL.Strings = (
      'select * from motorista')
    Left = 503
    Top = 549
    object qryMotoristaMOTORISTAID: TIntegerField
      FieldName = 'MOTORISTAID'
      Origin = 'MOTORISTAID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryMotoristaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object qryMotoristaCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 60
    end
    object qryMotoristaCPF: TStringField
      FieldName = 'CPF'
      Origin = 'CPF'
      Size = 13
    end
  end
  object qryPosto: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcPesquisaVenda
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_POSTO_ID'
    UpdateOptions.KeyFields = 'POSTOID'
    SQL.Strings = (
      'select * from posto')
    Left = 567
    Top = 549
    object qryPostoPOSTOID: TIntegerField
      FieldName = 'POSTOID'
      Origin = 'POSTOID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryPostoNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 60
    end
    object qryPostoRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 60
    end
    object qryPostoCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 18
    end
  end
  object qryProduto: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcPesquisaVenda
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_PRODUTO_ID'
    UpdateOptions.KeyFields = 'PRODUTOID'
    SQL.Strings = (
      'select * from produto')
    Left = 624
    Top = 549
    object qryProdutoPRODUTOID: TIntegerField
      FieldName = 'PRODUTOID'
      Origin = 'PRODUTOID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryProdutoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
  end
  object qryRepresentante: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcPesquisaVenda
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_REPRESENTANTE_ID'
    UpdateOptions.KeyFields = 'REPRESENTANTEID'
    SQL.Strings = (
      'select * from representante')
    Left = 699
    Top = 549
    object qryRepresentanteREPRESENTANTEID: TIntegerField
      FieldName = 'REPRESENTANTEID'
      Origin = 'REPRESENTANTEID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryRepresentanteNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 60
    end
    object qryRepresentanteCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 60
    end
    object qryRepresentanteCNPJ: TStringField
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 18
    end
  end
  object qryUsina: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcPesquisaVenda
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_COMPRA_USINA_ID'
    UpdateOptions.KeyFields = 'USINAID'
    SQL.Strings = (
      'select * from usina')
    Left = 769
    Top = 549
    object qryUsinaUSINAID: TIntegerField
      FieldName = 'USINAID'
      Origin = 'USINAID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryUsinaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Origin = 'RAZAO_SOCIAL'
      Size = 60
    end
    object qryUsinaNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 60
    end
    object qryUsinaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 60
    end
    object qryUsinaBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 40
    end
    object qryUsinaCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 40
    end
    object qryUsinaUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qryUsinaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 15
    end
  end
  object dsCorretor: TDataSource
    DataSet = qryCorretor
    Left = 432
    Top = 493
  end
  object dsMotorista: TDataSource
    DataSet = qryMotorista
    Left = 504
    Top = 493
  end
  object dsPosto: TDataSource
    DataSet = qryPosto
    Left = 568
    Top = 493
  end
  object dsProduto: TDataSource
    DataSet = qryProduto
    Left = 624
    Top = 493
  end
  object dsRepresentante: TDataSource
    DataSet = qryRepresentante
    Left = 696
    Top = 493
  end
  object dsUsina: TDataSource
    DataSet = qryUsina
    Left = 760
    Top = 492
  end
  object qryPagarParcelas: TFDQuery
    IndexFieldNames = 'VENDAID'
    MasterSource = dsPesquisaVenda
    MasterFields = 'VENDAID'
    Connection = frmMenu.FDconexao
    Transaction = tcPesquisaVenda
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_PARCELA_VENDA_PARA_POSTOS_I'
    UpdateOptions.UpdateTableName = 'PARCELA_VENDA_PARA_POSTOS'
    UpdateOptions.KeyFields = 'PARCELAID'
    UpdateOptions.AutoIncFields = 'PARCELAID'
    SQL.Strings = (
      'select * from PARCELA_VENDA_PARA_POSTOS')
    Left = 720
    Top = 301
    object qryPagarParcelasPARCELAID: TFDAutoIncField
      FieldName = 'PARCELAID'
      Origin = 'PARCELAID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object qryPagarParcelasVENDAID: TIntegerField
      FieldName = 'VENDAID'
      Origin = 'VENDAID'
    end
    object qryPagarParcelasFORMA_PGTO_ID: TIntegerField
      FieldName = 'FORMA_PGTO_ID'
      Origin = 'FORMA_PGTO_ID'
    end
    object qryPagarParcelasSTATUS: TStringField
      FieldName = 'STATUS'
      Origin = 'STATUS'
      Size = 10
    end
    object qryPagarParcelasQTDE_PARCELAS: TIntegerField
      FieldName = 'QTDE_PARCELAS'
      Origin = 'QTDE_PARCELAS'
    end
    object qryPagarParcelasVALOR_TOTAL_NF: TFMTBCDField
      FieldName = 'VALOR_TOTAL_NF'
      Origin = 'VALOR_TOTAL_NF'
      Precision = 18
      Size = 2
    end
    object qryPagarParcelasVALOR_PARCELA: TFMTBCDField
      FieldName = 'VALOR_PARCELA'
      Origin = 'VALOR_PARCELA'
      Precision = 18
      Size = 2
    end
    object qryPagarParcelasDATA_PARCELA: TDateField
      FieldName = 'DATA_PARCELA'
      Origin = 'DATA_PARCELA'
    end
    object qryPagarParcelasVOLUME_VENDA_TOTAL: TFMTBCDField
      FieldName = 'VOLUME_VENDA_TOTAL'
      Origin = 'VOLUME_VENDA_TOTAL'
      Precision = 18
      Size = 2
    end
    object qryPagarParcelasVOLUME_PARCELADO: TFMTBCDField
      FieldName = 'VOLUME_PARCELADO'
      Origin = 'VOLUME_PARCELADO'
      Precision = 18
      Size = 2
    end
    object qryPagarParcelasDOCUMENTO: TStringField
      FieldName = 'DOCUMENTO'
      Origin = 'DOCUMENTO'
    end
    object qryPagarParcelasVOLUME_RESTANTE: TFMTBCDField
      FieldName = 'VOLUME_RESTANTE'
      Origin = 'VOLUME_RESTANTE'
      Precision = 18
      Size = 2
    end
    object qryPagarParcelasNF: TIntegerField
      FieldName = 'NF'
      Origin = 'NF'
    end
    object qryPagarParcelasEMISSAO_NF: TDateField
      FieldName = 'EMISSAO_NF'
      Origin = 'EMISSAO_NF'
    end
    object qryPagarParcelasACESSO: TStringField
      FieldName = 'ACESSO'
      Origin = 'ACESSO'
      Size = 9
    end
    object qryPagarParcelasPARCELA: TStringField
      FieldName = 'PARCELA'
      Origin = 'PARCELA'
      Size = 5
    end
    object qryPagarParcelasDATA_PGTO_PARCELA: TDateField
      FieldName = 'DATA_PGTO_PARCELA'
      Origin = 'DATA_PGTO_PARCELA'
    end
  end
  object dsPagarParcelas: TDataSource
    DataSet = qryPagarParcelas
    Left = 832
    Top = 304
  end
end
