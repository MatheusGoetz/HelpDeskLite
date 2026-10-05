unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, uFrmClientes, uFrmChamados;

type
  TfrmPrincipal = class(TForm)
    btnClientes: TButton;
    btnChamados: TButton;
    btnSair: TButton;
    procedure btnClientesClick(Sender: TObject);
    procedure btnChamadosClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnChamadosClick(Sender: TObject);
begin
  frmChamados := TfrmChamados.Create(Self);

  try
    frmChamados.ShowModal;
  finally
    frmChamados.Free;
  end;
end;

procedure TfrmPrincipal.btnClientesClick(Sender: TObject);
begin
  frmClientes := TfrmClientes.Create(Self);

  try
    frmClientes.ShowModal;
  finally
    frmClientes.Free;
  end;
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Close;
end;

end.
