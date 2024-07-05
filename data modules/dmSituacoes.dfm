object dm_Situacoes: Tdm_Situacoes
  Height = 480
  Width = 640
  object qrySituacoes: TFDQuery
    Connection = dm.connection
    SQL.Strings = (
      'select *'
      'from situacao'
      'order by st_descricao')
    Left = 56
    Top = 24
    object qrySituacoesST_CODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'ST_CODIGO'
      Origin = 'ST_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qrySituacoesST_DESCRICAO: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'ST_DESCRICAO'
      Origin = 'ST_DESCRICAO'
      Size = 100
    end
    object qrySituacoesST_COR: TWideStringField
      DisplayLabel = 'Cor'
      FieldName = 'ST_COR'
      Origin = 'ST_COR'
      Size = 100
    end
  end
  object dsSituacoes: TDataSource
    DataSet = qrySituacoes
    Left = 56
    Top = 96
  end
end
