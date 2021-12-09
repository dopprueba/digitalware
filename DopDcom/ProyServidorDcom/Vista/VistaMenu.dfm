object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 209
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 449
    Height = 146
    TabOrder = 0
    DesignSize = (
      449
      146)
    object Memo1: TMemo
      Left = 8
      Top = 8
      Width = 432
      Height = 128
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 0
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 160
    Width = 449
    Height = 41
    TabOrder = 1
    object btnSalir: TBitBtn
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 0
      OnClick = btnSalirClick
    end
  end
end
