object FVistaConsultar: TFVistaConsultar
  Left = 0
  Top = 0
  Caption = 'FVistaConsultar'
  ClientHeight = 209
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    527
    209)
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 512
    Height = 145
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    DesignSize = (
      512
      145)
    object dbg: TDBGrid
      Left = 8
      Top = 8
      Width = 496
      Height = 129
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = ds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'identif'
          Width = 144
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nombre'
          Width = 304
          Visible = True
        end>
    end
  end
  object Panel2: TPanel
    Left = 8
    Top = 160
    Width = 512
    Height = 41
    Anchors = [akLeft, akRight]
    TabOrder = 1
    object labCant: TLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 13
      Caption = 'labCant'
    end
    object btnAceptar: TBitBtn
      Left = 128
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Aceptar'
      Default = True
      TabOrder = 0
      OnClick = btnAceptarClick
    end
    object btnSalir: TBitBtn
      Left = 216
      Top = 8
      Width = 75
      Height = 25
      Cancel = True
      Caption = 'Salir'
      TabOrder = 1
      OnClick = btnSalirClick
    end
  end
  object ds: TDataSource
    DataSet = DataMod1.cds
    Left = 112
    Top = 56
  end
end
