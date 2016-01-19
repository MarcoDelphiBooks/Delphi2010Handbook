object ServerMethods1: TServerMethods1
  OldCreateOrder = False
  Height = 306
  Width = 312
  object DataSetProvider1: TDataSetProvider
    DataSet = CUSTOMER
    Left = 144
    Top = 136
  end
  object FBCONNECTION: TSQLConnection
    ConnectionName = 'FBCONNECTION'
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      ';DelegateConnection=DBXTraceConnection'
      'drivername=Firebird'
      
        'Database=localhost:C:/Program Files/Firebird/Firebird2.1/example' +
        's/empbuild/employee.fdb'
      'rolename=RoleName'
      'user_name=sysdba'
      'password=masterkey'
      'sqldialect=3'
      'localecode=0000'
      'blobsize=-1'
      'commitretain=False'
      'waitonlocks=True'
      'isolationlevel=ReadCommitted'
      'trim char=False')
    VendorLib = 'fbclient.DLL'
    Left = 32
    Top = 32
  end
  object CUSTOMER: TSQLDataSet
    CommandText = 'CUSTOMER'
    CommandType = ctTable
    DbxCommandType = 'Dbx.Table'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = FBCONNECTION
    Left = 43
    Top = 99
  end
end
