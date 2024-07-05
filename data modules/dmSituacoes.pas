unit dmSituacoes;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, dmMain;

type
  Tdm_Situacoes = class(TDataModule)
    qrySituacoes: TFDQuery;
    dsSituacoes: TDataSource;
    qrySituacoesST_CODIGO: TIntegerField;
    qrySituacoesST_DESCRICAO: TWideStringField;
    qrySituacoesST_COR: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_Situacoes: Tdm_Situacoes;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
