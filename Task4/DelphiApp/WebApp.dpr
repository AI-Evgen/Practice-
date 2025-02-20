program WebApp;

uses
  Vcl.Forms,
  Web.WebBroker,
  Web.WebReq,
  WebModule in 'WebModule.pas' {WebModule1: TWebModule};

{$R *.res}

begin
  Application.Initialize;
  if WebRequestHandler <> nil then
    WebRequestHandler.WebModuleClass := WebModuleClass;
  Application.Run;
end.