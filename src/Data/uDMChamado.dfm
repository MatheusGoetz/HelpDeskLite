object dmChamado: TdmChamado
  OnCreate = DataModuleCreate
  Height = 600
  Width = 800
  PixelsPerInch = 120
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
    Left = 120
    Top = 250
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
    Left = 120
    Top = 330
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
        Value = Null
      end>
  end
  object qryChamadoCRUD: TFDQuery
    Connection = dmConexao.FDConnection
    Left = 120
    Top = 420
  end
  object dsChamados: TDataSource
    DataSet = qryChamados
    Left = 300
    Top = 250
  end
end
