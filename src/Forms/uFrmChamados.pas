unit uFrmChamados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, uDMConexao, uDMChamado, uFrmChamadoCadastro, uFrmItensChamado,
  frxSmartMemo, frCoreClasses, frxClass, frxDBSet, Vcl.ComCtrls, System.DateUtils, uChamadoService;

type
  TfrmChamados = class(TForm)
    pnlTop: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnAtualizar: TButton;
    dbgChamados: TDBGrid;
    pnlDown: TPanel;
    btnItens: TButton;
    btnRelatorio: TButton;
    frxReportChamados: TfrxReport;
    frxDBChamados: TfrxDBDataset;
    lblDataInicial: TLabel;
    dtpDataInicial: TDateTimePicker;
    lblDataFinal: TLabel;
    dtpDataFinal: TDateTimePicker;
    lblFiltroStatus: TLabel;
    cmbFiltroStatus: TComboBox;
    lblFiltroCliente: TLabel;
    edtFiltroCliente: TEdit;
    btnFiltrar: TButton;
    btnLimparFiltro: TButton;
    lblTotalAbertos: TLabel;
    lblTotalAndamento: TLabel;
    lblTotalConcluidos: TLabel;
    lblTotalAtrasados: TLabel;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnItensClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnLimparFiltroClick(Sender: TObject);
    procedure btnFiltrarClick(Sender: TObject);
    procedure dbgChamadosDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure AjustarGrid;
    procedure AtualizarIndicadores;
  public
    { Public declarations }
  end;

var
  frmChamados: TfrmChamados;

implementation

{$R *.dfm}

procedure TfrmChamados.AtualizarIndicadores;
var
  TotalAbertos: Integer;
  TotalAndamento: Integer;
  TotalConcluidos: Integer;
  TotalAtrasados: Integer;
  Status: string;
  DataPrevista: TDateTime;
begin
  TotalAbertos := 0;
  TotalAndamento := 0;
  TotalConcluidos := 0;
  TotalAtrasados := 0;

  if not dmChamado.qryChamados.Active then
    Exit;

  dmChamado.qryChamados.DisableControls;

  try
    dmChamado.qryChamados.First;

    while not dmChamado.qryChamados.Eof do
    begin
      Status :=
        dmChamado.qryChamados
          .FieldByName('STATUS').AsString;

      if SameText(Status, 'ABERTO') then
        Inc(TotalAbertos)
      else if SameText(Status, 'EM_ANDAMENTO') then
        Inc(TotalAndamento)
      else if SameText(Status, 'CONCLUIDO') then
        Inc(TotalConcluidos);

      if not dmChamado.qryChamados
        .FieldByName('DATA_PREVISTA').IsNull then
      begin
        DataPrevista :=
          dmChamado.qryChamados
            .FieldByName('DATA_PREVISTA').AsDateTime;

        if TChamadoService.EstaAtrasado(
          DataPrevista,
          Status
        ) then
          Inc(TotalAtrasados);
      end;

      dmChamado.qryChamados.Next;
    end;

    dmChamado.qryChamados.First;

  finally
    dmChamado.qryChamados.EnableControls;
  end;

  lblTotalAbertos.Caption :=
    'Abertos: ' + IntToStr(TotalAbertos);

  lblTotalAndamento.Caption :=
    'Em andamento: ' + IntToStr(TotalAndamento);

  lblTotalConcluidos.Caption :=
    'Concluídos: ' + IntToStr(TotalConcluidos);

  lblTotalAtrasados.Caption :=
    'Em atraso: ' + IntToStr(TotalAtrasados);
end;

procedure TfrmChamados.AjustarGrid;
var
  L: Integer;
