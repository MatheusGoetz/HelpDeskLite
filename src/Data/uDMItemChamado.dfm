object dmItemChamado: TdmItemChamado
  Height = 480
  Width = 640
  object qryItensChamado: TFDQuery
    Connection = dmConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      '    ID,'
      '    CHAMADO_ID,'
      '    DESCRICAO,'
      '    QUANTIDADE,'
      '    VALOR_UNITARIO,'
      '    (QUANTIDADE * VALOR_UNITARIO) AS SUBTOTAL'
      'FROM ITEM_CHAMADO'
      'WHERE CHAMADO_ID = :CHAMADO_ID'
      'ORDER BY ID')
    Left = 120
    Top = 112
    ParamData = <
      item
        Name = 'CHAMADO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryItemCRUD: TFDQuery
    Connection = dmConexao.FDConnection
    Left = 120
    Top = 184
  end
  object qryTotalItens: TFDQuery
    Connection = dmConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      '    COALESCE(SUM(QUANTIDADE * VALOR_UNITARIO), 0) AS TOTAL'
      'FROM ITEM_CHAMADO'
      'WHERE CHAMADO_ID = :CHAMADO_ID')
    Left = 120
    Top = 256
    ParamData = <
      item
        Name = 'CHAMADO_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object dsItensChamado: TDataSource
    DataSet = qryItensChamado
    Left = 264
    Top = 184
  end
end
