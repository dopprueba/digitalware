object FVistaMenu: TFVistaMenu
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'FVistaMenu'
  ClientHeight = 202
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 449
    Height = 144
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object edtNro: TEdit
      Left = 56
      Top = 5
      Width = 56
      Height = 21
      NumbersOnly = True
      TabOrder = 0
    end
    object memoSerie: TMemo
      Left = 8
      Top = 32
      Width = 433
      Height = 105
      ReadOnly = True
      ScrollBars = ssHorizontal
      TabOrder = 1
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 152
    Width = 449
    Height = 41
    TabOrder = 1
    object btnCalcular: TBitBtn
      Left = 144
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Calcular'
      TabOrder = 0
      OnClick = btnCalcularClick
    end
    object btnSalir: TBitBtn
      Left = 224
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 1
      OnClick = btnSalirClick
    end
  end
end
