object FormPreview: TFormPreview
  Left = 0
  Top = 0
  Caption = 'FormPreview'
  ClientHeight = 451
  ClientWidth = 482
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  DesignSize = (
    482
    451)
  TextHeight = 15
  object Memo1: TMemo
    Left = 24
    Top = 47
    Width = 433
    Height = 378
    Anchors = [akLeft, akTop, akRight, akBottom]
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object Button1: TButton
    Left = 24
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
  end
end
