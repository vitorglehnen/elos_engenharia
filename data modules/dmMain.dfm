object dm: Tdm
  OnCreate = DataModuleCreate
  Height = 767
  Width = 898
  object connection: TFDConnection
    Params.Strings = (
      'Database=C:\Elos Sistema\ELOSDB.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Port=3050'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 80
    Top = 344
  end
  object fbclient: TFDPhysFBDriverLink
    DriverID = 'FB'
    VendorLib = 'C:\Elos Sistema\FBCLIENT.DLL'
    Left = 80
    Top = 440
  end
end
