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
    lblCor: TLabel;
    clbCor: TJvColorComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgConsultaDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DsSituacoesBeforePost(TDataSet: TDataSet);
  end;

var
  frmSituacao: TfrmSituacao;

implementation

{$R *.dfm}

{ TfrmSituacao }

procedure TfrmSituacao.dbgConsultaDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  CellColor: TColor;
begin
   with dbgConsulta.Canvas do
   begin
      if Column.FieldName = 'ST_COR' then
      begin
         try
            CellColor := StringToColor(dm_Situacoes.qrySituacoes.FieldByName('ST_COR').AsString);
         except
            CellColor := clWhite;
         end;

         Brush.Color := CellColor;
         FillRect(Rect);
      end;
   end;

   dbgConsulta.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmSituacao.DsSituacoesBeforePost(TDataSet: TDataSet);
begin

end;

procedure TfrmSituacao.FormCreate(Sender: TObject);
begin
   dm_Situacoes.qrySituacoes.AfterPost := DsSituacoesBeforePost;
   dm_Situacoes.qrySituacoes.Open;
end;

procedure TfrmSituacao.FormShow(Sender: TObject);
begin
   TDrawGrid(dbgConsulta).ScrollBars := ssVertical;
end;

end.
