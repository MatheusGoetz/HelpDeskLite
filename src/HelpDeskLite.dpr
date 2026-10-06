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
  uFrmChamadoCadastro in 'Forms\uFrmChamadoCadastro.pas' {frmChamadoCadastro},
  uDMItemChamado in 'Data\uDMItemChamado.pas' {dmItemChamado: TDataModule},
  uFrmItensChamado in 'Forms\uFrmItensChamado.pas' {frmItensChamado},
  uFrmItemChamadoCadastro in 'Forms\uFrmItemChamadoCadastro.pas' {frmItemChamadoCadastro},
  uChamadoService in 'Services\uChamadoService.pas',
  uLogger in 'Services\uLogger.pas';

{$R *.res}

begin
Application.Initialize;
Application.MainFormOnTaskbar := True;

Application.CreateForm(TdmConexao, dmConexao);
  Application.CreateForm(TdmCliente, dmCliente);
  Application.CreateForm(TdmChamado, dmChamado);
  Application.CreateForm(TdmItemChamado, dmItemChamado);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
