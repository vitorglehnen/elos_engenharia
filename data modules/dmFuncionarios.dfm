object dm_funcionarios: Tdm_funcionarios
  Height = 480
  Width = 640
  object qryFuncionarios: TFDQuery
    Active = True
    ChangeAlertName = 'qryFuncionarios'
    Connection = dm.connection
    SQL.Strings = (
      'SELECT *'
      'FROM funcionarios'
      'ORDER BY us_nome')
    Left = 32
    Top = 16
    object qryFuncionariosUS_CODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      DisplayWidth = 10
      FieldName = 'US_CODIGO'
      Origin = 'US_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryFuncionariosUS_NOME: TWideStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 20
      FieldName = 'US_NOME'
      Origin = 'US_NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryFuncionariosUS_SENHA: TWideStringField
      DisplayLabel = 'Senha'
      DisplayWidth = 20
      FieldName = 'US_SENHA'
      Origin = 'US_SENHA'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryFuncionariosUS_ADMIN: TBooleanField
      DefaultExpression = 'False'
      DisplayLabel = 'Admnistrador'
      DisplayWidth = 14
      FieldName = 'US_ADMIN'
      Origin = 'US_ADMIN'
      ProviderFlags = [pfInUpdate]
    end
    object qryFuncionariosUS_INATIVO: TBooleanField
      DefaultExpression = 'False'
      DisplayLabel = 'Inativo'
      DisplayWidth = 32
      FieldName = 'US_INATIVO'
      Origin = 'US_INATIVO'
      ProviderFlags = [pfInUpdate]
    end
  end
  object dsFuncionarios: TDataSource
    DataSet = qryFuncionarios
    Left = 32
    Top = 80
  end
end
