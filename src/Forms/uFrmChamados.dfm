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
  OnResize = FormResize
  OnShow = FormShow
  TextHeight = 15
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 1084
    Height = 50
    Align = alTop
    TabOrder = 0
    object lblDataInicial: TLabel
      Left = 424
      Top = 0
      Width = 61
      Height = 15
      Caption = 'Data inicial:'
    end
    object lblDataFinal: TLabel
      Left = 520
      Top = 0
      Width = 53
      Height = 15
      Caption = 'Data final:'
    end
    object lblFiltroStatus: TLabel
      Left = 598
      Top = 0
      Width = 35
      Height = 15
      Caption = 'Status:'
    end
    object lblFiltroCliente: TLabel
      Left = 749
      Top = 0
      Width = 40
      Height = 15
      Caption = 'Cliente:'
    end
    object btnNovo: TButton
      Left = 8
      Top = 19
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btnNovoClick
    end
    object btnEditar: TButton
      Left = 89
      Top = 19
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnExcluir: TButton
      Left = 170
      Top = 19
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 2
      OnClick = btnExcluirClick
    end
    object btnAtualizar: TButton
      Left = 251
      Top = 19
      Width = 75
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 3
    end
    object dtpDataInicial: TDateTimePicker
      Left = 424
      Top = 21
      Width = 81
      Height = 23
      Date = 46300.000000000000000000
      Time = 0.869278749996738000
      TabOrder = 4
    end
    object dtpDataFinal: TDateTimePicker
      Left = 511
      Top = 21
      Width = 81
      Height = 23
      Date = 46300.000000000000000000
      Time = 0.870191273148520900
      TabOrder = 5
    end
    object cmbFiltroStatus: TComboBox
      Left = 598
      Top = 21
      Width = 145
      Height = 23
      Style = csDropDownList
      ItemIndex = 0
      TabOrder = 6
      Text = 'TODOS'
      Items.Strings = (
        'TODOS'
        'ABERTO'
        'EM_ANDAMENTO'
        'CONCLUIDO'
        'CANCELADO')
    end
    object edtFiltroCliente: TEdit
      Left = 749
      Top = 21
      Width = 121
      Height = 23
      TabOrder = 7
    end
    object btnFiltrar: TButton
      Left = 884
      Top = 19
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 8
      OnClick = btnFiltrarClick
    end
    object btnLimparFiltro: TButton
      Left = 977
      Top = 19
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 9
      OnClick = btnLimparFiltroClick
    end
  end
  object dbgChamados: TDBGrid
    Left = 0
    Top = 50
    Width = 1084
    Height = 470
    Align = alClient
    DataSource = dmChamado.dsChamados
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = dbgChamadosDrawColumnCell
  end
  object pnlDown: TPanel
    Left = 0
    Top = 520
    Width = 1084
    Height = 41
    Align = alBottom
    TabOrder = 2
    object lblTotalAbertos: TLabel
      Left = 627
      Top = 6
      Width = 53
      Height = 15
      Caption = 'Abertos: 0'
    end
    object lblTotalAndamento: TLabel
      Left = 696
      Top = 6
      Width = 93
      Height = 15
      Caption = 'Em andamento: 0'
    end
    object lblTotalConcluidos: TLabel
      Left = 795
      Top = 6
      Width = 72
      Height = 15
      Caption = 'Conclu'#237'dos: 0'
    end
    object lblTotalAtrasados: TLabel
      Left = 878
      Top = 6
      Width = 64
      Height = 15
      Caption = 'Em atraso: 0'
    end
    object btnItens: TButton
      Left = 8
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Itens'
      TabOrder = 0
      OnClick = btnItensClick
    end
    object btnRelatorio: TButton
      Left = 968
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Relat'#243'rio'
      TabOrder = 1
      OnClick = btnRelatorioClick
    end
  end
  object frxReportChamados: TfrxReport
    Version = '2026.2.5'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection, pbWatermarks]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45935.000000000000000000
    ReportOptions.LastChange = 46300.849971180600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      'end.')
    Left = 984
    Top = 456
    Datasets = <
      item
        DataSet = frxDBChamados
        DataSetName = 'Chamados'
      end>
    Variables = <>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 64.252010000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object MemoTitulo: TfrxMemoView
          AllowVectorExport = True
          Width = 1046.929810000000000000
          Height = 30.236240000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'HELPDESK LITE')
          ParentFont = False
        end
        object MemoSubtitulo: TfrxMemoView
          AllowVectorExport = True
          Top = 30.236240000000000000
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de Chamados')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 105.826840000000000000
        Width = 1046.929810000000000000
        object HdrID: TfrxMemoView
          AllowVectorExport = True
          Width = 45.354360000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'ID')
          ParentFont = False
          VAlign = vaCenter
        end
        object HdrCliente: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Width = 272.125980000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
          VAlign = vaCenter
        end
        object HdrAbertura: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480340000000000000
          Width = 128.504020000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Abertura')
          ParentFont = False
          VAlign = vaCenter
        end
        object HdrPrevista: TfrxMemoView
          AllowVectorExport = True
          Left = 445.984360000000000000
          Width = 128.504020000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Prevista')
          ParentFont = False
          VAlign = vaCenter
        end
        object HdrStatus: TfrxMemoView
          AllowVectorExport = True
          Left = 574.488380000000000000
          Width = 200.315090000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Status')
          ParentFont = False
          VAlign = vaCenter
        end
        object HdrValor: TfrxMemoView
          AllowVectorExport = True
          Left = 774.803470000000000000
          Width = 272.126340000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor Total')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 192.756030000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBChamados
        DataSetName = 'Chamados'
        RowCount = 0
        Stretched = True
        object FldID: TfrxMemoView
          AllowVectorExport = True
          Width = 45.354360000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Chamados."ID"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object FldCliente: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Width = 272.125980000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            '[Chamados."CLIENTE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object FldAbertura: TfrxMemoView
          AllowVectorExport = True
          Left = 317.480340000000000000
          Width = 128.504020000000000000
          Height = 22.677180000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Chamados."DATA_ABERTURA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object FldPrevista: TfrxMemoView
          AllowVectorExport = True
          Left = 445.984360000000000000
          Width = 128.504020000000000000
          Height = 22.677180000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Chamados."DATA_PREVISTA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object FldStatus: TfrxMemoView
          AllowVectorExport = True
          Left = 574.488380000000000000
          Width = 200.315090000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haCenter
          Memo.UTF8W = (
            '[Chamados."STATUS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object FldValor: TfrxMemoView
          AllowVectorExport = True
          Left = 774.803470000000000000
          Width = 272.126340000000000000
          Height = 22.677180000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          HAlign = haRight
          Memo.UTF8W = (
            '[Chamados."VALOR_TOTAL"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object FldDescricao: TfrxMemoView
          AllowVectorExport = True
          Top = 22.677180000000000000
          Width = 1046.929810000000000000
          Height = 30.236240000000000000
          StretchMode = smActualHeight
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = [fsItalic]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            'Descri'#231#227'o: [Chamados."DESCRICAO"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 309.921460000000000000
        Width = 1046.929810000000000000
        object MemoQtd: TfrxMemoView
          AllowVectorExport = True
          Top = 7.559060000000000000
          Width = 347.716760000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total de chamados: [COUNT(MasterData1)]')
          ParentFont = False
        end
        object MemoTotal: TfrxMemoView
          AllowVectorExport = True
          Left = 699.213050000000000000
          Top = 7.559060000000000000
          Width = 347.716760000000000000
          Height = 22.677180000000000000
          DisplayFormat.FormatStr = '%2.2m'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<Chamados."VALOR_TOTAL">,MasterData1)]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 370.393940000000000000
        Width = 1046.929810000000000000
        object MemoRodape: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'HelpDeskLite - Relat'#243'rio de Chamados')
          ParentFont = False
        end
        object MemoData: TfrxMemoView
          AllowVectorExport = True
          Left = 347.716760000000000000
          Top = 3.779530000000000000
          Width = 347.716760000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Emitido em: [Date]')
          ParentFont = False
        end
        object MemoPagina: TfrxMemoView
          AllowVectorExport = True
          Left = 744.567410000000000000
          Top = 3.779530000000000000
          Width = 302.362400000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'P'#225'gina [Page#]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBChamados: TfrxDBDataset
    UserName = 'Chamados'
    CloseDataSource = False
    DataSet = dmChamado.qryChamados
    BCDToCurrency = False
    DataSetOptions = []
    Left = 984
    Top = 408
  end
end
