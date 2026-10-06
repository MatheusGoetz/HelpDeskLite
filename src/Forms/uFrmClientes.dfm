object frmClientes: TfrmClientes
  Left = 0
  Top = 0
  Caption = 'Clientes'
  ClientHeight = 561
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnResize = FormResize
  TextHeight = 15
  object dbgClientes: TDBGrid
    Left = 0
    Top = 41
    Width = 984
    Height = 520
    Align = alClient
    DataSource = dmCliente.dsClientes
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 984
    Height = 41
    Align = alTop
    Color = 3877150
    ParentBackground = False
    TabOrder = 1
    object btnNovo: TButton
      Left = 16
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnEditar: TButton
      Left = 113
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 208
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnAtualizar: TButton
      Left = 304
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 3
    end
  end
end
