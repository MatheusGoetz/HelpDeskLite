object frmItensChamado: TfrmItensChamado
  Left = 0
  Top = 0
  Caption = 'Itens do chamado'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnResize = FormResize
  TextHeight = 15
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 624
    Height = 41
    Align = alTop
    TabOrder = 0
    object btnNovo: TButton
      Left = 72
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnEditar: TButton
      Left = 176
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
    end
    object btnExcluir: TButton
      Left = 280
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
    end
    object btnFechar: TButton
      Left = 376
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 3
      OnClick = btnFecharClick
    end
  end
  object dbgItens: TDBGrid
    Left = 0
    Top = 41
    Width = 624
    Height = 400
    Align = alClient
    DataSource = dmItemChamado.dsItensChamado
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
end
