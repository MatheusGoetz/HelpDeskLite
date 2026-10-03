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
    { Public declarations }
  end;

var
  dmChamado: TdmChamado;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmChamado.DataModuleCreate(Sender: TObject);
begin
  qryChamados.Open;
end;

end.
