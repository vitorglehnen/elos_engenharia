unit dmFuncionarios;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmMain;

type
  Tdm_funcionarios = class(TDataModule)
    qryFuncionarios: TFDQuery;
    dsFuncionarios: TDataSource;
    qryFuncionariosUS_CODIGO: TIntegerField;
    qryFuncionariosUS_NOME: TWideStringField;
    qryFuncionariosUS_SENHA: TWideStringField;
    qryFuncionariosUS_ADMIN: TBooleanField;
    qryFuncionariosUS_INATIVO: TBooleanField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_funcionarios: Tdm_funcionarios;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
