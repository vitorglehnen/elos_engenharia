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
  formSituacoes,
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
    Situacao1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Funcionarios1Click(Sender: TObject);
    procedure Situacao1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation


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

procedure TfrmMain.Situacao1Click(Sender: TObject);
begin
   frmSituacao := TFrmSituacao.Create(nil);

   try
    frmSituacao.ShowModal;
   finally
     frmSituacao.Free;
   end;
end;

end.
