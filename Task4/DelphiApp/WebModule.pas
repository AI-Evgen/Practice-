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
    FDConnection1: TFDConnection; // Подключение к БД
    FDQueryTours: TFDQuery;       // Запросы к таблице Tours
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
  HTMLContent: TStringList; // Генерация HTML-контента
begin
  HTMLContent := TStringList.Create;
  try
    try
      // Загрузка параметров из файла config.xml
      FDConnection1.Params.LoadFromFile('config.xml');
      FDConnection1.Connected := True; // Подключение к БД

      // Параметризованный запрос для безопасности
      FDQueryTours.SQL.Text := 'SELECT * FROM Tours WHERE DurationDays < :MaxDays';
      FDQueryTours.ParamByName('MaxDays').AsInteger := 10;
      FDQueryTours.Open;

      // Формирование HTML-страницы
      HTMLContent.Add('<html><head><title>Список туров</title></head><body>');
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

      HTMLContent.Add('</table></body></html>');
      Response.Content := HTMLContent.Text;

    except
      on E: Exception do // Обработка ошибок
        Response.Content := 'Ошибка: ' + E.Message;
    end;
  finally
    HTMLContent.Free;
    FDQueryTours.Close;
    FDConnection1.Connected := False; // Отключение от БД
  end;
end;

end.
