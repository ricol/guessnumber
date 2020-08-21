object FormMain: TFormMain
  Left = 373
  Top = 151
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #29468#25968#23383' - RICOL'
  ClientHeight = 344
  ClientWidth = 284
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 90
    Height = 12
    Caption = #35831#36755#20837'4'#20010#25968#23383#65306
  end
  object lblCommand: TLabel
    Left = 8
    Top = 30
    Width = 6
    Height = 12
  end
  object lblHelp: TLabel
    Left = 8
    Top = 271
    Width = 60
    Height = 12
    Caption = #24110#21161#65306'XAYB'
  end
  object BtnOk: TButton
    Left = 175
    Top = 3
    Width = 50
    Height = 24
    Caption = #30830#23450
    Enabled = False
    TabOrder = 0
    OnClick = BtnOkClick
  end
  object BtnReset: TButton
    Left = 231
    Top = 3
    Width = 49
    Height = 24
    Caption = #37325#29609
    TabOrder = 1
    OnClick = BtnResetClick
  end
  object EditNumber: TEdit
    Left = 104
    Top = 5
    Width = 65
    Height = 20
    TabOrder = 2
    OnKeyDown = EditNumberKeyDown
    OnKeyPress = EditNumberKeyPress
  end
  object ListBoxHistory: TListBox
    Left = 8
    Top = 48
    Width = 268
    Height = 213
    ItemHeight = 12
    TabOrder = 3
  end
end
