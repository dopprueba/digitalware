object FVistaCliente: TFVistaCliente
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FVistaCliente'
  ClientHeight = 359
  ClientWidth = 473
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 456
    Height = 296
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 64
      Height = 13
      Caption = 'Identificaci'#243'n'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 37
      Height = 13
      Caption = 'Nombre'
    end
    object Label3: TLabel
      Left = 8
      Top = 104
      Width = 42
      Height = 13
      Caption = 'Tel'#233'fono'
    end
    object btnBuscar: TSpeedButton
      Left = 256
      Top = 8
      Width = 24
      Height = 24
      Caption = '...'
      OnClick = btnBuscarClick
    end
    object Label4: TLabel
      Left = 8
      Top = 72
      Width = 66
      Height = 13
      Caption = 'Repres. Legal'
    end
    object Label5: TLabel
      Left = 8
      Top = 136
      Width = 24
      Height = 13
      Caption = 'Email'
    end
    object Label6: TLabel
      Left = 8
      Top = 168
      Width = 84
      Height = 13
      Caption = 'Nombre Contacto'
    end
    object Label7: TLabel
      Left = 8
      Top = 200
      Width = 47
      Height = 13
      Caption = 'Vr. Activo'
    end
    object Label8: TLabel
      Left = 8
      Top = 232
      Width = 48
      Height = 13
      Caption = 'Vr. Pasivo'
    end
    object Label9: TLabel
      Left = 8
      Top = 264
      Width = 67
      Height = 13
      Caption = 'Vr. Patrimonio'
    end
    object edtIdentif: TEdit
      Left = 128
      Top = 8
      Width = 121
      Height = 21
      MaxLength = 20
      TabOrder = 0
      OnExit = edtIdentifExit
    end
    object edtNomb: TEdit
      Left = 128
      Top = 40
      Width = 312
      Height = 21
      MaxLength = 100
      TabOrder = 2
    end
    object edtNombRepresLegal: TEdit
      Left = 128
      Top = 72
      Width = 312
      Height = 21
      MaxLength = 100
      TabOrder = 3
    end
    object edtTelef: TEdit
      Left = 128
      Top = 104
      Width = 312
      Height = 21
      MaxLength = 50
      TabOrder = 4
    end
    object edtEmail: TEdit
      Left = 128
      Top = 136
      Width = 312
      Height = 21
      MaxLength = 100
      TabOrder = 5
    end
    object cbTipoIdentif: TComboBox
      Left = 288
      Top = 8
      Width = 152
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
    object edtNombCont: TEdit
      Left = 128
      Top = 168
      Width = 312
      Height = 21
      MaxLength = 100
      TabOrder = 6
    end
    object edtVrActivo: TEdit
      Left = 128
      Top = 200
      Width = 120
      Height = 21
      Alignment = taRightJustify
      TabOrder = 7
    end
    object edtVrPasivo: TEdit
      Left = 128
      Top = 232
      Width = 120
      Height = 21
      Alignment = taRightJustify
      TabOrder = 8
    end
    object edtVrPatrim: TEdit
      Left = 128
      Top = 264
      Width = 120
      Height = 21
      Alignment = taRightJustify
      TabOrder = 9
    end
  end
  object Panel3: TPanel
    Left = 8
    Top = 304
    Width = 456
    Height = 40
    TabOrder = 1
    object btnEditar: TBitBtn
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnBorrar: TBitBtn
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Borrar'
      TabOrder = 2
      OnClick = btnBorrarClick
    end
    object btnLimpiar: TBitBtn
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Limpiar'
      TabOrder = 3
      OnClick = btnLimpiarClick
    end
    object btnSalir: TBitBtn
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 4
      OnClick = btnSalirClick
    end
    object btnGrabar: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Grabar'
      TabOrder = 0
      OnClick = btnGrabarClick
    end
  end
  object cdsTipoIdentif: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 320
    Top = 216
    object cdsTipoIdentifCod: TStringField
      FieldName = 'Cod'
      Size = 5
    end
    object cdsTipoIdentifNomb: TStringField
      FieldName = 'Nomb'
      Size = 50
    end
  end
end
