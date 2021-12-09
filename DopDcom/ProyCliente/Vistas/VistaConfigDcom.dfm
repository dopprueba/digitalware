object FVistaConfigDcom: TFVistaConfigDcom
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FVistaConfigDcom'
  ClientHeight = 162
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 504
    Height = 104
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 77
      Height = 13
      Caption = 'Computer Name'
    end
    object Label3: TLabel
      Left = 8
      Top = 40
      Width = 60
      Height = 13
      Caption = 'Server GUID'
    end
    object Label2: TLabel
      Left = 8
      Top = 72
      Width = 62
      Height = 13
      Caption = 'Server Name'
    end
    object editDcomComputerName: TEdit
      Left = 104
      Top = 8
      Width = 280
      Height = 21
      TabOrder = 0
      Text = 'Desar1-dxe4'
    end
    object editDcomServerGuid: TEdit
      Left = 104
      Top = 40
      Width = 280
      Height = 21
      TabOrder = 1
      Text = '{D09B6709-AA0A-43E4-A13D-EAD183B45958}'
    end
    object editDcomServerName: TEdit
      Left = 104
      Top = 72
      Width = 280
      Height = 21
      TabOrder = 2
      Text = 'DopServidorDCom.ServidorDCom'
    end
    object btnCompName: TBitBtn
      Left = 400
      Top = 8
      Width = 75
      Height = 25
      Caption = 'set'
      TabOrder = 3
      OnClick = btnCompNameClick
    end
    object btnServerGuid: TBitBtn
      Left = 400
      Top = 40
      Width = 75
      Height = 25
      Caption = 'set'
      TabOrder = 4
      OnClick = btnServerGuidClick
    end
    object btnServerName: TBitBtn
      Left = 400
      Top = 72
      Width = 75
      Height = 25
      Caption = 'set'
      TabOrder = 5
      OnClick = btnServerNameClick
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 112
    Width = 504
    Height = 41
    TabOrder = 1
    object btnConectar: TBitBtn
      Left = 104
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Conectar'
      TabOrder = 0
      OnClick = btnConectarClick
    end
    object btnSalir: TBitBtn
      Left = 208
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Salir'
      TabOrder = 1
      OnClick = btnSalirClick
    end
  end
end