begin
  if not dmChamado.qryChamados.Active then
    Exit;

  if dbgChamados.Columns.Count = 0 then
    Exit;

  L := dbgChamados.ClientWidth - 35;

  dbgChamados.Columns[0].Width := Round(L * 0.06);

  dbgChamados.Columns[1].Visible := False;

  dbgChamados.Columns[2].Width := Round(L * 0.18);
  dbgChamados.Columns[3].Width := Round(L * 0.13);

  dbgChamados.Columns[4].Visible := False;

  dbgChamados.Columns[5].Width := Round(L * 0.13);
  dbgChamados.Columns[6].Width := Round(L * 0.27);
  dbgChamados.Columns[7].Width := Round(L * 0.12);
  dbgChamados.Columns[8].Width := Round(L * 0.11);

  dbgChamados.Columns[0].Title.Caption := 'ID';
  dbgChamados.Columns[2].Title.Caption := 'Cliente';
  dbgChamados.Columns[3].Title.Caption := 'Abertura';
  dbgChamados.Columns[5].Title.Caption := 'Prevista';
  dbgChamados.Columns[6].Title.Caption := 'Descrição';
  dbgChamados.Columns[7].Title.Caption := 'Status';
  dbgChamados.Columns[8].Title.Caption := 'Valor Total';
end;

procedure TfrmChamados.btnEditarClick(Sender: TObject);
var
  IdChamado: Integer;
begin
  if dmChamado.qryChamados.IsEmpty then
  begin
    ShowMessage('Nenhum chamado selecionado.');
    Exit;
  end;

  IdChamado :=
    dmChamado.qryChamados.FieldByName('ID').AsInteger;

  frmChamadoCadastro :=
    TfrmChamadoCadastro.Create(Self);

  try
    frmChamadoCadastro.EditarChamado(IdChamado);

    if frmChamadoCadastro.ShowModal = mrOk then
    begin
      dmChamado.qryChamados.Close;
      dmChamado.qryChamados.Open;

      AjustarGrid;
    end;
  finally
    frmChamadoCadastro.Free;
  end;
end;

procedure TfrmChamados.btnExcluirClick(Sender: TObject);
var
  IdChamado: Integer;
begin
  if not dmChamado.qryChamados.Active then
  begin
    ShowMessage('A lista de chamados não está disponível.');
    Exit;
  end;

  if dmChamado.qryChamados.IsEmpty then
  begin
    ShowMessage('Nenhum chamado selecionado.');
    Exit;
  end;

  IdChamado :=
    dmChamado.qryChamados.FieldByName('ID').AsInteger;

  if MessageDlg(
    'Deseja realmente excluir o chamado #' +
    IntToStr(IdChamado) + '?',
    mtConfirmation,
    [mbYes, mbNo],
    0
  ) <> mrYes then
    Exit;

  try
    dmConexao.FDConnection.StartTransaction;

    try
      { Excluir itens vinculados ao chamado }
      with dmChamado.qryChamadoCRUD do
      begin
        Close;
        SQL.Text :=
          'DELETE FROM ITEM_CHAMADO ' +
          'WHERE CHAMADO_ID = :CHAMADO_ID';

        ParamByName('CHAMADO_ID').AsInteger :=
          IdChamado;

        ExecSQL;
      end;

      { Excluir histórico de status }
      with dmChamado.qryChamadoCRUD do
      begin
        Close;
        SQL.Text :=
          'DELETE FROM STATUS_LOG ' +
          'WHERE CHAMADO_ID = :CHAMADO_ID';

        ParamByName('CHAMADO_ID').AsInteger :=
          IdChamado;

        ExecSQL;
      end;

      { Finalmente excluir o chamado }
      with dmChamado.qryChamadoCRUD do
      begin
        Close;
        SQL.Text :=
          'DELETE FROM CHAMADO ' +
          'WHERE ID = :ID';

        ParamByName('ID').AsInteger :=
          IdChamado;

        ExecSQL;
      end;

      dmConexao.FDConnection.Commit;

      ShowMessage('Chamado excluído com sucesso.');

    except
      on E: Exception do
      begin
        if dmConexao.FDConnection.InTransaction then
          dmConexao.FDConnection.Rollback;

        ShowMessage(
          'Não foi possível excluir o chamado.' +
          sLineBreak +
          sLineBreak +
          E.Message
        );

        Exit;
      end;
    end;

    dmChamado.qryChamados.Close;
    dmChamado.qryChamados.Open;
    AjustarGrid;

  except
    on E: Exception do
      ShowMessage(
        'Erro ao excluir o chamado.' +
        sLineBreak +
        sLineBreak +
        E.Message
      );
  end;
end;

procedure TfrmChamados.btnFiltrarClick(Sender: TObject);
var
  StatusFiltro: string;
