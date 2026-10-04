unit uFrmItemChamadoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uDMConexao, uDMItemChamado;

type
  TfrmItemChamadoCadastro = class(TForm)
    lblDescricao: TLabel;
    edtDescricao: TEdit;
    lblQuantidade: TLabel;
    edtQuantidade: TEdit;
    lblValorUnitario: TLabel;
    edtValorUnitario: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    FChamadoId: Integer;
  public
    procedure NovoItem(AChamadoId: Integer);
  end;

var
  frmItemChamadoCadastro: TfrmItemChamadoCadastro;

implementation

{$R *.dfm}

procedure TfrmItemChamadoCadastro.btnSalvarClick(Sender: TObject);
var
  Quantidade: Integer;
  ValorUnitario: Currency;
begin
  if Trim(edtDescricao.Text) = '' then
  begin
    ShowMessage('Informe a descrição do item.');
    edtDescricao.SetFocus;
    Exit;
  end;

  if not TryStrToInt(edtQuantidade.Text, Quantidade) then
  begin
    ShowMessage('Informe uma quantidade válida.');
    edtQuantidade.SetFocus;
    Exit;
  end;

  if Quantidade <= 0 then
  begin
    ShowMessage('A quantidade deve ser maior que zero.');
    edtQuantidade.SetFocus;
    Exit;
  end;

  if not TryStrToCurr(edtValorUnitario.Text, ValorUnitario) then
  begin
    ShowMessage('Informe um valor unitário válido.');
    edtValorUnitario.SetFocus;
    Exit;
  end;

  if ValorUnitario < 0 then
  begin
    ShowMessage('O valor unitário não pode ser negativo.');
    edtValorUnitario.SetFocus;
    Exit;
  end;

  try
    dmConexao.FDConnection.StartTransaction;

    try
      with dmItemChamado.qryItemCRUD do
      begin
        Close;

        SQL.Text :=
          'INSERT INTO ITEM_CHAMADO ' +
          '(CHAMADO_ID, DESCRICAO, QUANTIDADE, VALOR_UNITARIO) ' +
          'VALUES ' +
          '(:CHAMADO_ID, :DESCRICAO, :QUANTIDADE, :VALOR_UNITARIO)';

        ParamByName('CHAMADO_ID').AsInteger :=
          FChamadoId;

        ParamByName('DESCRICAO').AsString :=
          Trim(edtDescricao.Text);

        ParamByName('QUANTIDADE').AsInteger :=
          Quantidade;

        ParamByName('VALOR_UNITARIO').AsCurrency :=
          ValorUnitario;

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

    ShowMessage('Item adicionado com sucesso.');

    ModalResult := mrOk;

  except
    on E: Exception do
      ShowMessage(
        'Não foi possível adicionar o item.' +
        sLineBreak +
        sLineBreak +
        E.Message
      );
  end;
end;

procedure TfrmItemChamadoCadastro.NovoItem(AChamadoId: Integer);
begin
  FChamadoId := AChamadoId;

  Caption := 'Novo Item';

  edtDescricao.Clear;
  edtQuantidade.Text := '1';
  edtValorUnitario.Text := '0';
end;

procedure TfrmItemChamadoCadastro.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.
