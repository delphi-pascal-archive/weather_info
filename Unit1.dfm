object Form1: TForm1
  Left = 244
  Top = 126
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Weather info'
  ClientHeight = 649
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00CCC0
    000CCCC0000000000CCCC7777CCCCCCC0000CCCC00000000CCCC7777CCCCCCCC
    C0000CCCCCCCCCCCCCC7777CCCCC0CCCCC0000CCCCCCCCCCCC7777CCCCC700CC
    C00CCCC0000000000CCCC77CCC77000C0000CCCC00000000CCCC7777C7770000
    00000CCCC000000CCCC777777777C000C00000CCCC0000CCCC77777C777CCC00
    CC00000CCCCCCCCCC77777CC77CCCCC0CCC000CCCCC00CCCCC777CCC7CCCCCCC
    CCCC0CCCCCCCCCCCCCC7CCCCCCCCCCCC0CCCCCCCCCCCCCCCCCCCCCC7CCC70CCC
    00CCCCCCCC0CC0CCCCCCCC77CC7700CC000CCCCCC000000CCCCCC777CC7700CC
    0000CCCC00000000CCCC7777CC7700CC0000C0CCC000000CCC7C7777CC7700CC
    0000C0CCC000000CCC7C7777CC7700CC0000CCCC00000000CCCC7777CC7700CC
    000CCCCCC000000CCCCCC777CC7700CC00CCCCCCCC0CC0CCCCCCCC77CC770CCC
    0CCCCCCCCCCCCCCCCCCCCCC7CCC7CCCCCCCC0CCCCCCCCCCCCCC7CCCCCCCCCCC0
    CCC000CCCCC00CCCCC777CCC7CCCCC00CC00000CCCCCCCCCC77777CC77CCC000
    C00000CCCC0000CCCC77777C777C000000000CCCC000000CCCC777777777000C
    0000CCCC00000000CCCC7777C77700CCC00CCCC0000000000CCCC77CCC770CCC
    CC0000CCCCCCCCCCCC7777CCCCC7CCCCC0000CCCCCCCCCCCCCC7777CCCCCCCCC
    0000CCCC00000000CCCC7777CCCCCCC0000CCCC0000000000CCCC7777CCC0000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    0000000000000000000000000000000000000000000000000000000000000000
    000000000000000000000000000000000000000000000000000000000000}
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 120
  TextHeight = 16
  object Label1: TLabel
    Left = 8
    Top = 20
    Width = 77
    Height = 16
    Caption = 'City ('#1075#1086#1088#1086#1076'):'
  end
  object Label2: TLabel
    Left = 8
    Top = 51
    Width = 127
    Height = 16
    Caption = 'PartnerID ('#1087#1072#1088#1090#1085#1077#1088'):'
  end
  object Label3: TLabel
    Left = 8
    Top = 82
    Width = 140
    Height = 16
    Caption = 'LicenseID ('#1083#1080#1094#1077#1085#1079#1080#1103'):'
  end
  object Label4: TLabel
    Left = 8
    Top = 114
    Width = 132
    Height = 16
    Caption = 'UnitValue ('#1084#1077#1090#1088#1080#1082#1072'):'
  end
  object Label5: TLabel
    Left = 8
    Top = 145
    Width = 202
    Height = 16
    Caption = #1050#1086#1083'-'#1074#1086' '#1087#1088#1086#1075#1085#1086#1079#1080#1088#1091#1077#1084#1099#1093' '#1076#1085#1077#1081':'
  end
  object Button1: TButton
    Left = 8
    Top = 168
    Width = 353
    Height = 25
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1080#1085#1092#1086#1088#1084#1072#1094#1080#1102' '#1086' '#1087#1086#1075#1086#1076#1077
    TabOrder = 0
    OnClick = Button1Click
  end
  object Ed1: TEdit
    Left = 96
    Top = 8
    Width = 265
    Height = 25
    TabOrder = 1
    Text = 'Moscow'
  end
  object Ed2: TEdit
    Left = 144
    Top = 40
    Width = 217
    Height = 25
    TabOrder = 2
    Text = '1006341644'
  end
  object Ed3: TEdit
    Left = 160
    Top = 72
    Width = 201
    Height = 25
    TabOrder = 3
    Text = '0647abc97052c741'
  end
  object Ed4: TEdit
    Left = 152
    Top = 104
    Width = 209
    Height = 25
    TabOrder = 4
    Text = 'm'
  end
  object Memo1: TMemo
    Left = 8
    Top = 200
    Width = 353
    Height = 441
    ScrollBars = ssBoth
    TabOrder = 5
  end
  object Ed5: TEdit
    Left = 216
    Top = 135
    Width = 145
    Height = 26
    TabOrder = 6
    Text = '4'
  end
end
