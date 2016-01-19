object DSFirst3TierServerModule: TDSFirst3TierServerModule
  OldCreateOrder = False
  Height = 244
  Width = 348
  object EMPLOYEE: TSQLDataSet
    CommandText = 'EMPLOYEE'
    CommandType = ctTable
    DbxCommandType = 'Dbx.Table'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = FBCONNECTION
    Left = 93
    Top = 101
    object EMPLOYEEEMP_NO: TSmallintField
      FieldName = 'EMP_NO'
      Required = True
    end
    object EMPLOYEEFIRST_NAME: TStringField
      FieldName = 'FIRST_NAME'
      Required = True
      Size = 15
    end
    object EMPLOYEELAST_NAME: TStringField
      FieldName = 'LAST_NAME'
      Required = True
    end
    object EMPLOYEEPHONE_EXT: TStringField
      FieldName = 'PHONE_EXT'
      Size = 4
    end
    object EMPLOYEEHIRE_DATE: TSQLTimeStampField
      FieldName = 'HIRE_DATE'
      Required = True
    end
    object EMPLOYEEDEPT_NO: TStringField
      FieldName = 'DEPT_NO'
      Required = True
      FixedChar = True
      Size = 3
    end
    object EMPLOYEEJOB_CODE: TStringField
      FieldName = 'JOB_CODE'
      Required = True
      Size = 5
    end
    object EMPLOYEEJOB_GRADE: TSmallintField
      FieldName = 'JOB_GRADE'
      Required = True
    end
    object EMPLOYEEJOB_COUNTRY: TStringField
      FieldName = 'JOB_COUNTRY'
      Required = True
      Size = 15
    end
    object EMPLOYEESALARY: TFMTBCDField
      FieldName = 'SALARY'
      Required = True
      Precision = 15
      Size = 2
    end
    object EMPLOYEEFULL_NAME: TStringField
      FieldName = 'FULL_NAME'
      Size = 37
    end
  end
  object DataSetProviderEmployee: TDataSetProvider
    DataSet = EMPLOYEE
    Left = 192
    Top = 48
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
      
        'database=localhost:C:/Program Files/Firebird/Firebird2.1/example' +
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
    Left = 164
    Top = 164
  end
end
