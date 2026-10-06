unit uChamadoService;

interface

type
  TChamadoService = class
  public
    class function EstaAtrasado(
      ADataPrevista: TDateTime;
      const AStatus: string
    ): Boolean; static;
  end;

implementation

uses
  System.SysUtils,
  System.DateUtils;

class function TChamadoService.EstaAtrasado(
  ADataPrevista: TDateTime;
  const AStatus: string): Boolean;
begin
  Result :=
    (ADataPrevista > 0) and
    (Date > Trunc(ADataPrevista)) and
    (not SameText(AStatus, 'CONCLUIDO')) and
    (not SameText(AStatus, 'CANCELADO'));
end;

end.
