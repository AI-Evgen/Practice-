procedure TWebModule1.WebModule1DefaultHandlerAction(Sender: TObject;
  Request: TWebRequest; Response: TWebResponse; var Handled: Boolean);
var
  HTMLContent: TStringList;
begin
  HTMLContent := TStringList.Create;
  try
    try
      // Подключение к БД через конфиг
      FDConnection1.Params.LoadFromFile('PDConnection.config');
      FDConnection1.Connected := True;

      // Запрос данных
      FDQueryTours.SQL.Text := 'SELECT * FROM Tours';
      FDQueryTours.Open;

      // Генерация HTML
      HTMLContent.Add('<html><head><title>Туры</title></head><body>');
      HTMLContent.Add('<h1>Список туров</h1><table border="1">');
      HTMLContent.Add('<tr><th>Название</th><th>Цена</th><th>Длительность</th></tr>');

      FDQueryTours.First;
      while not FDQueryTours.Eof do
      begin
        HTMLContent.Add(Format(
          '<tr><td>%s</td><td>%s</td><td>%d</td></tr>',
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
      on E: Exception do
        Response.Content := 'Ошибка: ' + E.Message;
    end;
  finally
    HTMLContent.Free;
    FDQueryTours.Close;
    FDConnection1.Connected := False;
  end;
end;
