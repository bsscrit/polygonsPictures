object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 355
  ClientWidth = 447
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 8
    Top = 8
    Width = 300
    Height = 300
  end
  object Button1: TButton
    Left = 311
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 314
    Top = 55
    Width = 75
    Height = 25
    Caption = 'Stop'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 314
    Top = 86
    Width = 121
    Height = 21
    TabOrder = 2
    Text = ' '
  end
  object Button3: TButton
    Left = 314
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 314
    Top = 167
    Width = 75
    Height = 25
    Caption = '>'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 314
    Top = 198
    Width = 75
    Height = 25
    Caption = '<'
    TabOrder = 5
  end
  object Button6: TButton
    Left = 312
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Button6'
    TabOrder = 6
    OnClick = Button6Click
  end
end