begin
  if dtpDataInicial.Date > dtpDataFinal.Date then
  begin
    ShowMessage(
      'A data inicial não pode ser maior que a data final.'
    );

    dtpDataInicial.SetFocus;
    Exit;
  end;

  if cmbFiltroStatus.ItemIndex <= 0 then
    StatusFiltro := ''
  else
    StatusFiltro := cmbFiltroStatus.Text;

  dmChamado.FiltrarChamados(
    dtpDataInicial.Date,
    dtpDataFinal.Date,
    StatusFiltro,
    edtFiltroCliente.Text
  );

  AtualizarIndicadores;
  AjustarGrid;
end;

procedure TfrmChamados.btnItensClick(Sender: TObject);
var
  IdChamado: Integer;
begin
  if dmChamado.qryChamados.IsEmpty then
  begin
    ShowMessage('Selecione um chamado.');
    Exit;
  end;

  IdChamado :=
    dmChamado.qryChamados.FieldByName('ID').AsInteger;

  frmItensChamado :=
    TfrmItensChamado.Create(Self);

  try
    frmItensChamado.AbrirChamado(IdChamado);
    frmItensChamado.ShowModal;
  finally
    frmItensChamado.Free;
  end;

  dmChamado.qryChamados.Close;
  dmChamado.qryChamados.Open;
  AjustarGrid;
end;

procedure TfrmChamados.btnLimparFiltroClick(Sender: TObject);
begin
  dtpDataInicial.Date :=
    StartOfTheMonth(Date);

  dtpDataFinal.Date :=
    Date;

  cmbFiltroStatus.ItemIndex := 0;

  edtFiltroCliente.Clear;

  dmChamado.FiltrarChamados(
    dtpDataInicial.Date,
    dtpDataFinal.Date,
    '',
    ''
  );

  AjustarGrid;
end;

procedure TfrmChamados.btnNovoClick(Sender: TObject);
begin
  frmChamadoCadastro := TfrmChamadoCadastro.Create(Self);

  try
    frmChamadoCadastro.NovoChamado;

    if frmChamadoCadastro.ShowModal = mrOk then
    begin
      dmChamado.qryChamados.Close;
      dmChamado.qryChamados.Open;

      AjustarGrid;
    end;
  finally
    frmChamadoCadastro.Free;
  end;
end;

procedure TfrmChamados.btnRelatorioClick(Sender: TObject);
begin
  if not dmChamado.qryChamados.Active then
    dmChamado.qryChamados.Open;

  frxReportChamados.ShowReport;
end;

procedure TfrmChamados.dbgChamadosDrawColumnCell(
  Sender: TObject;
  const Rect: TRect;
  DataCol: Integer;
  Column: TColumn;
  State: TGridDrawState);
var
  Status: string;
  DataPrevista: TDateTime;
  Atrasado: Boolean;
begin
  Atrasado := False;

  if dmChamado.qryChamados.Active and
     (not dmChamado.qryChamados.IsEmpty) then
  begin
    Status :=
      dmChamado.qryChamados
        .FieldByName('STATUS').AsString;

    if not dmChamado.qryChamados
      .FieldByName('DATA_PREVISTA').IsNull then
    begin
      DataPrevista :=
        dmChamado.qryChamados
          .FieldByName('DATA_PREVISTA').AsDateTime;

      Atrasado :=
        TChamadoService.EstaAtrasado(
          DataPrevista,
          Status
        );
    end;
  end;

  if Atrasado and not (gdSelected in State) then
  begin
    dbgChamados.Canvas.Brush.Color :=
      RGB(255, 225, 225);

    dbgChamados.Canvas.Font.Color :=
      clRed;
  end;

  dbgChamados.DefaultDrawColumnCell(
    Rect,
    DataCol,
    Column,
    State
  );
end;

procedure TfrmChamados.FormResize(Sender: TObject);
begin
  AtualizarIndicadores;
  AjustarGrid;
end;

procedure TfrmChamados.FormShow(Sender: TObject);
begin
  dtpDataInicial.Date := StartOfTheMonth(Date);
  dtpDataFinal.Date := Date;

  cmbFiltroStatus.ItemIndex := 0;

  dmChamado.FiltrarChamados(
    dtpDataInicial.Date,
    dtpDataFinal.Date,
    '',
    ''
  );

  AtualizarIndicadores;
  AjustarGrid;
end;

end.
