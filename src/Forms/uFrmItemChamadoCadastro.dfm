object frmItemChamadoCadastro: TfrmItemChamadoCadastro
  Left = 0
  Top = 0
  Caption = 'Novo Item'
  ClientHeight = 315
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblDescricao: TLabel
    Left = 80
    Top = 64
    Width = 54
    Height = 15
    Caption = 'Descri'#231#227'o:'
  end
  object lblQuantidade: TLabel
    Left = 80
    Top = 120
    Width = 65
    Height = 15
    Caption = 'Quantidade:'
  end
  object lblValorUnitario: TLabel
    Left = 207
    Top = 120
    Width = 73
    Height = 15
    Caption = 'Valor unit'#225'rio:'
  end
  object edtDescricao: TEdit
    Left = 80
    Top = 85
    Width = 248
    Height = 23
    TabOrder = 0
  end
  object edtQuantidade: TEdit
    Left = 80
    Top = 141
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object edtValorUnitario: TEdit
    Left = 207
    Top = 141
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object btnSalvar: TButton
    Left = 160
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Salvar'
    TabOrder = 3
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 253
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btnCancelarClick
  end
end
