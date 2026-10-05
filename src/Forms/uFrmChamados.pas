unit uFrmChamados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, uDMConexao, uDMChamado, uFrmChamadoCadastro, uFrmItensChamado;

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
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnItensClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    procedure AjustarGrid;
  public
    { Public declarations }
  end;

var
  frmChamados: TfrmChamados;

implementation

{$R *.dfm}

procedure TfrmChamados.AjustarGrid;
var
  L: Integer;
begin
  if not dmChamado.qryChamados.Active then
    Exit;

  if dbgChamados.Columns.Count = 0 then
    Exit;

  L := dbgChamados.ClientWidth - 35;

  dbgChamados.Columns[0].Width := Round(L * 0.06); // ID

  dbgChamados.Columns[1].Visible := False; // CLIENTE_ID

  dbgChamados.Columns[2].Width := Round(L * 0.18); // CLIENTE
  dbgChamados.Columns[3].Width := Round(L * 0.13); // DATA_ABERTURA

  dbgChamados.Columns[4].Visible := False; // DATA_FECHAMENTO

  dbgChamados.Columns[5].Width := Round(L * 0.13); // DATA_PREVISTA
  dbgChamados.Columns[6].Width := Round(L * 0.27); // DESCRICAO
  dbgChamados.Columns[7].Width := Round(L * 0.12); // STATUS
  dbgChamados.Columns[8].Width := Round(L * 0.11); // VALOR_TOTAL

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

procedure TfrmChamados.FormResize(Sender: TObject);
begin
  AjustarGrid;
end;

end.
