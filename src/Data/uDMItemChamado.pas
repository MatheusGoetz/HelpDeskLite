unit uDMItemChamado;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDMConexao;

type
  TdmItemChamado = class(TDataModule)
    qryItensChamado: TFDQuery;
    qryItemCRUD: TFDQuery;
    qryTotalItens: TFDQuery;
    dsItensChamado: TDataSource;
  private
    { Private declarations }
  public
    procedure CarregarItens(AChamadoId: Integer);
    procedure AtualizarTotalChamado(AChamadoId: Integer);
  end;

var
  dmItemChamado: TdmItemChamado;

implementation

{$R *.dfm}

procedure TdmItemChamado.CarregarItens(AChamadoId: Integer);
begin
  qryItensChamado.Close;

  qryItensChamado.ParamByName('CHAMADO_ID').AsInteger :=
    AChamadoId;

  qryItensChamado.Open;
end;

  procedure TdmItemChamado.AtualizarTotalChamado(AChamadoId: Integer);
  var
    Total: Currency;
  begin
    qryTotalItens.Close;
    qryTotalItens.ParamByName('CHAMADO_ID').AsInteger := AChamadoId;
    qryTotalItens.Open;

    Total :=
      qryTotalItens.FieldByName('TOTAL').AsCurrency;

    qryItemCRUD.Close;

    qryItemCRUD.SQL.Text :=
      'UPDATE CHAMADO ' +
      'SET VALOR_TOTAL = :VALOR_TOTAL ' +
      'WHERE ID = :ID';

    qryItemCRUD.ParamByName('VALOR_TOTAL').AsCurrency :=
      Total;

    qryItemCRUD.ParamByName('ID').AsInteger :=
      AChamadoId;

    qryItemCRUD.ExecSQL;
  end;
end.
