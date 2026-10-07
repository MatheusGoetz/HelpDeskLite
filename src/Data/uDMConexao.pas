unit uDMConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef, FireDAC.Phys.IBBase, FireDAC.Phys.FB, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TdmConexao = class(TDataModule)
    FDConnection: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmConexao.DataModuleCreate(Sender: TObject);
var
  PastaExe: string;
  CaminhoBanco: string;
begin
  FDConnection.Connected := False;

  PastaExe := IncludeTrailingPathDelimiter(
    ExtractFilePath(ParamStr(0))
  );

  { Caso final:
    HelpDeskLite\bin\HelpDeskLite.exe
    HelpDeskLite\database\HELPDESKLITE.FDB
  }
  CaminhoBanco := ExpandFileName(
    PastaExe + '..\database\HELPDESKLITE.FDB'
  );

  { Caso Debug atual:
    HelpDeskLite\src\.bin\HelpDeskLite.exe
    HelpDeskLite\database\HELPDESKLITE.FDB
  }
  if not FileExists(CaminhoBanco) then
  begin
    CaminhoBanco := ExpandFileName(
      PastaExe + '..\..\database\HELPDESKLITE.FDB'
    );
  end;

  { Caso o executável esteja diretamente na raiz }
  if not FileExists(CaminhoBanco) then
  begin
    CaminhoBanco := ExpandFileName(
      PastaExe + 'database\HELPDESKLITE.FDB'
    );
  end;

  if not FileExists(CaminhoBanco) then
  begin
    raise Exception.Create(
      'Banco de dados não encontrado.' +
      sLineBreak + sLineBreak +
      'Verifique se existe o arquivo:' +
      sLineBreak +
      'database\HELPDESKLITE.FDB'
    );
  end;

  FDConnection.Close;
  FDConnection.Params.Clear;

  FDConnection.Params.Values['DriverID'] := 'FB';
  FDConnection.Params.Values['Server'] := '127.0.0.1';
  FDConnection.Params.Values['Protocol'] := 'TCPIP';
  FDConnection.Params.Values['Database'] := CaminhoBanco;
  FDConnection.Params.Values['User_Name'] := 'SYSDBA';
  FDConnection.Params.Values['Password'] := 'masterkey';

  FDConnection.LoginPrompt := False;

  try
    FDConnection.Connected := True;
  except
    on E: Exception do
    begin
      raise Exception.Create(
        'Não foi possível conectar ao banco de dados.' +
        sLineBreak + sLineBreak +
        'Banco utilizado:' +
        sLineBreak +
        CaminhoBanco +
        sLineBreak + sLineBreak +
        'Detalhes:' +
        sLineBreak +
        E.Message
      );
    end;
  end;
end;

end.
