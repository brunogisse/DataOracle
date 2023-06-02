object frmCadastroUsuario: TfrmCadastroUsuario
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  ClientHeight = 503
  ClientWidth = 490
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clSilver
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object painelFundo: TPanel
    Left = 0
    Top = 0
    Width = 490
    Height = 503
    Align = alClient
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 623
    ExplicitHeight = 571
    object labelTitulo: TLabel
      Left = 19
      Top = 14
      Width = 193
      Height = 21
      Caption = 'CADASTRO DE USU'#193'RIOS'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8553090
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object painelUnderline: TPanel
      Left = 19
      Top = 48
      Width = 585
      Height = 1
      BevelOuter = bvNone
      Color = 8553090
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8553090
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
    end
    object painelFundoConfirma: TPanel
      Left = 19
      Top = 312
      Width = 454
      Height = 50
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object painelBtnConfirma: TPanel
        Left = 8
        Top = 8
        Width = 105
        Height = 35
        BevelOuter = bvNone
        Caption = 'Confirmar'
        Color = 16024898
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object btnConfirma: TSpeedButton
          Left = 0
          Top = 0
          Width = 105
          Height = 35
          Cursor = crHandPoint
          Align = alClient
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnConfirmaClick
          ExplicitLeft = -2
        end
      end
      object PainelCancelar: TPanel
        Left = 117
        Top = 8
        Width = 105
        Height = 35
        BevelOuter = bvNone
        Caption = 'Cancelar'
        Color = 14869218
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 1
        object btnCancelar: TSpeedButton
          Left = 0
          Top = 0
          Width = 105
          Height = 35
          Align = alClient
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnCancelarClick
          ExplicitLeft = 64
          ExplicitTop = 8
          ExplicitWidth = 153
          ExplicitHeight = 41
        end
      end
      object painelEditar: TPanel
        Left = 226
        Top = 8
        Width = 105
        Height = 35
        BevelOuter = bvNone
        Caption = 'Editar'
        Color = 14869218
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 2
        object btnEditar: TSpeedButton
          Left = 0
          Top = 0
          Width = 105
          Height = 35
          Align = alClient
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnEditarClick
          ExplicitLeft = 64
          ExplicitTop = 8
          ExplicitWidth = 153
          ExplicitHeight = 41
        end
      end
      object PainelExcluir: TPanel
        Left = 335
        Top = 8
        Width = 105
        Height = 35
        BevelOuter = bvNone
        Caption = 'Excluir'
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 3
        object btnExcluir: TSpeedButton
          Left = 0
          Top = 0
          Width = 105
          Height = 35
          Align = alClient
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnExcluirClick
          ExplicitLeft = 2
          ExplicitWidth = 120
        end
      end
    end
    object painelNovo: TPanel
      Left = 19
      Top = 53
      Width = 138
      Height = 42
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      object painelBtnNovo: TPanel
        Left = 8
        Top = 8
        Width = 97
        Height = 25
        BevelOuter = bvNone
        Caption = 'Novo usu'#225'rio'
        Color = 11360274
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object btnNovo: TSpeedButton
          Left = 0
          Top = 0
          Width = 97
          Height = 25
          Align = alClient
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          OnClick = btnNovoClick
          ExplicitLeft = 64
          ExplicitTop = 8
          ExplicitWidth = 153
          ExplicitHeight = 41
        end
      end
    end
    object DBGrid1: TDBGrid
      Left = 0
      Top = 375
      Width = 490
      Height = 128
      Align = alBottom
      DataSource = dsusuario
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGray
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clGray
      TitleFont.Height = -11
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NIVEL'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'USUARIO'
          Width = 165
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 224
          Visible = True
        end>
    end
    object painelEdits: TPanel
      Left = 27
      Top = 94
      Width = 432
      Height = 205
      BevelKind = bkFlat
      BevelOuter = bvNone
      TabOrder = 4
      object labelNomeUsuario: TLabel
        Left = 10
        Top = 6
        Width = 109
        Height = 17
        Caption = 'Nome de Usu'#225'rio:'
        Font.Charset = ANSI_CHARSET
        Font.Color = 11447982
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object labelNome: TLabel
        Left = 10
        Top = 55
        Width = 100
        Height = 17
        Caption = 'Nome Completo'
        Font.Charset = ANSI_CHARSET
        Font.Color = 11447982
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object labelPermissao: TLabel
        Left = 10
        Top = 152
        Width = 118
        Height = 17
        Caption = 'N'#237'vel de Permiss'#227'o:'
        Font.Charset = ANSI_CHARSET
        Font.Color = 11447982
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object labelSenha: TLabel
        Left = 10
        Top = 104
        Width = 40
        Height = 17
        Caption = 'Senha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clSilver
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object labelConfirmarSenha: TLabel
        Left = 216
        Top = 104
        Width = 104
        Height = 17
        Caption = 'Confirmar Senha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clSilver
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object editUsuario: TEdit
        Left = 10
        Top = 24
        Width = 409
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object editNome: TEdit
        Left = 10
        Top = 73
        Width = 409
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object cbNivel: TComboBox
        Left = 10
        Top = 170
        Width = 55
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5')
      end
      object editSenha: TEdit
        Left = 10
        Top = 122
        Width = 195
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 3
      end
      object editConfirmarSenha: TEdit
        Left = 215
        Top = 122
        Width = 204
        Height = 25
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        PasswordChar = '*'
        TabOrder = 4
      end
    end
  end
  object tcCadastroUsuario: TFDTransaction
    Options.AutoStop = False
    Connection = frmMenu.FDconexao
    Left = 144
    Top = 443
  end
  object dsusuario: TDataSource
    DataSet = qryUsuario
    Left = 83
    Top = 443
  end
  object qryUsuario: TFDQuery
    Connection = frmMenu.FDconexao
    Transaction = tcCadastroUsuario
    UpdateTransaction = tcCadastroUsuario
    UpdateOptions.AssignedValues = [uvGeneratorName]
    UpdateOptions.GeneratorName = 'GEN_USUARIO_ID'
    UpdateOptions.UpdateTableName = 'USUARIO'
    UpdateOptions.KeyFields = 'USUARIOID'
    UpdateOptions.AutoIncFields = 'USUARIOID'
    SQL.Strings = (
      'select * from usuario')
    Left = 19
    Top = 443
    object qryUsuarioUSUARIOID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'USUARIOID'
      Origin = 'USUARIOID'
      Required = True
    end
    object qryUsuarioNIVEL: TIntegerField
      DisplayLabel = 'N'#237'vel'
      FieldName = 'NIVEL'
      Origin = 'NIVEL'
    end
    object qryUsuarioUSUARIO: TStringField
      DisplayLabel = 'Usu'#225'rio'
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object qryUsuarioNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object qryUsuarioSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 64
    end
  end
end
