unit dmMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.Provider, FireDAC.Phys.IBBase, IniFiles;

const
  NOME_ARQUIVO_CONFIG : String = 'Connect.ini';

type
  Tdm = class(TDataModule)
    connection: TFDConnection;
    fbclient: TFDPhysFBDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure CarregaConfigConnectIni;
    procedure CriaConfigConnectIni;

  public
    { Public declarations }

    function ProxGenerator(aGenerator: String) : integer;
  end;

var
  dm: Tdm;
  FDiretorioArquivo : String;

implementation

uses
  Vcl.Dialogs;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ Tdm }


{ Tdm }

procedure Tdm.CarregaConfigConnectIni;
var ConnectIni : TIniFile;
begin
   FDiretorioArquivo := ExtractFilePath(ParamStr(0)) + NOME_ARQUIVO_CONFIG;
   ConnectIni := TIniFile.Create(FDiretorioArquivo);

   if not FileExists(FDiretorioArquivo) then
   begin
      CriaConfigConnectIni;
      CarregaConfigConnectIni;
   end
   else
   begin
      try
         connection.Params.Database := ConnectIni.ReadString('BANCO', 'Database', 'C:\Elos Sistema\ELOSDB.FDB');
         connection.Params.Add('Server=' + ConnectIni.ReadString('BANCO', 'Server', '127.0.0.1'));
         connection.Params.Add('Port=' + ConnectIni.ReadString('BANCO', 'Port', '3050'));
         connection.Params.Add('Password=' + ConnectIni.ReadString('BANCO', 'Password', ''));
         try
            connection.Connected := True;
         except
            on E: Exception do
            begin
               MessageDlg('Não foi possível se conectar com o banco de dados!'+#13#10#13#10+E.Message, mtWarning, [mbOK], 0);
               System.Halt(0);
            end;
         end;
      finally
      ConnectIni.Free;
      end;
   end;
end;

procedure Tdm.CriaConfigConnectIni;
var ConnectIni : TIniFile;
begin
   ConnectIni := TIniFile.Create(FDiretorioArquivo);

   try
      ConnectIni.WriteString('BANCO', 'Server', '127.0.0.1');
      ConnectIni.WriteString('BANCO', 'Port', '3050');
      ConnectIni.WriteString('BANCO', 'Database', 'C:\Elos Sistema\ELOSDB.FDB');
      ConnectIni.WriteString('BANCO', 'Password', '');
   finally
      ConnectIni.Free;
   end;
end;

procedure Tdm.DataModuleCreate(Sender: TObject);
begin
   CarregaConfigConnectIni;
end;

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
