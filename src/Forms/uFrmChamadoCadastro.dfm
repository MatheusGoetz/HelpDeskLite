object frmChamadoCadastro: TfrmChamadoCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro de Chamado'
  ClientHeight = 411
  ClientWidth = 484
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnShow = FormShow
  TextHeight = 15
  object lblCliente: TLabel
    Left = 104
    Top = 32
    Width = 40
    Height = 15
    Caption = 'Cliente:'
  end
  object lblDescricao: TLabel
    Left = 104
    Top = 82
    Width = 54
    Height = 15
    Caption = 'Descri'#231#227'o:'
  end
  object lblDataPrevista: TLabel
    Left = 104
    Top = 198
    Width = 71
    Height = 15
    Caption = 'Data Prevista:'
  end
  object lblStatus: TLabel
    Left = 210
    Top = 198
    Width = 35
    Height = 15
    Caption = 'Status:'
  end
  object lblValorTotal: TLabel
    Left = 104
    Top = 258
    Width = 56
    Height = 15
    Caption = 'Valor total:'
  end
  object cmbCliente: TComboBox
    Left = 104
    Top = 53
    Width = 265
    Height = 23
    Color = clMenu
    TabOrder = 0
    Text = 'Selecione um cliente...'
  end
  object memDescricao: TMemo
    Left = 104
    Top = 103
    Width = 265
    Height = 89
    Lines.Strings = (
      'memDescricao')
    TabOrder = 1
  end
  object dtpDataPrevista: TDateTimePicker
    Left = 104
    Top = 219
    Width = 100
    Height = 23
    Date = 46293.000000000000000000
    Time = 0.856284027780930000
    TabOrder = 2
  end
  object cmbStatus: TComboBox
    Left = 210
    Top = 219
    Width = 159
    Height = 23
    Style = csDropDownList
    TabOrder = 3
    Items.Strings = (
      'ABERTO'
      'EM ANDAMENTO'
      'AGUARDANDO CLIENTE'
      'RESOLVIDO'
      'FECHADO')
  end
  object edtValorTotal: TEdit
    Left = 166
    Top = 255
    Width = 203
    Height = 23
    TabOrder = 4
  end
  object btnCancelar: TButton
    Left = 294
    Top = 304
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancelar'
    TabOrder = 5
  end
  object btnSalvar: TButton
    Left = 206
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Salvar'
    Default = True
    TabOrder = 6
    OnClick = btnSalvarClick
  end
end
