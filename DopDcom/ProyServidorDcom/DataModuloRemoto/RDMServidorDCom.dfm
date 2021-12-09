object ServidorDCom: TServidorDCom
  OldCreateOrder = False
  OnCreate = RemoteDataModuleCreate
  Height = 265
  Width = 321
  object sqlqBuscaTodo: TSQLQuery
    MaxBlobSize = 1
    Params = <>
    SQL.Strings = (
      'select * '
      'from cliente'
      'order by identif')
    SQLConnection = sqlConnect
    Left = 32
    Top = 72
  end
  object dspBuscaTodo: TDataSetProvider
    DataSet = sqlqBuscaTodo
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 32
    Top = 134
  end
  object sqlConnect: TSQLConnection
    DriverName = 'MSSQL'
    LoginPrompt = False
    Params.Strings = (
      'SchemaOverride=%.dbo'
      'DriverUnit=Data.DBXMSSQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver180.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=18.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxMSSQLDr' +
        'iver180.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMSSQLDriver,Version=18.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMSSQL'
      
        'LibraryName=C:\Dop Proy\ProyMultiCapa\ProyServidorDcom\Win32\Deb' +
        'ug\dbxmss.dll'
      'VendorLib=sqlncli10.dll'
      'VendorLibWin64=sqlncli10.dll'
      'HostName=DAIRODELL\SQLEXPRESS'
      'DataBase=dop_prueba_dcom'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OSAuthentication=False'
      'PrepareSQL=True'
      'User_Name=sa'
      'Password=sqlserver'
      'BlobSize=-1'
      'ErrorResourceFile='
      'OS Authentication=False'
      'Prepare SQL=False')
    Left = 32
    Top = 8
  end
  object sqlqDinamico: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * '
      'from cliente'
      'order by identif')
    SQLConnection = sqlConnect
    Left = 112
    Top = 72
  end
  object dspDinamico: TDataSetProvider
    DataSet = sqlqDinamico
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 112
    Top = 134
  end
end
