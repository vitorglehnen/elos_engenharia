program ElosEngenharia;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {frmMain},
  formClientes in 'formularios\formClientes.pas' {frmClientes},
  dmMain in 'data modules\dmMain.pas' {dm: TDataModule},
  uReqUteis in 'api\uReqUteis.pas',
  dmClientes in 'data modules\dmClientes.pas' {dm_Clientes: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(Tdm_Clientes, dm_Clientes);
  Application.Run;
end.
