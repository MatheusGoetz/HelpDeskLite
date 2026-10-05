unit uFrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, uDMCliente,
  Vcl.ExtCtrls, Vcl.StdCtrls, uFrmClienteCadastro;

type
  TfrmClientes = class(TForm)
    dbgClientes: TDBGrid;
    pnlTop: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnAtualizar: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    procedure AjustarGrid;
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

procedure TfrmClientes.AjustarGrid;
var
  L: Integer;
begin
  if not dmCliente.qryClientes.Active then
    Exit;

  if dbgClientes.Columns.Count = 0 then
    Exit;

  L := dbgClientes.ClientWidth - 35;

  dbgClientes.Columns[0].Visible := False;

  dbgClientes.Columns[1].Width := Round(L * 0.24);
  dbgClientes.Columns[2].Width := Round(L * 0.18);
  dbgClientes.Columns[3].Width := Round(L * 0.24);
  dbgClientes.Columns[4].Width := Round(L * 0.18);
  dbgClientes.Columns[5].Width := Round(L * 0.16);

  dbgClientes.Columns[1].Title.Caption := 'Nome';
  dbgClientes.Columns[2].Title.Caption := 'Documento';
  dbgClientes.Columns[3].Title.Caption := 'E-mail';
  dbgClientes.Columns[4].Title.Caption := 'Telefone';
  dbgClientes.Columns[5].Title.Caption := 'Cadastro';
end;

procedure TfrmClientes.btnEditarClick(Sender: TObject);
var
  IdCliente: integer;
begin
  if dmCliente.qryClientes.IsEmpty then
  begin
    ShowMessage('Selecione um cliente para editar.');
    Exit;
  end;

  IdCliente := dmCliente.qryClientes.FieldByName('ID').AsInteger;

  frmClienteCadastro := TfrmClienteCadastro.Create(Self);

  try
    frmClienteCadastro.EditarCliente(IdCliente);

    if frmClienteCadastro.ShowModal = mrOk then
      dmCliente.qryClientes.Refresh;
  finally
    frmClienteCadastro.Refresh;
  end;
end;

procedure TfrmClientes.btnNovoClick(Sender: TObject);
begin
  frmClienteCadastro := TfrmClienteCadastro.Create(Self);
  try
    frmClienteCadastro.NovoCliente;

    if frmClienteCadastro.ShowModal = mrOk then
      dmCliente.qryClientes.Refresh;
  finally
    frmClienteCadastro.Free;
  end;
end;

procedure TfrmClientes.FormResize(Sender: TObject);
begin
   AjustarGrid;
end;

procedure TfrmClientes.btnExcluirClick(Sender: TObject);
var
  IdCliente: Integer;
  NomeCliente: string;
begin
  if dmCliente.qryClientes.IsEmpty then
  begin
    ShowMessage('Selecione um cliente para excluir.');
    Exit;
  end;

  IdCliente := dmCliente.qryClientes.FieldByName('ID').AsInteger;
  NomeCliente := dmCliente.qryClientes.FieldByName('NOME').AsString;

  if MessageDlg(
    'Deseja realmente excluir o cliente "' +
    NomeCliente + '"?',
    mtConfirmation,
    [mbYes, mbNo],
    0
  ) <> mrYes then
    Exit;

  try
    with dmCliente.qryClienteCRUD do
    begin
      Close;

      SQL.Text :=
        'DELETE FROM CLIENTE ' +
        'WHERE ID = :ID';

      ParamByName('ID').AsInteger := IdCliente;

      ExecSQL;
    end;

    dmCliente.qryClientes.Refresh;

    ShowMessage('Cliente excluído com sucesso.');

  except
    on E: Exception do
      ShowMessage(
        'Não foi possível excluir o cliente.' +
        sLineBreak + sLineBreak +
        E.Message
      );
  end;
end;

end.
