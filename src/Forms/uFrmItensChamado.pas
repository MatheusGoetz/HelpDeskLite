unit uFrmItensChamado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, uDMItemChamado;

type
  TfrmItensChamado = class(TForm)
    pnlTop: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnFechar: TButton;
    dbgItens: TDBGrid;
    procedure btnFecharClick(Sender: TObject);
  private
    FChamadoId: Integer;
  public
    procedure AbrirChamado(AChamadoId: Integer);
  end;

var
  frmItensChamado: TfrmItensChamado;

implementation

{$R *.dfm}

procedure TfrmItensChamado.AbrirChamado(AChamadoId: Integer);
begin
  FChamadoId := AChamadoId;

  ShowMessage(
    'Chamado recebido: ' + IntToStr(FChamadoId)
  );

  Caption :=
    'Itens do Chamado #' + IntToStr(FChamadoId);

  dmItemChamado.CarregarItens(FChamadoId);
end;

procedure TfrmItensChamado.btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
