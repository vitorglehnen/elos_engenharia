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
  formLogin in 'formularios\formLogin.pas' {frmLogin},
  uFunctions in 'utils\uFunctions.pas',
  formSituacoes in 'formularios\formSituacoes.pas' {frmSituacao},
  dmSituacoes in 'data modules\dmSituacoes.pas' {dm_Situacoes: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Glossy');

  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tdm_funcionarios, dm_funcionarios);
  Application.CreateForm(Tdm_Clientes, dm_Clientes);
  Application.CreateForm(Tdm_Situacoes, dm_Situacoes);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
