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
    Color = 3877150
    ParentBackground = False
    TabOrder = 0
    object lblDataInicial: TLabel
      Left = 424
      Top = 0
      Width = 61
      Height = 15
      Caption = 'Data inicial:'
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lblDataFinal: TLabel
      Left = 520
      Top = 0
      Width = 53
      Height = 15
      Caption = 'Data final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblFiltroStatus: TLabel
      Left = 598
      Top = 0
      Width = 35
      Height = 15
      Caption = 'Status:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lblFiltroCliente: TLabel
      Left = 749
      Top = 0
      Width = 40
      Height = 15
      Caption = 'Cliente:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
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
      Left = 523
      Top = 6
      Width = 53
      Height = 15
      Caption = 'Abertos: 0'
    end
    object lblTotalAndamento: TLabel
      Left = 592
      Top = 6
      Width = 93
      Height = 15
      Caption = 'Em andamento: 0'
    end
    object lblTotalConcluidos: TLabel
      Left = 691
      Top = 6
      Width = 72
      Height = 15
      Caption = 'Conclu'#237'dos: 0'
    end
    object lblTotalAtrasados: TLabel
      Left = 774
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
    ReportOptions.CreateDate = 46301.769471284700000000
    ReportOptions.Description.Strings = (
      'Relat'#195#179'rio de Chamados - HelpDeskLite')
    ReportOptions.LastChange = 46301.851876724540000000
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
    Variables = <
      item
        Name = ' Filtros'
        Value = Null
      end
      item
        Name = 'DATA_INICIAL'
        Value = #39#39
      end
      item
        Name = 'DATA_FINAL'
        Value = #39#39
      end
      item
        Name = 'STATUS_FILTRO'
        Value = #39#39
      end
      item
        Name = 'CLIENTE_FILTRO'
        Value = #39#39
      end>
    Style = <>
    Watermarks = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
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
        Height = 102.047310000000000000
        Top = 18.897650000000000000
        Width = 755.906000000000000000
        object MemoTitulo: TfrxMemoView
          AllowVectorExport = True
          Left = 1.330550000000000000
          Top = 7.559060000000000000
          Width = 752.126470000000000000
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
          Left = 1.330550000000000000
          Top = 37.795300000000000000
          Width = 752.126470000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
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
        object MemoFiltros1: TfrxMemoView
          AllowVectorExport = True
          Left = 1.330550000000000000
          Top = 64.252010000000000000
          Width = 752.126470000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Per'#237'odo: [DATA_INICIAL] at'#233' [DATA_FINAL]')
          ParentFont = False
        end
        object MemoFiltros2: TfrxMemoView
          AllowVectorExport = True
          Left = 1.330550000000000000
          Top = 83.149660000000000000
          Width = 752.126470000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Status: [STATUS_FILTRO]    Cliente: [CLIENTE_FILTRO]')
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
        Top = 143.622140000000000000
        Width = 755.906000000000000000
        object HdrID: TfrxMemoView
          AllowVectorExport = True
          Width = 45.354360000000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
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
          Width = 207.874150000000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            ' Cliente')
          ParentFont = False
          VAlign = vaCenter
        end
        object HdrAbertura: TfrxMemoView
          AllowVectorExport = True
          Left = 253.228510000000000000
          Width = 113.385900000000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            ' Abertura')
          ParentFont = False
          VAlign = vaCenter
        end
        object HdrPrevista: TfrxMemoView
          AllowVectorExport = True
          Left = 366.614410000000000000
          Width = 124.724490000000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            ' Prevista')
          ParentFont = False
          VAlign = vaCenter
        end
        object HdrStatus: TfrxMemoView
          AllowVectorExport = True
          Left = 491.338900000000000000
          Width = 132.283550000000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            ' Status')
          ParentFont = False
          VAlign = vaCenter
        end
        object HdrValor: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622035040000000000
          Width = 279.685220000000000000
          Height = 26.456710000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            ' Valor Total')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 230.551330000000000000
        Width = 755.906000000000000000
        KeepWithData = False
        Condition = 'Chamados."STATUS"'
        KeepTogether = True
        object MemoGrupoStatus: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 1046.929810000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Status: [Chamados."STATUS"]')
          ParentFont = False
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
        Top = 283.464750000000000000
        Width = 755.906000000000000000
        DataSet = frxDBChamados
        DataSetName = 'Chamados'
        RowCount = 0
        Stretched = True
        object FldID: TfrxMemoView
          AllowVectorExport = True
          Width = 45.354360000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
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
          Width = 207.874150000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            ' [Chamados."CLIENTE"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object FldAbertura: TfrxMemoView
          AllowVectorExport = True
          Left = 253.228510000000000000
          Width = 113.385900000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            ' [Chamados."DATA_ABERTURA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object FldPrevista: TfrxMemoView
          AllowVectorExport = True
          Left = 366.614410000000000000
          Width = 124.724490000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            ' [Chamados."DATA_PREVISTA"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object FldStatus: TfrxMemoView
          AllowVectorExport = True
          Left = 491.338900000000000000
          Width = 132.283550000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            ' [Chamados."STATUS"]')
          ParentFont = False
          VAlign = vaCenter
        end
        object FldValor: TfrxMemoView
          AllowVectorExport = True
          Left = 623.622083860000000000
          Width = 253.228510000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftLeft, ftRight, ftTop, ftBottom]
          Memo.UTF8W = (
            ' [Chamados."VALOR_TOTAL"]')
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
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 362.834880000000000000
        Width = 755.906000000000000000
        KeepWithData = False
        object MemoQtdGrupo: TfrxMemoView
          AllowVectorExport = True
          Left = 4.000000000000000000
          Top = 7.559060000000000000
          Width = 347.716760000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade no status: [COUNT(MasterData1)]')
          ParentFont = False
        end
        object MemoSubtotalGrupo: TfrxMemoView
          AllowVectorExport = True
          Left = 585.826770000000000000
          Top = 7.559060000000000000
          Width = 461.103040000000000000
          Height = 22.677180000000000000
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -10
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
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
        Height = 56.692950000000000000
        Top = 461.102660000000000000
        Width = 755.906000000000000000
        object MemoResumoTitulo: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 3.779530000000000000
          Width = 1024.252630000000000000
          Height = 18.897650000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL GERAL')
          ParentFont = False
        end
        object MemoQtd: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 26.456710000000000000
          Width = 325.039580000000000000
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
          Left = 585.826770000000000000
          Top = 26.456710000000000000
          Width = 461.103040000000000000
          Height = 22.677180000000000000
          ContentScaleOptions.Constraints.MaxIterationValue = 0
          ContentScaleOptions.Constraints.MinIterationValue = 0
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
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
        Top = 540.472790000000000000
        Width = 755.906000000000000000
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Emitido em: [Date] [Time]')
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
    FieldDefs = <
      item
        FieldName = 'ID'
      end
      item
        FieldName = 'CLIENTE_ID'
      end
      item
        FieldName = 'CLIENTE'
        FieldType = fftString
        Size = 120
      end
      item
        FieldName = 'DATA_ABERTURA'
      end
      item
        FieldName = 'DATA_FECHAMENTO'
      end
      item
        FieldName = 'DATA_PREVISTA'
      end
      item
        FieldName = 'DESCRICAO'
        FieldType = fftString
        Size = 500
      end
      item
        FieldName = 'STATUS'
        FieldType = fftString
        Size = 20
      end
      item
        FieldName = 'VALOR_TOTAL'
      end>
  end
  object frxPDFExportChamados: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    PDFColorSpace = csDeviceRGB
    Left = 984
    Top = 360
  end
  object dlgSalvarPDF: TSaveDialog
    DefaultExt = 'pdf'
    Filter = 'Arquivo PDF (*.pdf)|*.pdf'
    Left = 984
    Top = 320
  end
end
