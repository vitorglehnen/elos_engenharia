program ElosEngenharia;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  formClientes in 'formularios\formClientes.pas' {frmClientes},
  dmMain in 'data modules\dmMain.pas' {dm: TDataModule},
  uReqUteis in 'api\uReqUteis.pas',
  dmClientes in 'data modules\dmClientes.pas' {dm_Clientes: TDataModule},
  formFuncionarios in 'formularios\formFuncionarios.pas' {frmFuncionarios},
  dmFuncionarios in 'data modules\dmFuncionarios.pas' {dm_funcionarios: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  formLogin in 'formularios\formLogin.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glossy');

  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tdm_funcionarios, dm_funcionarios);
  Application.CreateForm(Tdm_Clientes, dm_Clientes);
  Application.Run;
end.
