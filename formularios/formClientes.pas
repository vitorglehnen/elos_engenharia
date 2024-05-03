unit formClientes;

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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.ComCtrls,
  Vcl.TabNotBk,
  Vcl.Buttons,
  Vcl.DBCtrls,
  dmMain;

type
  TfrmClientes = class(TForm)
    ntbPrincipal: TTabbedNotebook;
    pnlPrincipalConsulta: TPanel;
    pnlGrid: TPanel;
    dbgConsulta: TDBGrid;
    pnlConsulta: TPanel;
    lblCidadeConsulta: TLabel;
    lblDataCadastroConsulta: TLabel;
    cbCidadeConsulta: TComboBox;
    edtCpfConsulta: TLabeledEdit;
    edtNomeConsulta: TLabeledEdit;
    edtDtIniConsulta: TMaskEdit;
    edtDtFimConsulta: TMaskEdit;
    btnConsultar: TButton;
    pnlPrincipalCadastro: TPanel;
    pnlBtnCrud: TPanel;
    edtNomeCad: TDBEdit;
    lblNomeCad: TLabel;
    edtCodCad: TDBEdit;
    lblCodigoCad: TLabel;
    DBEdit3: TDBEdit;
    lblCpfCad: TLabel;
    gpbEnderecoCad: TGroupBox;
    edtRuaCad: TDBEdit;
    lblRuaCad: TLabel;
    edtNroCad: TDBEdit;
    lblNroCad: TLabel;
    edtComplementoCad: TDBEdit;
    lblComplementoCad: TLabel;
    lblCidadeCad: TLabel;
    lblUfCad: TLabel;
    lblCoordenadaCad: TLabel;
    edtCoordenadasCad: TDBEdit;
    edtDtCadastroCad: TDBEdit;
    lblDataCad: TLabel;
    lblDataNascimento: TLabel;
    edtDataNascCad: TDBEdit;
    chkInativo: TDBCheckBox;
    cbEstadosCad: TComboBox;
    cbCidadesCad: TComboBox;
    DBNavigator1: TDBNavigator;
    DBEdit1: TDBEdit;
    lblFone: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure cbEstadosCadChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgConsultaDblClick(Sender: TObject);
    procedure cbCidadesCadChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }

    FDSClientes : TDataSet;
    FDSEstados : TDataSet;
    FDSCidades : TDataSet;
    FIBGECidades : TStringList;

    procedure DsClientesAfterScroll(TDataSet: TDataSet);
    procedure DsClientesAfterInsert(TDataSet: TDataSet);
    procedure DsClientesBeforePost(TDataSet: TDataSet);
    procedure DsClientesAfterPost(TDataSet: TDataSet);

    procedure CarregaCidades;
    procedure CarregaEstados;
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

{$R *.dfm}

procedure TfrmClientes.btnConsultarClick(Sender: TObject);
begin
  FDSClientes.Open;
end;

procedure TfrmClientes.btnNovoClick(Sender: TObject);
begin
  FDSClientes.Append;
end;

procedure TfrmClientes.CarregaCidades;
begin
  dm.qryCidades.Open('select cidades.*' +
                      ' from cidades' +
                      ' join estados on es_ibge = ci_estado and es_uf =' +''''+ cbEstadosCad.Text +''''+
                      ' order by ci_nome');

  with FDSCidades do
  begin
    cbCidadesCad.Items.Clear;
    FIBGECidades.Clear;
    while not Eof do
    begin
      cbCidadesCad.Items.Add(FieldByName('CI_NOME').AsString);
      FIBGECidades.Add(FieldByName('CI_IBGE').AsString);

      Next;
    end;
  end;

  dm.qryCidades.Close;
end;

procedure TfrmClientes.CarregaEstados;
begin
  dm.qryEstados.Open;

  with FDSEstados do
  begin
    while not Eof do
    begin
      cbEstadosCad.Items.Add(FieldByName('ES_UF').AsString);

      Next;
    end;
  end;

  dm.qryEstados.Close;
end;

procedure TfrmClientes.cbCidadesCadChange(Sender: TObject);
begin
  dm.dsClientes.DataSet.Edit;
end;

procedure TfrmClientes.cbEstadosCadChange(Sender: TObject);
begin
  CarregaCidades;
  dm.dsClientes.DataSet.Edit;
end;

procedure TfrmClientes.dbgConsultaDblClick(Sender: TObject);
begin
  ntbPrincipal.PageIndex := 1;
end;

procedure TfrmClientes.DsClientesAfterInsert(TDataSet: TDataSet);
begin
  edtNomeCad.SetFocus;

  FDSClientes.FieldByName('CL_INATIVO').AsString := 'N';
  FDSClientes.FieldByName('CL_DTCADASTRO').AsString := FormatDateTime('dd/mm/yyyy', Now);

  cbEstadosCad.ItemIndex := cbEstadosCad.Items.IndexOf('RS');
  cbEstadosCadChange(Self);

  cbCidadesCad.ItemIndex := cbCidadesCad.Items.IndexOf('Mato Leitao');
end;

procedure TfrmClientes.DsClientesAfterPost(TDataSet: TDataSet);
begin
  if FDSClientes.FieldByName('CL_CODIGO').IsNull then
    ShowMessage(dm.qryClientes.DataSource.DataSet.FieldByName('CL_CODIGO').AsString);
end;

procedure TfrmClientes.DsClientesAfterScroll(TDataSet: TDataSet);
begin
  cbEstadosCad.Text := FDSClientes.FieldByName('ES_UF').AsString;
  cbCidadesCad.Text := FDSClientes.FieldByName('CI_NOME').AsString;
end;

procedure TfrmClientes.DsClientesBeforePost(TDataSet: TDataSet);
begin
  with FDSClientes do
  begin
    FieldByName('CL_CIDADE').AsString := FIBGECidades[cbCidadesCad.ItemIndex];
  end;
end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin
  // Datasets
  FDSClientes := DM.dsClientes.DataSet;
  FDSEstados  := DM.dsEstados.DataSet;
  FDSCidades  := DM.dsCidades.DataSet;

  FIBGECidades := TStringList.Create;

  dm.qryClientes.AfterScroll := DsClientesAfterScroll;
  dm.qryClientes.AfterInsert := DsClientesAfterInsert;
  dm.qryClientes.BeforePost  := DsClientesBeforePost;
  dm.qryClientes.AfterPost   := DsClientesAfterPost;

  CarregaEstados;
  CarregaCidades;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  ntbPrincipal.PageIndex := 0;
  TDrawGrid(dbgConsulta).ScrollBars := ssVertical;
  DsClientesAfterScroll(dm.dsClientes.DataSet);
end;

end.
