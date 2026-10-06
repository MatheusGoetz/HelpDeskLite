unit uDMChamado;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uDMConexao;

type
  TdmChamado = class(TDataModule)
    qryChamados: TFDQuery;
    qryChamado: TFDQuery;
    qryChamadoCRUD: TFDQuery;
    dsChamados: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FiltrarChamados(
      ADataInicial: TDateTime;
      ADataFinal: TDateTime;
      const AStatus: string;
      const ACliente: string
    );
  end;

var
  dmChamado: TdmChamado;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmChamado.FiltrarChamados(
  ADataInicial: TDateTime;
  ADataFinal: TDateTime;
  const AStatus: string;
  const ACliente: string);
begin
  qryChamados.Close;
  qryChamados.SQL.Clear;

  qryChamados.SQL.Add(
    'SELECT ' +
    'C.ID, ' +
    'C.CLIENTE_ID, ' +
    'CL.NOME AS CLIENTE, ' +
    'C.DATA_ABERTURA, ' +
    'C.DATA_FECHAMENTO, ' +
    'C.DATA_PREVISTA, ' +
    'C.DESCRICAO, ' +
    'C.STATUS, ' +
    'C.VALOR_TOTAL ' +
    'FROM CHAMADO C ' +
    'INNER JOIN CLIENTE CL ON CL.ID = C.CLIENTE_ID ' +
    'WHERE C.DATA_ABERTURA >= :DATA_INICIAL ' +
    'AND C.DATA_ABERTURA < :DATA_FINAL'
  );

  if AStatus <> '' then
    qryChamados.SQL.Add(
      'AND C.STATUS = :STATUS'
    );

  if Trim(ACliente) <> '' then
    qryChamados.SQL.Add(
      'AND UPPER(CL.NOME) LIKE :CLIENTE'
    );

  qryChamados.SQL.Add(
    'ORDER BY C.ID DESC'
  );

  qryChamados.ParamByName('DATA_INICIAL').AsDateTime :=
    Trunc(ADataInicial);

  qryChamados.ParamByName('DATA_FINAL').AsDateTime :=
    Trunc(ADataFinal) + 1;

  if AStatus <> '' then
    qryChamados.ParamByName('STATUS').AsString :=
      AStatus;

  if Trim(ACliente) <> '' then
    qryChamados.ParamByName('CLIENTE').AsString :=
      '%' + UpperCase(Trim(ACliente)) + '%';

  qryChamados.Open;
end;

procedure TdmChamado.DataModuleCreate(Sender: TObject);
begin
  qryChamados.Open;
end;

end.
