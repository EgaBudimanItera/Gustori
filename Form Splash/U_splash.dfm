object Frm_Splas: TFrm_Splas
  Left = 175
  Top = 167
  BorderStyle = bsNone
  Caption = 'Frm_Splas'
  ClientHeight = 86
  ClientWidth = 581
  Color = clBlue
  TransparentColor = True
  TransparentColorValue = clBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object shp1: TShape
    Left = 1
    Top = 2
    Width = 577
    Height = 81
    Brush.Color = clBackground
    Shape = stRoundRect
  end
  object lbl_1: TLabel
    Left = 144
    Top = 12
    Width = 270
    Height = 19
    Caption = '.: Aplikasi Sisa Hasil Usaha Ver. 1.0 :.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Century Gothic'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object pb1: TProgressBar
    Left = 8
    Top = 50
    Width = 561
    Height = 23
    TabOrder = 0
  end
  object tmr1: TTimer
    OnTimer = tmr1Timer
    Left = 504
    Top = 16
  end
end
