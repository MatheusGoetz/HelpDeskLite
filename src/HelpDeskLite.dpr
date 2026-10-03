program HelpDeskLite;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  uDMConexao in 'Data\uDMConexao.pas' {dmConexao: TDataModule},
  uDMCliente in 'Data\uDMCliente.pas' {dmCliente: TDataModule},
  uFrmClientes in 'Forms\uFrmClientes.pas' {frmClientes},
  uFrmClienteCadastro in 'Forms\uFrmClienteCadastro.pas' {frmClienteCadastro},
  uDMChamado in 'Data\uDMChamado.pas' {dmChamado: TDataModule},
  uFrmChamados in 'Forms\uFrmChamados.pas' {frmChamados},
  uFrmChamadoCadastro in 'Forms\uFrmChamadoCadastro.pas' {frmChamadoCadastro};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmChamados, frmChamados);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmCliente, dmCliente);
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TfrmClienteCadastro, frmClienteCadastro);
  Application.CreateForm(TdmChamado, dmChamado);
  Application.CreateForm(TfrmChamados, frmChamados);
  Application.CreateForm(TfrmChamadoCadastro, frmChamadoCadastro);
  Application.Run;
end.
