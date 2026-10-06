unit uFrmChamadoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, uDMCliente, uDMChamado, uLogger;

type
  TfrmChamadoCadastro = class(TForm)
    lblCliente: TLabel;
    cmbCliente: TComboBox;
    lblDescricao: TLabel;
    memDescricao: TMemo;
    lblDataPrevista: TLabel;
    dtpDataPrevista: TDateTimePicker;
    lblStatus: TLabel;
    cmbStatus: TComboBox;
    lblValorTotal: TLabel;
    edtValorTotal: TEdit;
    btnCancelar: TButton;
    btnSalvar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
  FIdChamado: Integer;

  procedure CarregarClientes;
  procedure SelecionarCliente(AClienteId: Integer);
  public
    procedure NovoChamado;
    procedure EditarChamado(AIdChamado: Integer);
  end;

var
  frmChamadoCadastro: TfrmChamadoCadastro;

implementation

{$R *.dfm}
procedure TfrmChamadoCadastro.NovoChamado;
begin
  FIdChamado := 0;

  edtValorTotal.Text := '0,00';

  Caption := 'Novo Chamado';

  CarregarClientes;

  cmbStatus.ItemIndex := cmbStatus.Items.IndexOf('ABERTO');

  if cmbCliente.Items.Count > 0 then
    cmbCliente.ItemIndex := 0;

  memDescricao.Clear;

  dtpDataPrevista.Date := Date;

  cmbStatus.ItemIndex := 0;

  edtValorTotal.Text := '0';
end;

procedure TfrmChamadoCadastro.SelecionarCliente(AClienteId: Integer);
var
  I: Integer;
begin
  cmbCliente.ItemIndex := -1;

  for I := 0 to cmbCliente.Items.Count - 1 do
  begin
    if Integer(cmbCliente.Items.Objects[I]) = AClienteId then
    begin
      cmbCliente.ItemIndex := I;
      Break;
    end;
  end;
end;

procedure TfrmChamadoCadastro.EditarChamado(AIdChamado: Integer);
begin
  FIdChamado := AIdChamado;

  Caption := 'Editar Chamado';

  CarregarClientes;

  with dmChamado.qryChamado do
  begin
    Close;

    ParamByName('ID').AsInteger := AIdChamado;

    Open;

    if IsEmpty then
    begin
      ShowMessage('Chamado não encontrado.');
      Exit;
    end;

    SelecionarCliente(
      FieldByName('CLIENTE_ID').AsInteger
    );

    memDescricao.Text :=
      FieldByName('DESCRICAO').AsString;

    if not FieldByName('DATA_PREVISTA').IsNull then
      dtpDataPrevista.Date :=
        FieldByName('DATA_PREVISTA').AsDateTime;

    cmbStatus.ItemIndex :=
      cmbStatus.Items.IndexOf(
        FieldByName('STATUS').AsString
      );

    edtValorTotal.Text :=
      FormatFloat(
        '0.00',
        FieldByName('VALOR_TOTAL').AsFloat
      );
  end;
end;

procedure TfrmChamadoCadastro.btnSalvarClick(Sender: TObject);
var
  IdCliente: Integer;
  ValorTotal: Double;
begin
  if cmbCliente.ItemIndex < 0 then
  begin
    ShowMessage('Selecione um cliente.');
    cmbCliente.SetFocus;
    Exit;
  end;

  if Trim(memDescricao.Text) = '' then
  begin
    ShowMessage('Informe a descrição do chamado.');
    memDescricao.SetFocus;
    Exit;
  end;

  if cmbStatus.ItemIndex < 0 then
  begin
    ShowMessage('Selecione o status do chamado.');
    cmbStatus.SetFocus;
    Exit;
  end;

  IdCliente :=
    NativeInt(cmbCliente.Items.Objects[cmbCliente.ItemIndex]);

  ValorTotal :=
    StrToFloatDef(edtValorTotal.Text, 0);

  try
    with dmChamado.qryChamadoCRUD do
    begin
      Close;
      SQL.Clear;

      if FIdChamado = 0 then
      begin
        { NOVO CHAMADO }

        SQL.Text :=
          'INSERT INTO CHAMADO ' +
          '(CLIENTE_ID, DATA_ABERTURA, DATA_PREVISTA, ' +
          'DESCRICAO, STATUS, VALOR_TOTAL) ' +
          'VALUES ' +
          '(:CLIENTE_ID, CURRENT_TIMESTAMP, :DATA_PREVISTA, ' +
          ':DESCRICAO, :STATUS, :VALOR_TOTAL)';

        ParamByName('CLIENTE_ID').AsInteger :=
          IdCliente;

        ParamByName('DATA_PREVISTA').AsDateTime :=
          dtpDataPrevista.Date;

        ParamByName('DESCRICAO').AsString :=
          Trim(memDescricao.Text);

        ParamByName('STATUS').AsString :=
          cmbStatus.Text;

        ParamByName('VALOR_TOTAL').AsFloat :=
          ValorTotal;
      end
      else
      begin
        { EDITAR CHAMADO }

        SQL.Text :=
          'UPDATE CHAMADO SET ' +
          'CLIENTE_ID = :CLIENTE_ID, ' +
          'DATA_PREVISTA = :DATA_PREVISTA, ' +
          'DESCRICAO = :DESCRICAO, ' +
          'STATUS = :STATUS, ' +
          'VALOR_TOTAL = :VALOR_TOTAL ' +
          'WHERE ID = :ID';

        ParamByName('CLIENTE_ID').AsInteger :=
          IdCliente;

        ParamByName('DATA_PREVISTA').AsDateTime :=
          dtpDataPrevista.Date;

        ParamByName('DESCRICAO').AsString :=
          Trim(memDescricao.Text);

        ParamByName('STATUS').AsString :=
          cmbStatus.Text;

        ParamByName('VALOR_TOTAL').AsFloat :=
          ValorTotal;

        ParamByName('ID').AsInteger :=
          FIdChamado;
      end;

      ExecSQL;
    end;

    if FIdChamado = 0 then
      ShowMessage('Chamado criado com sucesso.')
    else
      ShowMessage('Chamado atualizado com sucesso.');

    ModalResult := mrOk;

  except
  on E: Exception do
    begin
      TLogger.LogError(
        'Cadastro de chamado',
        E.Message
      );

      ShowMessage(
        'Não foi possível salvar o chamado.' +
        sLineBreak + sLineBreak +
        E.Message
      );
    end;
  end;
end;

procedure TfrmChamadoCadastro.CarregarClientes;
var
  IdCliente: Integer;
begin
  cmbCliente.Items.Clear;

  with dmCliente.qryClientesCombo do
  begin
    Close;
    Open;

    while not Eof do
    begin
      IdCliente := FieldByName('ID').AsInteger;

      cmbCliente.Items.AddObject(
        FieldByName('NOME').AsString,
        TObject(IdCliente)
      );

      Next;
    end;
  end;
end;

procedure TfrmChamadoCadastro.FormShow(Sender: TObject);
begin
  if cmbCliente.Items.Count = 0 then
    CarregarClientes;
end;

end.
