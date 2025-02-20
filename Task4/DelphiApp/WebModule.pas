unit WebModule;

interface

uses
  System.SysUtils, System.Classes, Web.HTTPApp, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Comp.UI;

type
  TWebModule1 = class(TWebModule)
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
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
begin
  // Подключение к БД
  FDConnection1.Params.DriverID := 'MSSQL';
  FDConnection1.Params.Database := 'Tourism';
  FDConnection1.Params.UserName := 'admin';
  FDConnection1.Params.Password := 'password';
  FDConnection1.Connected := True;

  // Запрос данных
  FDQuery1.SQL.Text := 'SELECT * FROM Tours';
  FDQuery1.Open;

  // Формирование HTML-ответа
  Response.Content := 
    '<html><body>' +
    '<h1>Список туров</h1>' +
    '<ul>' +
    '<li>Тур: ' + FDQuery1.FieldByName('Title').AsString + '</li>' +
    '</ul>' +
    '</body></html>';
end;

end.