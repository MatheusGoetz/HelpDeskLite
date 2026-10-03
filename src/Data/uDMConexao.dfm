object dmConexao: TdmConexao
  Height = 480
  Width = 640
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'Database=D:\Projects\HelpDeskLite\database\HelpDeskLite.fdb'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=UTF8')
    LoginPrompt = False
    Left = 232
    Top = 104
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 344
    Top = 104
  end
end
