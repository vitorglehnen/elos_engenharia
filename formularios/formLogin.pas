unit formLogin;

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
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.ExtCtrls,
  uMain;

type
  TfrmLogin = class(TForm)
    pnlPrincipal: TPanel;
    edtSenha: TLabeledEdit;
    edtUsuario: TLabeledEdit;
    btnEntrar: TButton;
    pnlImagemLogo: TPanel;
    procedure btnEntrarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnEntrarClick(Sender: TObject);
begin
  frmMain := TfrmMain.Create(Self);
  frmMain.Show;
end;

procedure TfrmLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   end;
end;

end.
