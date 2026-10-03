object frmClienteCadastro: TfrmClienteCadastro
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cadastro de Cliente'
  ClientHeight = 311
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object lblTelefone: TLabel
    Left = 128
    Top = 155
    Width = 48
    Height = 15
    Caption = 'Telefone:'
  end
  object lblEmail: TLabel
    Left = 128
    Top = 107
    Width = 37
    Height = 15
    Caption = 'E-mail:'
  end
  object lblDocumento: TLabel
    Left = 128
    Top = 59
    Width = 66
    Height = 15
    Caption = 'Documento:'
  end
  object lblNome: TLabel
    Left = 128
    Top = 11
    Width = 36
    Height = 15
    Caption = 'Nome:'
  end
  object btnSalvar: TButton
    Left = 174
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Default = True
    TabOrder = 0
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 270
    Top = 232
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    Default = True
    TabOrder = 1
    OnClick = btnCancelarClick
  end
  object edtNome: TEdit
    Left = 128
    Top = 32
    Width = 217
    Height = 23
    TabOrder = 2
  end
  object edtDocumento: TEdit
    Left = 128
    Top = 80
    Width = 217
    Height = 23
    TabOrder = 3
  end
  object edtEmail: TEdit
    Left = 128
    Top = 128
    Width = 217
    Height = 23
    TabOrder = 4
  end
  object edtTelefone: TEdit
    Left = 128
    Top = 176
    Width = 217
    Height = 23
    TabOrder = 5
    OnChange = edtTelefoneChange
  end
end
