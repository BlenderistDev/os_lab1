object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 502
  ClientWidth = 681
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 184
    Height = 13
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1072#1076#1088#1077#1089' '#1074#1080#1088#1090#1091#1072#1083#1100#1085#1086#1081' '#1087#1072#1084#1103#1090#1080
  end
  object Button1: TButton
    Left = 24
    Top = 208
    Width = 75
    Height = 25
    Caption = 'SysInfo'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 120
    Top = 208
    Width = 105
    Height = 25
    Caption = 'GlobalMemoryStatus'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 133
    Top = 152
    Width = 75
    Height = 25
    Caption = 'VirtualQuery'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 264
    Top = 208
    Width = 75
    Height = 25
    Caption = 'VirtualAlloc'
    TabOrder = 3
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 264
    Top = 152
    Width = 75
    Height = 25
    Caption = 'VirtualFree'
    TabOrder = 4
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 24
    Top = 152
    Width = 75
    Height = 25
    Caption = 'VirtualProtect'
    TabOrder = 5
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 133
    Top = 448
    Width = 75
    Height = 25
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 6
    OnClick = Button7Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'Edit1'
  end
  object Memo1: TMemo
    Left = 352
    Top = 0
    Width = 321
    Height = 505
    Lines.Strings = (
      'Memo1')
    TabOrder = 8
  end
  object Edit2: TEdit
    Left = 24
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 9
    Text = 'Edit2'
  end
end
