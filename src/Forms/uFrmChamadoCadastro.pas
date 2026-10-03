unit uFrmChamadoCadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, uDMCliente, uDMChamado;

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
  procedure CarregarClientes;
  public
    { Public declarations }
  end;

var
  frmChamadoCadastro: TfrmChamadoCadastro;

implementation

{$R *.dfm}
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
    Integer(cmbCliente.Items.Objects[cmbCliente.ItemIndex]);

  ValorTotal :=
    StrToFloatDef(edtValorTotal.Text, 0);

  try
    with dmChamado.qryChamadoCRUD do
    begin
      Close;

      SQL.Text :=
        'INSERT INTO CHAMADO ' +
        '(CLIENTE_ID, DATA_ABERTURA, DATA_PREVISTA, ' +
        'DESCRICAO, STATUS, VALOR_TOTAL) ' +
        'VALUES ' +
        '(:CLIENTE_ID, CURRENT_TIMESTAMP, :DATA_PREVISTA, ' +
        ':DESCRICAO, :STATUS, :VALOR_TOTAL)';

      ParamByName('CLIENTE_ID').AsInteger :=
        IdCliente;

      ParamByName('DATA_PREVISTA').AsDate :=
        dtpDataPrevista.Date;

      ParamByName('DESCRICAO').AsString :=
        Trim(memDescricao.Text);

      ParamByName('STATUS').AsString :=
        cmbStatus.Text;

      ParamByName('VALOR_TOTAL').AsFloat :=
        ValorTotal;

      ExecSQL;
    end;

    ShowMessage('Chamado criado com sucesso.');

    ModalResult := mrOk;

  except
    on E: Exception do
      ShowMessage(
        'Não foi possível salvar o chamado.' +
        sLineBreak + sLineBreak +
        E.Message
      );
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
  CarregarClientes;

  if cmbCliente.Items.Count > 0 then
    cmbCliente.ItemIndex := 0;

  if cmbStatus.Items.Count > 0 then
    cmbStatus.ItemIndex := 0;
end;

end.
