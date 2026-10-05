object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'HelpDesk lite'
  ClientHeight = 661
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object btnClientes: TButton
    Left = 208
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Clientes'
    TabOrder = 0
    OnClick = btnClientesClick
  end
  object btnChamados: TButton
    Left = 208
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Chamados'
    TabOrder = 1
    OnClick = btnChamadosClick
  end
  object btnSair: TButton
    Left = 208
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 2
    OnClick = btnSairClick
  end
end
