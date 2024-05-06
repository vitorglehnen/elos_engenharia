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
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan;

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
    Funcionrios1: TMenuItem;
    imgLogo: TImage;
    procedure Clientes1Click(Sender: TObject);
  private
    { Private declarations }

    frmClientes : TfrmClientes;
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

end.
