unit uFrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, uDMCliente,
  Vcl.ExtCtrls, Vcl.StdCtrls, uFrmClienteCadastro;

type
  TfrmClientes = class(TForm)
    DBGrid1: TDBGrid;
    pnlTop: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    Button2: TButton;
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

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
