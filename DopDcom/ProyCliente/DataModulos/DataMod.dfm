object DataMod1: TDataMod1
  OldCreateOrder = False
  Height = 144
  Width = 256
  object DCOMConnect: TDCOMConnection
    ServerGUID = '{D09B6709-AA0A-43E4-A13D-EAD183B45958}'
    ServerName = 'DopServidorDCom.ServidorDCom'
    Left = 159
    Top = 8
  end
  object cds: TClientDataSet
    Aggregates = <>
    DisableStringTrim = True
    Params = <>
    ProviderName = 'dspBuscaTodo'
    RemoteServer = DCOMConnect
    Left = 16
    Top = 8
    object cdsid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsidentif: TStringField
      FieldName = 'identif'
      Required = True
    end
    object cdstipo_identif: TStringField
      FieldName = 'tipo_identif'
      Required = True
      Size = 5
    end
    object cdsnombre: TStringField
      FieldName = 'nombre'
      Required = True
      Size = 100
    end
    object cdsnombre_repres_legal: TStringField
      FieldName = 'nombre_repres_legal'
      Size = 100
    end
    object cdstelefono: TStringField
      FieldName = 'telefono'
      Size = 50
    end
    object cdsemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object cdsnombre_contacto: TStringField
      FieldName = 'nombre_contacto'
      Size = 100
    end
    object cdsvr_activo: TFMTBCDField
      FieldName = 'vr_activo'
      Required = True
      Precision = 19
      Size = 4
    end
    object cdsvr_pasivo: TFMTBCDField
      FieldName = 'vr_pasivo'
      Required = True
      Precision = 19
      Size = 4
    end
    object cdsvr_patrim: TFMTBCDField
      FieldName = 'vr_patrim'
      Required = True
      Precision = 19
      Size = 4
    end
  end
  object ds: TDataSource
    DataSet = cds
    Left = 64
    Top = 8
  end
  object cdsDinam: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDinamico'
    RemoteServer = DCOMConnect
    Left = 16
    Top = 64
    object cdsDinamid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cdsDinamidentif: TStringField
      FieldName = 'identif'
      Required = True
    end
    object cdsDinamtipo_identif: TStringField
      FieldName = 'tipo_identif'
      Required = True
      Size = 5
    end
    object cdsDinamnombre: TStringField
      FieldName = 'nombre'
      Required = True
      Size = 100
    end
    object cdsDinamnombre_repres_legal: TStringField
      FieldName = 'nombre_repres_legal'
      Size = 100
    end
    object cdsDinamtelefono: TStringField
      FieldName = 'telefono'
      Size = 50
    end
    object cdsDinamemail: TStringField
      FieldName = 'email'
      Size = 100
    end
    object cdsDinamnombre_contacto: TStringField
      FieldName = 'nombre_contacto'
      Size = 100
    end
    object cdsDinamvr_activo: TFMTBCDField
      FieldName = 'vr_activo'
      Required = True
      Precision = 19
      Size = 4
    end
    object cdsDinamvr_pasivo: TFMTBCDField
      FieldName = 'vr_pasivo'
      Required = True
      Precision = 19
      Size = 4
    end
    object cdsDinamvr_patrim: TFMTBCDField
      FieldName = 'vr_patrim'
      Required = True
      Precision = 19
      Size = 4
    end
  end
  object dsDinam: TDataSource
    DataSet = cdsDinam
    Left = 64
    Top = 64
  end
end
