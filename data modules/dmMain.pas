unit dmMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.Provider, FireDAC.Phys.IBBase;

type
  Tdm = class(TDataModule)
    qryClientes: TFDQuery;
    dsClientes: TDataSource;
    qryClientesCL_CODIGO: TIntegerField;
    qryClientesCL_NOME: TStringField;
    qryClientesCL_INATIVO: TStringField;
    qryClientesCL_DTCADASTRO: TDateField;
    qryClientesCL_DTNASCIMENTO: TDateField;
    qryClientesCL_RUA: TStringField;
    qryClientesCL_NRO: TStringField;
    qryClientesCL_COMPLEMENTO: TStringField;
    qryClientesCL_COORDENADAS: TStringField;
    qryClientesCL_CIDADE: TIntegerField;
    qryClientesCI_IBGE: TIntegerField;
    qryClientesCI_NOME: TStringField;
    qryClientesCI_ESTADO: TIntegerField;
    qryClientesES_IBGE: TIntegerField;
    qryClientesES_NOME: TStringField;
    qryClientesES_UF: TStringField;
    dsCidades: TDataSource;
    qryCidades: TFDQuery;
    qryCidadesCI_IBGE: TIntegerField;
    qryCidadesCI_NOME: TStringField;
    qryCidadesCI_ESTADO: TIntegerField;
    dsEstados: TDataSource;
    qryEstados: TFDQuery;
    qryEstadosES_IBGE: TIntegerField;
    qryEstadosES_NOME: TStringField;
    qryEstadosES_UF: TStringField;
    connection: TFDConnection;
    fbclient: TFDPhysFBDriverLink;
    qryClientesCL_FONE: TStringField;
    qryClientesCL_CPF: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }

    function ProxGenerator(aGenerator: String) : integer;

  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ Tdm }


{ Tdm }

function Tdm.ProxGenerator(aGenerator: String) : integer;
var aQuery : TFDQuery;
begin
  aQuery := TFDQuery.Create(nil);
  aQuery.Connection := connection;

  try
    aQuery.Open('SELECT FIRST 1 GEN_ID(' + aGenerator + ', 0) FROM rdb$database');
    Result := aQuery.Fields[0].AsInteger;
  finally
    FreeAndNil(aQuery);
  end;
end;

end.
