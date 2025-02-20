unit WebModule;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, 
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.VCLUI.Wait, FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Data.DB;

type
  TWebModule1 = class(TWebModule)
    FDConnection1: TFDConnection;
    FDQueryTours: TFDQuery;
    procedure WebModule1DefaultHandlerAction(Sender: TObject;
      Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WebModuleClass: TComponentClass = TWebModule1;

implementation

{$R *.dfm}

procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  HTMLContent: TStringList;
begin
  // Настройка подключения к MS SQL Server
  FDConnection1.Params.Clear;
  FDConnection1.Params.Add('DriverID=MSSQL');
  FDConnection1.Params.Add('Database=Tourism');
  FDConnection1.Params.Add('User_Name=admin');
  FDConnection1.Params.Add('Password=admin123');
  FDConnection1.Params.Add('Server=localhost');
  FDConnection1.Connected := True;

  // Запрос данных о турах
  FDQueryTours.SQL.Text := 'SELECT * FROM Tours';
  FDQueryTours.Open;

  // Генерация HTML-страницы
  HTMLContent := TStringList.Create;
  try
    HTMLContent.Add('<html>');
    HTMLContent.Add('<head><title>Список туров</title></head>');
    HTMLContent.Add('<body>');
    HTMLContent.Add('<h1>Доступные туры</h1>');
    HTMLContent.Add('<table border="1">');
    HTMLContent.Add('<tr><th>Название</th><th>Цена</th><th>Длительность</th></tr>');

    FDQueryTours.First;
    while not FDQueryTours.Eof do
    begin
      HTMLContent.Add(Format(
        '<tr><td>%s</td><td>%s руб.</td><td>%d дней</td></tr>',
        [
          FDQueryTours.FieldByName('Title').AsString,
          FDQueryTours.FieldByName('Price').AsString,
          FDQueryTours.FieldByName('DurationDays').AsInteger
        ]
      ));
      FDQueryTours.Next;
    end;

    HTMLContent.Add('</table>');
    HTMLContent.Add('</body></html>');

    Response.Content := HTMLContent.Text;
  finally
    HTMLContent.Free;
  end;

  FDQueryTours.Close;
  FDConnection1.Connected := False;
end;

end.