object FVistaMenu: TFVistaMenu
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FVistaMenu'
  ClientHeight = 177
  ClientWidth = 378
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 360
    Height = 120
    TabOrder = 0
    object Memo1: TMemo
      Left = 8
      Top = 8
      Width = 345
      Height = 105
      Lines.Strings = (
        'Cliente DCom.')
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 128
    Width = 360
    Height = 41
    TabOrder = 1
    object btnConfigDCom: TBitBtn
      Left = 8
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Config DCom'
      TabOrder = 0
      OnClick = btnConfigDComClick
    end
    object mostrarClienteBtn: TBitBtn
      Left = 104
      Top = 8
      Width = 88
      Height = 25
      Caption = 'vista Cliente'
      TabOrder = 1
      OnClick = mostrarClienteBtnClick
    end
    object btnSalir: TBitBtn
      Left = 200
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 2
      OnClick = btnSalirClick
    end
  end
end
