object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end>
  Height = 230
  Width = 415
  object FDConnection1: TFDConnection
    Params.Strings = (
      'DriverID=MSSQL')
    Left = 56
    Top = 24
  end
  object FDQueryTours: TFDQuery
    Connection = FDConnection1
    Left = 152
    Top = 24
  end
end