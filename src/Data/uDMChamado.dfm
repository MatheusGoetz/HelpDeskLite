object dmChamado: TdmChamado
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object qryChamados: TFDQuery
    Connection = dmConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      '    C.ID,'
      '    C.CLIENTE_ID,'
      '    CL.NOME AS CLIENTE,'
      '    C.DATA_ABERTURA,'
      '    C.DATA_FECHAMENTO,'
      '    C.DATA_PREVISTA,'
      '    C.DESCRICAO,'
      '    C.STATUS,'
      '    C.VALOR_TOTAL'
      'FROM CHAMADO C'
      'INNER JOIN CLIENTE CL'
      '    ON CL.ID = C.CLIENTE_ID'
      'ORDER BY C.ID DESC')
    Left = 96
    Top = 200
  end
  object qryChamado: TFDQuery
    Connection = dmConexao.FDConnection
    SQL.Strings = (
      'SELECT'
      '    ID,'
      '    CLIENTE_ID,'
      '    DATA_ABERTURA,'
      '    DATA_FECHAMENTO,'
      '    DATA_PREVISTA,'
      '    DESCRICAO,'
      '    STATUS,'
      '    VALOR_TOTAL'
      'FROM CHAMADO'
      'WHERE ID = :ID')
    Left = 96
    Top = 264
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryChamadoCRUD: TFDQuery
    Connection = dmConexao.FDConnection
    Left = 96
    Top = 336
  end
  object dsChamados: TDataSource
    DataSet = qryChamados
    Left = 240
    Top = 200
  end
end
