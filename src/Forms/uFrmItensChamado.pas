unit uFrmItensChamado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, uDMItemChamado, uFrmItemChamadoCadastro, uDMConexao;

type
  TfrmItensChamado = class(TForm)
    pnlTop: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnFechar: TButton;
    dbgItens: TDBGrid;
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    FChamadoId: Integer;
  public
    procedure AbrirChamado(AChamadoId: Integer);
    procedure AjustarGrid;
  end;

var
  frmItensChamado: TfrmItensChamado;

implementation

{$R *.dfm}

procedure TfrmItensChamado.AjustarGrid;
var
  LarguraDisponivel: Integer;
begin
  if not dmItemChamado.qryItensChamado.Active then
    Exit;

  { Oculta campos técnicos }
  dbgItens.Columns[0].Visible := False; // ID
  dbgItens.Columns[1].Visible := False; // CHAMADO_ID

  { Espaço útil do grid }
  LarguraDisponivel := dbgItens.ClientWidth - 35;

  { Distribuição das colunas }
  dbgItens.Columns[2].Width := Round(LarguraDisponivel * 0.50);
  dbgItens.Columns[3].Width := Round(LarguraDisponivel * 0.15);
  dbgItens.Columns[4].Width := Round(LarguraDisponivel * 0.17);
  dbgItens.Columns[5].Width := Round(LarguraDisponivel * 0.18);

  { Títulos }
  dbgItens.Columns[2].Title.Caption := 'Descrição';
  dbgItens.Columns[3].Title.Caption := 'Qtd.';
  dbgItens.Columns[4].Title.Caption := 'Valor Unitário';
  dbgItens.Columns[5].Title.Caption := 'Subtotal';
end;

procedure TfrmItensChamado.AbrirChamado(AChamadoId: Integer);
begin
  FChamadoId := AChamadoId;

  Caption :=
    'Itens do Chamado #' + IntToStr(FChamadoId);

  dmItemChamado.CarregarItens(FChamadoId);

  AjustarGrid;
end;

procedure TfrmItensChamado.btnEditarClick(Sender: TObject);
var
  IdItem: Integer;
begin
  if dmItemChamado.qryItensChamado.IsEmpty then
  begin
    ShowMessage('Selecione um item.');
    Exit;
  end;

  IdItem :=
    dmItemChamado.qryItensChamado
      .FieldByName('ID').AsInteger;

  frmItemChamadoCadastro :=
    TfrmItemChamadoCadastro.Create(Self);

  try
    frmItemChamadoCadastro.EditarItem(
      IdItem,
      FChamadoId
    );

    if frmItemChamadoCadastro.ShowModal = mrOk then
    begin
      dmItemChamado.CarregarItens(FChamadoId);
      AjustarGrid;
    end;

  finally
    frmItemChamadoCadastro.Free;
  end;
end;

procedure TfrmItensChamado.btnExcluirClick(Sender: TObject);
var
  IdItem: Integer;
begin
  if dmItemChamado.qryItensChamado.IsEmpty then
  begin
    ShowMessage('Selecione um item.');
    Exit;
  end;

  IdItem :=
    dmItemChamado.qryItensChamado
      .FieldByName('ID').AsInteger;

  if MessageDlg(
    'Deseja realmente excluir este item?',
    mtConfirmation,
    [mbYes, mbNo],
    0
  ) <> mrYes then
    Exit;

  try
    dmConexao.FDConnection.StartTransaction;

    try
      with dmItemChamado.qryItemCRUD do
      begin
        Close;

        SQL.Text :=
          'DELETE FROM ITEM_CHAMADO ' +
          'WHERE ID = :ID AND CHAMADO_ID = :CHAMADO_ID';

        ParamByName('ID').AsInteger :=
          IdItem;

        ParamByName('CHAMADO_ID').AsInteger :=
          FChamadoId;

        ExecSQL;
      end;

      dmItemChamado.AtualizarTotalChamado(FChamadoId);

      dmConexao.FDConnection.Commit;

    except
      on E: Exception do
      begin
        if dmConexao.FDConnection.InTransaction then
          dmConexao.FDConnection.Rollback;

        raise;
      end;
    end;

    dmItemChamado.CarregarItens(FChamadoId);
    AjustarGrid;

    ShowMessage('Item excluído com sucesso.');

  except
    on E: Exception do
      ShowMessage(
        'Não foi possível excluir o item.' +
        sLineBreak + sLineBreak +
        E.Message
      );
  end;
end;

procedure TfrmItensChamado.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmItensChamado.btnNovoClick(Sender: TObject);
begin
  frmItemChamadoCadastro :=
    TfrmItemChamadoCadastro.Create(Self);

  try
    frmItemChamadoCadastro.NovoItem(FChamadoId);

    if frmItemChamadoCadastro.ShowModal = mrOk then
    begin
      dmItemChamado.CarregarItens(FChamadoId);
    end;

  finally
    frmItemChamadoCadastro.Free;
  end;
end;

procedure TfrmItensChamado.FormResize(Sender: TObject);
begin
  AjustarGrid;
end;

end.
