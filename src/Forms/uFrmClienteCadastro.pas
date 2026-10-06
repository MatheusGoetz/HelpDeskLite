unit uFrmClienteCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, uDMCliente, uLogger;

type
  TfrmClienteCadastro = class(TForm)
    btnSalvar: TButton;
    btnCancelar: TButton;
    edtNome: TEdit;
    edtDocumento: TEdit;
    edtEmail: TEdit;
    edtTelefone: TEdit;
    lblTelefone: TLabel;
    lblEmail: TLabel;
    lblDocumento: TLabel;
    lblNome: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edtTelefoneChange(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    fIDCliente: integer;
  public
    { Public declarations }
    procedure NovoCliente;
    procedure EditarCliente(AId: integer);
  end;

var
  frmClienteCadastro: TfrmClienteCadastro;

implementation

{$R *.dfm}

procedure TfrmClienteCadastro.NovoCliente;
begin
  FIDCliente := 0;

  Caption := 'Novo CLiente';

  edtNome.Clear;
  edtDocumento.Clear;
  edtEmail.Clear;
  edtTelefone.Clear;
end;

procedure TfrmClienteCadastro.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtNome.Text) = '' then
  begin
    ShowMessage('Informe o nome do cliente.');
    edtNome.SetFocus;
    Exit;
  end;

  if Trim(edtDocumento.Text) = '' then
  begin
    ShowMessage('Informe o documento do cliente.');
    edtDocumento.SetFocus;
    Exit;
  end;

  try
    with dmCliente.qryClienteCRUD do
    begin
      Close;

      if FIdCliente = 0 then
      begin
        SQL.Text :=
          'INSERT INTO CLIENTE ' +
          '(NOME, DOCUMENTO, EMAIL, TELEFONE, DATA_CADASTRO) ' +
          'VALUES ' +
          '(:NOME, :DOCUMENTO, :EMAIL, :TELEFONE, CURRENT_TIMESTAMP)';

        ParamByName('NOME').AsString :=
          Trim(edtNome.Text);

        ParamByName('DOCUMENTO').AsString :=
          Trim(edtDocumento.Text);

        ParamByName('EMAIL').AsString :=
          Trim(edtEmail.Text);

        ParamByName('TELEFONE').AsString :=
          Trim(edtTelefone.Text);

        ExecSQL;
      end
      else
      begin
        SQL.Text :=
          'UPDATE CLIENTE SET ' +
          'NOME = :NOME, ' +
          'DOCUMENTO = :DOCUMENTO, ' +
          'EMAIL = :EMAIL, ' +
          'TELEFONE = :TELEFONE ' +
          'WHERE ID = :ID';

        ParamByName('NOME').AsString :=
          Trim(edtNome.Text);

        ParamByName('DOCUMENTO').AsString :=
          Trim(edtDocumento.Text);

        ParamByName('EMAIL').AsString :=
          Trim(edtEmail.Text);

        ParamByName('TELEFONE').AsString :=
          Trim(edtTelefone.Text);

        ParamByName('ID').AsInteger :=
          FIdCliente;

        ExecSQL;
      end;
    end;

    ModalResult := mrOk;

  except
    on E: Exception do
    begin
      TLogger.LogError('Cadastro de cliente', E.Message);

      ShowMessage(
        'Não foi possível salvar o chamado.' +
        sLineBreak + sLineBreak +
        E.Message
      );
    end;
  end;
end;

procedure TfrmClienteCadastro.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmClienteCadastro.EditarCliente(AId: Integer);
begin
  FIdCliente := AId;

  Caption := 'Editar Cliente';

  with dmCliente.qryCliente do
  begin
    Close;

    SQL.Text :=
      'SELECT ID, NOME, DOCUMENTO, EMAIL, TELEFONE ' +
      'FROM CLIENTE ' +
      'WHERE ID = :ID';

    ParamByName('ID').AsInteger := AId;

    Open;

    if not IsEmpty then
    begin
      edtNome.Text := FieldByName('NOME').AsString;
      edtDocumento.Text := FieldByName('DOCUMENTO').AsString;
      edtEmail.Text := FieldByName('EMAIL').AsString;
      edtTelefone.Text := FieldByName('TELEFONE').AsString;
    end;
  end;
end;

procedure TfrmClienteCadastro.FormCreate(Sender: TObject);
begin
  // Inicialização do formulário
end;

procedure TfrmClienteCadastro.edtTelefoneChange(Sender: TObject);
begin
  // Evento executado quando o telefone é alterado
end;

end.
