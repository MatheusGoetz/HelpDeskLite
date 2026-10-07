object dmConexao: TdmConexao
  OnCreate = DataModuleCreate
  Height = 600
  Width = 800
  PixelsPerInch = 120
  object FDConnection: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'CharacterSet=UTF8'
      '')
    LoginPrompt = False
    Left = 290
    Top = 130
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    Left = 430
    Top = 130
  end
end
