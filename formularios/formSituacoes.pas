unit formSituacoes;

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
  Data.DB,
  Vcl.StdCtrls,
  Vcl.DBCtrls,
  Vcl.Mask,
  Vcl.ExtCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  dmSituacoes, JvExStdCtrls, JvCombobox, JvColorCombo;

type
  TfrmSituacao = class(TForm)
    pnlMain: TPanel;
    pnlGrid: TPanel;
    dbgConsulta: TDBGrid;
    dbnavCliente: TDBNavigator;
    lblCodigo: TLabel;
    edtCodigo: TDBEdit;
    lblDescricao: TLabel;
    edtDescrocap: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSituacao: TfrmSituacao;

implementation

{$R *.dfm}

{ TfrmSituacao }

procedure TfrmSituacao.FormCreate(Sender: TObject);
begin
   dm_Situacoes.qrySituacoes.Open;
end;

procedure TfrmSituacao.FormKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      Key := #0;
      Perform(WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure TfrmSituacao.FormShow(Sender: TObject);
begin
   TDrawGrid(dbgConsulta).ScrollBars := ssVertical;
end;

end.
