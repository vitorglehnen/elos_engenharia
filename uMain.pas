unit uMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Menus,
  formClientes,
  formFuncionarios,
  Vcl.Imaging.pngimage,
  System.Actions,
  Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls,
  Vcl.ActnMan;

type
  TfrmMain = class(TForm)
    pnlPrincipal: TPanel;
    pnlForms: TPanel;
    mnPrincipal: TMainMenu;
    Cadastros1: TMenuItem;
    Parmetros1: TMenuItem;
    Sair1: TMenuItem;
    Clientes1: TMenuItem;
    Projetos1: TMenuItem;
    Funcionarios1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
  private
    { Private declarations }

    frmClientes     : TfrmClientes;
    frmFuncionarios : TfrmFuncionarios;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  formLogin;

{$R *.dfm}

procedure TfrmMain.Clientes1Click(Sender: TObject);
begin
  frmClientes := TFrmClientes.Create(nil);
end;

procedure TfrmMain.Funcionarios1Click(Sender: TObject);
begin
  frmFuncionarios := TFrmFuncionarios.Create(nil);

  try
    frmFuncionarios.ShowModal;
  finally
    frmFuncionarios.Free;
  end;
end;

procedure TfrmMain.Sair1Click(Sender: TObject);
begin
  System.Halt(0);
end;

end.
