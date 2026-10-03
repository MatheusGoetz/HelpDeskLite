object dmCliente: TdmCliente
  Height = 480
  Width = 640
  object qryClientes: TFDQuery
    Active = True
    Connection = dmConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      '    ID,'
      '    NOME,'
      '    DOCUMENTO,'
      '    EMAIL,'
      '    TELEFONE,'
      '    DATA_CADASTRO'
      'FROM CLIENTE'
      'ORDER BY NOME')
    Left = 304
    Top = 224
  end
  object dsClientes: TDataSource
    DataSet = qryClientes
    Left = 184
    Top = 224
  end
  object qryClienteCRUD: TFDQuery
    Connection = dmConexao.FDConnection
    Left = 192
    Top = 136
  end
  object qryCliente: TFDQuery
    Connection = dmConexao.FDConnection
    Left = 216
    Top = 312
  end
  object qryClientesCombo: TFDQuery
    Active = True
    Connection = dmConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      '    ID,'
      '    NOME'
      'FROM CLIENTE'
      'ORDER BY NOME')
    Left = 336
    Top = 328
  end
end
