unit dmClientes;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  Tdm_Clientes = class(TDataModule)
    dsClientes: TDataSource;
    qryClientes: TFDQuery;
    qryClientesCL_CODIGO: TIntegerField;
    qryClientesCL_NOME: TWideStringField;
    qryClientesCL_CPF: TWideStringField;
    qryClientesCL_FONE: TWideStringField;
    qryClientesCL_INATIVO: TWideStringField;
    qryClientesCL_DTCADASTRO: TDateField;
    qryClientesCL_DTNASCIMENTO: TDateField;
    qryClientesCL_CEP: TWideStringField;
    qryClientesCL_RUA: TWideStringField;
    qryClientesCL_NRO: TWideStringField;
    qryClientesCL_COMPLEMENTO: TWideStringField;
    qryClientesCL_COORDENADAS: TWideStringField;
    qryClientesCL_CIDADE: TIntegerField;
    qryClientesCL_BAIRRO: TWideStringField;
    qryClientesCI_IBGE: TIntegerField;
    qryClientesCI_NOME: TWideStringField;
    qryClientesCI_ESTADO: TIntegerField;
    qryClientesES_IBGE: TIntegerField;
    qryClientesES_NOME: TWideStringField;
    qryClientesES_UF: TWideStringField;
    qryCidades: TFDQuery;
    qryCidadesCI_IBGE: TIntegerField;
    qryCidadesCI_NOME: TWideStringField;
    qryCidadesCI_ESTADO: TIntegerField;
    dsCidades: TDataSource;
    qryEstados: TFDQuery;
    qryEstadosES_IBGE: TIntegerField;
    qryEstadosES_NOME: TWideStringField;
    qryEstadosES_UF: TWideStringField;
    dsEstados: TDataSource;
    qryProjetos: TFDQuery;
    dsProjetos: TDataSource;
    qryProjetosPJ_CODIGO: TIntegerField;
    qryProjetosPJ_CLIENTE: TIntegerField;
    qryProjetosPJ_MINHACASAMINHAVIDA: TBooleanField;
    qryProjetosPJ_TAMANHO: TFMTBCDField;
    qryProjetosPJ_VALOR: TFMTBCDField;
    qryProjetosPJ_SITUACAO: TIntegerField;
    qryProjetosPJ_COORDENADAS: TWideStringField;
    qryProjetosPJ_DATAINICIO: TDateField;
    qryProjetosPJ_DATAPREVISAO: TDateField;
    qryProjetosPJ_FINALIZADO: TBooleanField;
    qryProjetosST_CODIGO: TIntegerField;
    qryProjetosST_DESCRICAO: TWideStringField;
    qryProjetosST_COR: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_Clientes: Tdm_Clientes;

implementation

uses
  dmMain;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
