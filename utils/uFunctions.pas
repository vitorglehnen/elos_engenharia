unit uFunctions;

interface

uses
   System.SysUtils,
   System.Math,
   System.Classes,
   FireDAC.Stan.Intf,
   FireDAC.Stan.Option,
   FireDAC.Stan.Param,
   FireDAC.Stan.Error,
   FireDAC.DatS,
   FireDAC.Phys.Intf,
   FireDAC.DApt.Intf,
   FireDAC.Stan.Async,
   FireDAC.DApt,
   Data.DB,
   FireDAC.Comp.DataSet,
   FireDAC.Comp.Client,
   JvDBCombobox,
   dmMain,
   StrUtils;

procedure CarregaJvDBComboBox(Combobox : TJvDBComboBox; vTabela, vCampo, vFiltro: String; vCampoValue : String = ''; vSQL : string = ''; vOrdem : string = '');
function ConsultaSQL(vSQL:string; OpenDataSet:Boolean = True): TFDQuery;

implementation

procedure CarregaJvDBComboBox(Combobox : TJvDBComboBox; vTabela, vCampo, vFiltro: String; vCampoValue : String = ''; vSQL : string = ''; vOrdem : string = '');
var vQry : TFDQuery;
       i : Integer;
begin
   if vSQL <> '' then
      vQry := ConsultaSQL(vSQL)
   else
   begin
      if vFiltro <> '' then
         vFiltro := ' WHERE '+vFiltro;
      vQry := ConsultaSQL('SELECT * FROM '+vTabela+vFiltro+IfThen(vOrdem <> '', ' ORDER BY ' + vOrdem, ''));
   end;
   Combobox.Items.Clear;
   Combobox.Values.Clear;
   if not vQry.IsEmpty then
   begin
      with vQry do
      begin
         first;
         while not eof do
         begin
            if vCampoValue <> '' then
               Combobox.Values.Add(vQry.FieldByName(vCampoValue).AsString);
            Combobox.Items.Add(vQry.FieldByName(vCampo).AsString);
            next;
         end;
      end;
   end;
   vQry.Close;
   vQry.Free;
   if ((Combobox as TJvDBComboBox).DataSource <> nil) and
      ((Combobox as TJvDBComboBox).DataSource.DataSet.FieldByName(ComboBox.DataField).AsString <> '') then
      ComboBox.ItemIndex := ComboBox.Values.IndexOf((Combobox as TJvDBComboBox).DataSource.DataSet.FieldByName(ComboBox.DataField).AsString);
end;

function ConsultaSQL(vSQL:string;OpenDataSet:Boolean):TFDQuery;
begin
   Result := TFDQuery.Create(nil);
   try
      Result.Connection := dmMain.dm.connection;
      Result.Close;
      Result.SQL.Text := vSQL;
      if OpenDataSet then
      begin
         Result.Open;
         if not Result.IsEmpty then
            Result.First;
      end;
   except
      ON E:Exception do
      begin
         FreeAndNil(Result);
         raise;
      end;
   end;
end;


end.
