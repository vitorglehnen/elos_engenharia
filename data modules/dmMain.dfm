object dm: Tdm
  Height = 959
  Width = 1123
  PixelsPerInch = 120
  object qryClientes: TFDQuery
    Active = True
    Connection = connection
    SQL.Strings = (
      'select *'
      'from clientes'
      'join cidades on ci_ibge = cl_cidade'
      'join estados on es_ibge = ci_estado')
    Left = 60
    Top = 190
    object qryClientesCL_CODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CL_CODIGO'
      Origin = 'CL_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryClientesCL_NOME: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'CL_NOME'
      Origin = 'CL_NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 200
    end
    object qryClientesCL_CPF: TWideStringField
      DisplayLabel = 'CPF'
      FieldName = 'CL_CPF'
      Origin = 'CL_CPF'
      ProviderFlags = [pfInUpdate]
      Size = 11
    end
    object qryClientesCL_FONE: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'CL_FONE'
      Origin = 'CL_FONE'
      ProviderFlags = [pfInUpdate]
      Size = 15
    end
    object qryClientesCL_INATIVO: TWideStringField
      DisplayLabel = 'Inativo'
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
    end
    object qryClientesCL_DTNASCIMENTO: TDateField
      DisplayLabel = 'Data de nascimento'
      FieldName = 'CL_DTNASCIMENTO'
      Origin = 'CL_DTNASCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCL_CEP: TWideStringField
      DisplayLabel = 'CEP'
      FieldName = 'CL_CEP'
      Origin = 'CL_CEP'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCL_RUA: TWideStringField
      DisplayLabel = 'Rua'
      FieldName = 'CL_RUA'
      Origin = 'CL_RUA'
      ProviderFlags = [pfInUpdate]
      Size = 100
    end
    object qryClientesCL_NRO: TWideStringField
      DisplayLabel = 'N'#250'mero'
      FieldName = 'CL_NRO'
      Origin = 'CL_NRO'
      ProviderFlags = [pfInUpdate]
    end
    object qryClientesCL_COMPLEMENTO: TWideStringField
      DisplayLabel = 'Complemento'
      FieldName = 'CL_COMPLEMENTO'
      Origin = 'CL_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qryClientesCL_COORDENADAS: TWideStringField
      DisplayLabel = 'Coordenadas'
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
    object qryClientesCL_BAIRRO: TWideStringField
      DisplayLabel = 'Bairro'
      FieldName = 'CL_BAIRRO'
      Origin = 'CL_BAIRRO'
      ProviderFlags = [pfInUpdate]
      Size = 30
    end
    object qryClientesCI_IBGE: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo IBGE da cidade'
      FieldName = 'CI_IBGE'
      Origin = 'CI_IBGE'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
    end
    object qryClientesCI_NOME: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome da cidade'
      FieldName = 'CI_NOME'
      Origin = 'CI_NOME'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
      Size = 150
    end
    object qryClientesCI_ESTADO: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Estado da cidade'
      FieldName = 'CI_ESTADO'
      Origin = 'CI_ESTADO'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
    end
    object qryClientesES_IBGE: TIntegerField
      AutoGenerateValue = arDefault
      DisplayLabel = 'C'#243'digo IBGE do estado'
      FieldName = 'ES_IBGE'
      Origin = 'ES_IBGE'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
    end
    object qryClientesES_NOME: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Nome do estado'
      FieldName = 'ES_NOME'
      Origin = 'ES_NOME'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
      Size = 100
    end
    object qryClientesES_UF: TWideStringField
      AutoGenerateValue = arDefault
      DisplayLabel = 'Sigla do estado'
      FieldName = 'ES_UF'
      Origin = 'ES_UF'
      ProviderFlags = [pfInUpdate]
      ReadOnly = True
      FixedChar = True
      Size = 2
    end
  end
  object dsClientes: TDataSource
    DataSet = qryClientes
    Left = 170
    Top = 190
  end
  object dsCidades: TDataSource
    DataSet = qryCidades
    Left = 450
    Top = 200
  end
  object qryCidades: TFDQuery
    Active = True
    Connection = connection
    SQL.Strings = (
      'select *'
      'from cidades'
      'order by ci_nome')
    Left = 340
    Top = 200
    object qryCidadesCI_IBGE: TIntegerField
      FieldName = 'CI_IBGE'
      Origin = 'CI_IBGE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCidadesCI_NOME: TWideStringField
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
    Left = 450
    Top = 290
  end
  object qryEstados: TFDQuery
    Active = True
    Connection = connection
    SQL.Strings = (
      'select *'
      'from estados'
      'order by es_nome')
    Left = 340
    Top = 290
    object qryEstadosES_IBGE: TIntegerField
      FieldName = 'ES_IBGE'
      Origin = 'ES_IBGE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryEstadosES_NOME: TWideStringField
      FieldName = 'ES_NOME'
      Origin = 'ES_NOME'
      Size = 100
    end
    object qryEstadosES_UF: TWideStringField
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
    Left = 100
    Top = 430
  end
  object fbclient: TFDPhysFBDriverLink
    DriverID = 'FB'
    VendorLib = 'C:\Elos Sistema\FBCLIENT.DLL'
    Left = 100
    Top = 550
  end
end
