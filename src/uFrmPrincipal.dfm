object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'HelpDesk lite'
  ClientHeight = 661
  ClientWidth = 1184
  Color = 16579320
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 17
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 1184
    Height = 70
    Align = alTop
    BevelOuter = bvNone
    Color = 3877150
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 1182
    DesignSize = (
      1184
      70)
    object lblLogo: TLabel
      Left = 24
      Top = 15
      Width = 149
      Height = 32
      Caption = 'HelpDeskLite'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblHeaderDescricao: TLabel
      Left = 25
      Top = 43
      Width = 214
      Height = 15
      Caption = 'Sistema de gerenciamento de chamados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 14800331
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnSair: TButton
      Left = 1011
      Top = 20
      Width = 90
      Height = 32
      Anchors = [akRight, akBottom]
      Caption = 'Sair'
      TabOrder = 0
      OnClick = btnSairClick
      ExplicitLeft = 1009
    end
  end
  object pnlConteudo: TPanel
    Left = 0
    Top = 70
    Width = 1184
    Height = 561
    Align = alClient
    BevelOuter = bvNone
    Color = 16579320
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 1182
    ExplicitHeight = 553
    object lblTitulo: TLabel
      Left = 68
      Top = 27
      Width = 358
      Height = 37
      Caption = 'Bem-vindo ao HelpDeskLite'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 3877150
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblSubtitulo: TLabel
      Left = 68
      Top = 64
      Width = 213
      Height = 17
      Caption = 'Selecione uma op'#231#227'o para come'#231'ar.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 9139300
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object pnlClientes: TPanel
      Left = 234
      Top = 221
      Width = 280
      Height = 150
      BevelOuter = bvNone
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object Label1: TLabel
        Left = 106
        Top = 8
        Width = 69
        Height = 25
        Caption = 'Clientes'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label2: TLabel
        Left = 25
        Top = 39
        Width = 240
        Height = 17
        Caption = 'Cadastre, consulte e gerencie os clientes.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9139300
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object btnClientes: TButton
        Left = 64
        Top = 70
        Width = 160
        Height = 34
        Caption = 'Gerenciar clientes'
        TabOrder = 0
        OnClick = btnClientesClick
      end
    end
    object pnlChamados: TPanel
      Left = 648
      Top = 221
      Width = 280
      Height = 150
      BevelOuter = bvNone
      TabOrder = 1
      object Label3: TLabel
        Left = 96
        Top = 8
        Width = 92
        Height = 25
        Caption = 'Chamados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 25
        Top = 39
        Width = 266
        Height = 17
        Caption = 'Acompanhe chamados, itens, status e prazos.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 9139300
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object btnChamados: TButton
        Left = 64
        Top = 70
        Width = 160
        Height = 34
        Caption = 'Gerenciar chamados'
        TabOrder = 0
        OnClick = btnChamadosClick
      end
    end
  end
  object pnlFooter: TPanel
    Left = 0
    Top = 631
    Width = 1184
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    Color = 16381425
    ParentBackground = False
    TabOrder = 2
    ExplicitTop = 623
    ExplicitWidth = 1182
    object Label5: TLabel
      Left = 56
      Top = 6
      Width = 222
      Height = 17
      Caption = 'HelpDeskLite '#8226' Delphi 12 '#8226' Firebird 2.5'
    end
    object Label6: TLabel
      Left = 1072
      Top = 6
      Width = 23
      Height = 17
      Caption = 'v1.0'
    end
  end
end
