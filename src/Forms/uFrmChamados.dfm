object frmChamados: TfrmChamados
  Left = 0
  Top = 0
  Caption = 'Chamados'
  ClientHeight = 561
  ClientWidth = 1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1084
    Height = 50
    Align = alTop
    TabOrder = 0
    object btnNovo: TButton
      Left = 40
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnEditar: TButton
      Left = 160
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 280
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnAtualizar: TButton
      Left = 400
      Top = 13
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 3
    end
  end
  object dbgChamados: TDBGrid
    Left = 0
    Top = 50
    Width = 1084
    Height = 511
    Align = alClient
    DataSource = dmChamado.dsChamados
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
end
