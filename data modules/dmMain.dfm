object dm: Tdm
  Height = 767
  Width = 898
  object qryClientes: TFDQuery
    Active = True
    Connection = connection
    SQL.Strings = (
      'select *'
      'from clientes'
      'join cidades on ci_ibge = cl_cidade'
      'join estados on es_ibge = ci_estado')
    Left = 48
    Top = 152
    object qryClientesCL_CODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CL_CODIGO'
      Origin = 'CL_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object qryClientesCL_NOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'CL_NOME'
      Origin = 'CL_NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 200
    end
    object qryClientesCL_INATIVO: TStringField
      FieldName = 'CL_INATIVO'
      Origin = 'CL_INATIVO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object qryClientesCL_DTCADASTRO: TDateField
      DisplayLabel = 'Data de cadastro'
      FieldName = 'CL_DTCADASTRO'
      Origin = 'CL_DTCADASTRO'
      ProviderFlags = [pfInUpdate]
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object qryClientesCL_DTNASCIMENTO: TDateField
      FieldName = 'CL_DTNASCIMENTO'
      Origin = 'CL_DTNASCIMENTO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object qryClientesCL_RUA: TStringField
      FieldName = 'CL_RUA'
      Origin = 'CL_RUA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryClientesCL_NRO: TStringField
      FieldName = 'CL_NRO'
      Origin = 'CL_NRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCL_FONE: TStringField
      FieldName = 'CL_FONE'
      Origin = 'CL_FONE'
      EditMask = '(99) 90000-0000;0;_'
      Size = 15
    end
    object qryClientesCL_COMPLEMENTO: TStringField
      FieldName = 'CL_COMPLEMENTO'
      Origin = 'CL_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qryClientesCL_COORDENADAS: TStringField
      FieldName = 'CL_COORDENADAS'
      Origin = 'CL_COORDENADAS'
      ProviderFlags = [pfInUpdate]
      Size = 300
    end
    object qryClientesCL_CIDADE: TIntegerField
      DisplayLabel = 'Cidade'
      FieldName = 'CL_CIDADE'
      Origin = 'CL_CIDADE'
      ProviderFlags = [pfInUpdate]
      Required = True
    end
    object qryClientesCI_IBGE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CI_IBGE'
      Origin = 'CI_IBGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryClientesCI_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CI_NOME'
      Origin = 'CI_NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 150
    end
    object qryClientesCI_ESTADO: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'CI_ESTADO'
      Origin = 'CI_ESTADO'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryClientesES_IBGE: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ES_IBGE'
      Origin = 'ES_IBGE'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryClientesES_NOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ES_NOME'
      Origin = 'ES_NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryClientesES_UF: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ES_UF'
      Origin = 'ES_UF'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
    object qryClientesCL_CPF: TStringField
      FieldName = 'CL_CPF'
      Origin = 'CL_CPF'
      EditMask = '999.999.999-99;0;_'
      Size = 11
    end
  end
  object dsClientes: TDataSource
    DataSet = qryClientes
    Left = 136
    Top = 152
  end
  object dsCidades: TDataSource
    DataSet = qryCidades
    Left = 360
    Top = 160
  end
  object qryCidades: TFDQuery
    Active = True
    Connection = connection
    SQL.Strings = (
      'select *'
      'from cidades'
      'order by ci_nome')
    Left = 272
    Top = 160
    object qryCidadesCI_IBGE: TIntegerField
      FieldName = 'CI_IBGE'
      Origin = 'CI_IBGE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCidadesCI_NOME: TStringField
      FieldName = 'CI_NOME'
      Origin = 'CI_NOME'
      Required = True
      Size = 150
    end
    object qryCidadesCI_ESTADO: TIntegerField
      FieldName = 'CI_ESTADO'
      Origin = 'CI_ESTADO'
    end
  end
  object dsEstados: TDataSource
    DataSet = qryEstados
    Left = 360
    Top = 232
  end
  object qryEstados: TFDQuery
    Active = True
    Connection = connection
    SQL.Strings = (
      'select *'
      'from estados'
      'order by es_nome')
    Left = 272
    Top = 232
    object qryEstadosES_IBGE: TIntegerField
      FieldName = 'ES_IBGE'
      Origin = 'ES_IBGE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEstadosES_NOME: TStringField
      FieldName = 'ES_NOME'
      Origin = 'ES_NOME'
      Size = 100
    end
    object qryEstadosES_UF: TStringField
      FieldName = 'ES_UF'
      Origin = 'ES_UF'
      FixedChar = True
      Size = 2
    end
  end
  object connection: TFDConnection
    Params.Strings = (
      'Database=C:\Elos Sistema\ELOSDB.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 344
  end
  object fbclient: TFDPhysFBDriverLink
    DriverID = 'FB'
    VendorLib = 'C:\Elos Sistema\FBCLIENT.DLL'
    Left = 80
    Top = 440
  end
end
