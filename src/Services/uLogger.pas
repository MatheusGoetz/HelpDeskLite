unit uLogger;

interface

uses
  System.SysUtils,
  System.Classes,
  System.IOUtils;

type
  TLogger = class
  public
    class procedure LogError(
      const AOrigem: string;
      const AMensagem: string
    ); static;
  end;

implementation

class procedure TLogger.LogError(
  const AOrigem: string;
  const AMensagem: string);
var
  Arquivo: TextFile;
  PastaLogs: string;
  CaminhoLog: string;
begin
  try
    PastaLogs :=
      TPath.Combine(
        ExtractFilePath(ParamStr(0)),
        'logs'
      );

    if not TDirectory.Exists(PastaLogs) then
      TDirectory.CreateDirectory(PastaLogs);

    CaminhoLog :=
      TPath.Combine(
        PastaLogs,
        'helpdesklite.log'
      );

    AssignFile(Arquivo, CaminhoLog);

    if FileExists(CaminhoLog) then
      Append(Arquivo)
    else
      Rewrite(Arquivo);

    try
      Writeln(
        Arquivo,
        FormatDateTime(
          'dd/mm/yyyy hh:nn:ss',
          Now
        ) +
        ' | ERRO | ' +
        AOrigem +
        ' | ' +
        AMensagem
      );
    finally
      CloseFile(Arquivo);
    end;

  except
    { O logger não deve derrubar a aplicação }
  end;
end;

end.
