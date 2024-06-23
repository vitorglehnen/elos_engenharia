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
  dmClientes,
  Vcl.CategoryButtons,
  Vcl.CheckLst,
  ShellAPI,
  uReqUteis,
  System.JSON, JvDBControls;

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
    DBEdit1: TDBEdit;
    lblFone: TLabel;
    btnCoordenadaMaps: TBitBtn;
    chklbCidadesConsulta: TCheckListBox;
    edtDtIniConsulta: TMaskEdit;
    lblDataCadastroConsulta: TLabel;
    edtDtFimConsulta: TMaskEdit;
    edtCepCad: TDBEdit;
    lblCepCad: TLabel;
    btnCepMaps: TBitBtn;
    edtBairroCad: TDBEdit;
    lblBairroCad: TLabel;
    btnWhatsApp: TBitBtn;
    jvdbnvgtrCliente: TJvDBNavigator;
    procedure FormShow(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure cbEstadosCadChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbgConsultaDblClick(Sender: TObject);
    procedure cbCidadesCadChange(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
    procedure ntbPrincipalChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure btnCepMapsClick(Sender: TObject);
    procedure btnCoordenadaMapsClick(Sender: TObject);
    procedure btnWhatsAppClick(Sender: TObject);
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
  System.SysUtils, dmMain;

{$R *.dfm}

procedure TfrmClientes.btnCepMapsClick(Sender: TObject);
var vUrl, vCep : String;
    vJsonResponseCep: TJSONObject;
begin
  vCep := FDSClientes.FieldByName('CL_CEP').AsString;

  if vCep <> '' then
  begin
    // Realiza a requisi��o para pegar as informa��es do CEP e j� preenche nos campos
    vJsonResponseCep := RetornaInformacoesCep(vCep);

    with FDSClientes do
    begin
      if FDSClientes.State <> dsEdit then
        FDSClientes.Edit;

      cbEstadosCad.ItemIndex := cbEstadosCad.Items.IndexOf(vJsonResponseCep.GetValue('uf').Value);
      cbEstadosCadChange(cbEstadosCad);
      cbCidadesCad.ItemIndex := cbCidadesCad.Items.IndexOf(RemoveAcentos(vJsonResponseCep.GetValue('localidade').Value));

      FDSClientes.FieldByName('CL_COMPLEMENTO').AsString := vJsonResponseCep.GetValue('complemento').Value;
      FDSClientes.FieldByName('CL_BAIRRO').AsString := vJsonResponseCep.GetValue('bairro').Value;
      FDSClientes.FieldByName('CL_RUA').AsString := vJsonResponseCep.GetValue('logradouro').Value;

      FDSClientes.Post;
    end;

    // Abre a localiza��o do CEP no google maps
    vUrl := 'https://www.google.com/maps/search/?api=1&query=' + vCep;
    ShellExecute(0, 'open', PChar(vUrl), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TfrmClientes.btnConsultarClick(Sender: TObject);
begin
  MontaFiltroConsulta;

  FDSClientes.Open;
end;

procedure TfrmClientes.btnCoordenadaMapsClick(Sender: TObject);
var vUrl, vCoordenadas : String;
begin
  vCoordenadas := FDSClientes.FieldByName('CL_COORDENADAS').AsString;

  if not vCoordenadas.IsEmpty then
  begin
    vUrl := 'https://www.google.com/maps/search/?api=1&query=' + vCoordenadas;
    ShellExecute(0, 'open', PChar(vUrl), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TfrmClientes.btnNovoClick(Sender: TObject);
begin
  FDSClientes.Append;
end;

procedure TfrmClientes.btnWhatsAppClick(Sender: TObject);
var vUrl, vFone : String;
begin
  vFone := FDSClientes.FieldByName('CL_FONE').AsString;

  if not vFone.IsEmpty then
  begin
    vUrl := 'https://wa.me/55' + FDSClientes.FieldByName('CL_FONE').AsString;
    ShellExecute(0, 'open', PChar(vUrl), nil, nil, SW_SHOWNORMAL);
  end;
end;

procedure TfrmClientes.CarregaCidades;
begin
  dm_Clientes.qryCidades.Open('select cidades.*' +
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

  dm_Clientes.qryCidades.Close;
end;

procedure TfrmClientes.CarregaEstados;
begin
  dm_Clientes.qryEstados.Open;

  with FDSEstados do
  begin
    while not Eof do
    begin
      cbEstadosCad.Items.Add(FieldByName('ES_UF').AsString);

      Next;
    end;
  end;

  dm_Clientes.qryEstados.Close;
end;

procedure TfrmClientes.cbCidadesCadChange(Sender: TObject);
begin
  FDSClientes.Edit;
end;

procedure TfrmClientes.cbEstadosCadChange(Sender: TObject);
begin
  CarregaCidades;
  FDSClientes.Edit;
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
  FDSClientes := dm_Clientes.dsClientes.DataSet;
  FDSEstados  := dm_Clientes.dsEstados.DataSet;
  FDSCidades  := dm_Clientes.dsCidades.DataSet;

  FIBGECidades := TStringList.Create;

  //Eventos da query de clientes
  dm_Clientes.qryClientes.AfterScroll := DsClientesAfterScroll;
  dm_Clientes.qryClientes.AfterInsert := DsClientesAfterInsert;
  dm_Clientes.qryClientes.BeforePost  := DsClientesBeforePost;
  dm_Clientes.qryClientes.AfterPost   := DsClientesAfterPost;

  //Preenche os combobox's
  CarregaEstados;
  CarregaCidades;
end;

procedure TfrmClientes.FormShow(Sender: TObject);
begin
  ntbPrincipal.PageIndex := 0;
  TDrawGrid(dbgConsulta).ScrollBars := ssVertical;
  DsClientesAfterScroll(dm_Clientes.dsClientes.DataSet);

  {$REGION 'Preenche cidades da consulta'}
    dm_Clientes.qryCidades.Open('select distinct(ci_ibge), ci_nome, ci_estado '+
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
      vWhereSql := 'UPPER(CL_NOME) LIKE ' + '''%' + UpperCase(edtNomeConsulta.Text) + '%''' + ' and '
    else
      vWhereSql := vWhereSql + 'UPPER(CL_NOME) LIKE ' + '''%' + UpperCase(edtNomeConsulta.Text) + '%''' + ' and ';
  end;
  {$ENDREGION}

  // Remove o AND que fica no final da string
  if vWhereSql <> '' then
  begin
    vWhereSql := Copy(vWhereSql, 1, Length(vWhereSql) - 4);
    vWhereSql := ' WHERE ' + vWhereSql;
  end;

  dm_Clientes.qryClientes.SQL.Text := 'select * '+
                              'from clientes '+
                              'join cidades on ci_ibge = cl_cidade '+
                              'join estados on es_ibge = ci_estado' + vWhereSql;
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
