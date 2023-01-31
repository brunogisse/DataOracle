object frmDefinirEstoque: TfrmDefinirEstoque
  Left = 0
  Top = 0
  Caption = 'frmDefinirEstoque'
  ClientHeight = 195
  ClientWidth = 573
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object gbUsina: TGroupBox
    Left = 5
    Top = 3
    Width = 564
    Height = 190
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = 8553090
    Font.Height = -11
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object labelDefinirEstoque: TLabel
      Left = 106
      Top = 70
      Width = 100
      Height = 13
      Caption = 'DEFINA O ESTOQUE'
      Font.Charset = ANSI_CHARSET
      Font.Color = 8553090
      Font.Height = -11
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 106
      Top = 89
      Width = 233
      Height = 25
      Font.Charset = ANSI_CHARSET
      Font.Color = 8553090
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      KeyField = 'PRODUTOID'
      ListField = 'DESCRICAO'
      ParentFont = False
      TabOrder = 0
    end
    object painelClasseCancelar: TPanel
      Left = 352
      Top = 81
      Width = 107
      Height = 42
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      object painelCancelar: TPanel
        Left = 8
        Top = 8
        Width = 75
        Height = 25
        BevelOuter = bvNone
        Caption = 'Adicionar'
        Color = 11360274
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        object btnCancelar: TSpeedButton
          Left = 0
          Top = 0
          Width = 75
          Height = 25
          Align = alClient
          Flat = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ExplicitLeft = 64
          ExplicitTop = 8
          ExplicitWidth = 153
          ExplicitHeight = 41
        end
      end
    end
  end
end
