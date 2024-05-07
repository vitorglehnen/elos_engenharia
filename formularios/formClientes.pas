unit formClientes;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
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
  dmMain,
  Vcl.CategoryButtons,
  Vcl.CheckLst;

type
  TfrmClientes = class(TForm)
    ntbPrincipal: TTabbedNotebook;
    pnlPrincipalConsulta: TPanel;
    pnlGrid: TPanel;
    dbgConsulta: TDBGrid;
    pnlConsulta: TPanel;
    lblCidadeConsulta: TLabel;
    edtCpfConsulta: TLabeledEdit;
    edtNomeConsulta: TLabeledEdit;
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
    btnCoordenadaMaps: TBitBtn;
    chklbCidadesConsulta: TCheckListBox;
    edtDtIniConsulta: TMaskEdit;
    lblDataCadastroConsulta: TLabel;
    edtDtFimConsulta: TMaskEdit;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure cbEstadosCadChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgConsultaDblClick(Sender: TObject);
    procedure cbCidadesCadChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure ntbPrincipalChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
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

    procedure MontaFiltroConsulta;

    procedure CarregaCidades;
    procedure CarregaEstados;
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TfrmClientes.btnConsultarClick(Sender: TObject);
begin
  MontaFiltroConsulta;

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
end;

procedure TfrmClientes.DsClientesAfterPost(TDataSet: TDataSet);
begin

end;

procedure TfrmClientes.DsClientesAfterScroll(TDataSet: TDataSet);
begin
  cbEstadosCad.ItemIndex := cbEstadosCad.Items.IndexOf(FDSClientes.FieldByName('ES_UF').AsString);
  CarregaCidades;

  cbCidadesCad.ItemIndex := cbCidadesCad.Items.IndexOf(FDSClientes.FieldByName('CI_NOME').AsString);

  if FDSClientes.State = dsInsert then
  begin
    cbEstadosCad.ItemIndex := cbEstadosCad.Items.IndexOf('RS');
    CarregaCidades;
    cbCidadesCad.ItemIndex := cbCidadesCad.Items.IndexOf('Mato Leitao');
  end;
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
  //Datasets
  FDSClientes := DM.dsClientes.DataSet;
  FDSEstados  := DM.dsEstados.DataSet;
  FDSCidades  := DM.dsCidades.DataSet;

  FIBGECidades := TStringList.Create;

  //Eventos da query de clientes
  dm.qryClientes.AfterScroll := DsClientesAfterScroll;
  dm.qryClientes.AfterInsert := DsClientesAfterInsert;
  dm.qryClientes.BeforePost  := DsClientesBeforePost;
  dm.qryClientes.AfterPost   := DsClientesAfterPost;

  //Preenche os combobox's
  CarregaEstados;
  CarregaCidades;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  ntbPrincipal.PageIndex := 0;
  TDrawGrid(dbgConsulta).ScrollBars := ssVertical;
  DsClientesAfterScroll(dm.dsClientes.DataSet);

  {$REGION 'Preenche cidades da consulta'}
    dm.qryCidades.Open('select distinct(ci_ibge), ci_nome, ci_estado '+
                        'from cidades '+
                        'join clientes on cl_cidade = ci_ibge '+
                        'order by 1');
    while not FDSCidades.Eof do
    begin
      chklbCidadesConsulta.Items.Add(FDSCidades.FieldByName('ci_nome').AsString);

      FDSCidades.Next;
    end;
    {$ENDREGION}
end;

procedure TfrmClientes.MontaFiltroConsulta;
var vCidadesSelecionadas : String;
    vContador : Integer;
    vSql : String;
    vWhereSql : String;
begin
  vSql := '';
  vWhereSql := '';

  {$REGION 'Cidades'}
  vCidadesSelecionadas := '';
  vContador := 0;

  FDSClientes.Close;

  for vContador := 0 to chklbCidadesConsulta.Items.Count - 1 do
  begin
    if chklbCidadesConsulta.Checked[vContador] then
        vCidadesSelecionadas := vCidadesSelecionadas + '''' + chklbCidadesConsulta.Items[vContador] + ''''  + ',';
  end;


  if vCidadesSelecionadas <> '' then
  begin
    //Deleta a ultima virgula
    Delete(vCidadesSelecionadas, Length(vCidadesSelecionadas), 1);

    vWhereSql := 'CI_NOME in (' + vCidadesSelecionadas + ') and ';
  end;
  {$ENDREGION}

  {$REGION 'Data Cadastro'}
  if ((edtDtIniConsulta.Text <> '  /  /    ') and (edtDtIniConsulta.Text <> '  /  /    ')) then
  begin
    if vWhereSql = '' then
      vWhereSql := 'CL_DTCADASTRO BETWEEN ' +
                   ''''+FormatDateTime('dd.mm.yyyy', StrToDate(edtDtIniConsulta.Text))+''''+
                   ' and ' +
                   ''''+FormatDateTime('dd.mm.yyyy', StrToDate(edtDtFimConsulta.Text))+'''' + ' and '
    else
      vWhereSql := vWhereSql + 'CL_DTCADASTRO BETWEEN ' +
                   ''''+FormatDateTime('dd.mm.yyyy', StrToDate(edtDtIniConsulta.Text))+''''+
                   ' and ' +
                   ''''+FormatDateTime('dd.mm.yyyy', StrToDate(edtDtFimConsulta.Text))+'''' + ' and ';  
  end;
  {$ENDREGION}

  {$REGION 'CPF'}
  if (edtCpfConsulta.Text <> '') then
  begin
    if vWhereSql = '' then
      vWhereSql := 'CL_CPF LIKE ' + '''' + edtCpfConsulta.Text + '%''' + ' and '
    else
      vWhereSql := vWhereSql + 'CL_CPF LIKE ' + '''' + edtCpfConsulta.Text + '%''' + ' and ';
  end;
  {$ENDREGION}

  {$REGION 'Nome'}
  if (edtNomeConsulta.Text <> '') then
  begin
    if vWhereSql = '' then
      vWhereSql := 'UPPER(CL_NOME) LIKE ' + '''' + UpperCase(edtNomeConsulta.Text) + '%''' + ' and '
    else
      vWhereSql := vWhereSql + 'CL_NOME LIKE ' + '''' + UpperCase(edtNomeConsulta.Text) + '%''' + ' and ';
  end;
  {$ENDREGION}

  // Remove o AND que fica no final da string
  if vWhereSql <> '' then
  begin
    vWhereSql := Copy(vWhereSql, 1, Length(vWhereSql) - 4);
  end;
  
  ShowMessage(vWhereSql);
end;

procedure TfrmClientes.ntbPrincipalChange(Sender: TObject; NewTab: Integer;
  var AllowChange: Boolean);
begin
  if ((ntbPrincipal.PageIndex = 1) and
      ((FDSClientes.State = dsInsert) or (FDSClientes.State = dsEdit))) then
  begin
    AllowChange := False;
    MessageDlg('Salve ou cancele o registro antes de sair!', mtWarning, [mbOK], 0);
  end;
end;

end.
