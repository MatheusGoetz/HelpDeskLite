unit uFrmChamados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, uDMChamado, uFrmChamadoCadastro;

type
  TfrmChamados = class(TForm)
    pnlTop: TPanel;
    btnNovo: TButton;
    btnEditar: TButton;
    btnExcluir: TButton;
    btnAtualizar: TButton;
    dbgChamados: TDBGrid;
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChamados: TfrmChamados;

implementation

{$R *.dfm}

procedure TfrmChamados.btnNovoClick(Sender: TObject);
begin
  frmChamadoCadastro := TfrmChamadoCadastro.Create(Self);
  try
    if frmChamadoCadastro.ShowModal = mrOk then
    begin
      dmChamado.qryChamados.Close;
      dmChamado.qryChamados.Open;
    end;
  finally
    frmChamadoCadastro.Free;
  end;
end;

end.
