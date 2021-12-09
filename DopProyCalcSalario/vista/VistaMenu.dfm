object Form2: TForm2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Form2'
  ClientHeight = 203
  ClientWidth = 466
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
    Width = 449
    Height = 144
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Empleado'
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 85
      Height = 13
      Caption = 'Horas Trabajadas'
    end
    object edtNomb: TEdit
      Left = 112
      Top = 8
      Width = 329
      Height = 21
      MaxLength = 100
      TabOrder = 0
    end
    object edtHorasTrab: TEdit
      Left = 112
      Top = 40
      Width = 88
      Height = 21
      NumbersOnly = True
      TabOrder = 1
    end
    object Memo1: TMemo
      Left = 8
      Top = 72
      Width = 433
      Height = 64
      ReadOnly = True
      TabOrder = 2
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 152
    Width = 449
    Height = 41
    TabOrder = 1
    object btnCalcular: TBitBtn
      Left = 136
      Top = 8
      Width = 99
      Height = 25
      Caption = 'Calcular Salario'
      TabOrder = 0
      OnClick = btnCalcularClick
    end
    object btnSalir: TBitBtn
      Left = 240
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 1
      OnClick = btnSalirClick
    end
  end
end
