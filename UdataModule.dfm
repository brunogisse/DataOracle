object dm: Tdm
  OldCreateOrder = False
  Height = 571
  Width = 909
  object dsLogin: TDataSource
    DataSet = qryLogin
    Left = 104
    Top = 32
  end
  object qryLogin: TFDQuery
    Connection = frmMenu.FDconexao
    SQL.Strings = (
      
        'select * from usuario where (usuario = :usuario) and (senha = :s' +
        'enha)')
    Left = 40
    Top = 32
    ParamData = <
      item
        Name = 'USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
        Value = Null
      end
      item
        Name = 'SENHA'
        DataType = ftString
        ParamType = ptInput
        Size = 64
      end>
    object qryLoginUSUARIOID: TIntegerField
      FieldName = 'USUARIOID'
      Origin = 'USUARIOID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryLoginNIVEL: TIntegerField
      FieldName = 'NIVEL'
      Origin = 'NIVEL'
    end
    object qryLoginUSUARIO: TStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Size = 50
    end
    object qryLoginNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 50
    end
    object qryLoginSENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 64
    end
  end
end
