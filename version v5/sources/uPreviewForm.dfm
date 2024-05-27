object FormPreview: TFormPreview
  Left = 0
  Top = 0
  Caption = 'FormPreview'
  ClientHeight = 465
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object mmFile: TMemo
    Left = 0
    Top = 0
    Width = 488
    Height = 440
    Align = alClient
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Consolas'
    Font.Style = []
    Lines.Strings = (
      
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ' +
        'eiusmod tempor incididunt ut labore et dolore magna aliqua. '
      
        'Ut enim ad minim veniam, quis nostrud exercitation ullamco labor' +
        'is nisi ut aliquip ex ea commodo consequat. '
      
        'Duis aute irure dolor in reprehenderit in voluptate velit esse c' +
        'illum dolore eu fugiat nulla pariatur. '
      
        'Excepteur sint occaecat cupidatat non proident, sunt in culpa qu' +
        'i officia deserunt mollit anim id est laborum.')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 0
    WordWrap = False
  end
  object pnlBotones: TPanel
    Left = 0
    Top = 440
    Width = 488
    Height = 25
    Align = alBottom
    TabOrder = 1
    object sbWordWrap: TSpeedButton
      Left = 1
      Top = 1
      Width = 80
      Height = 23
      Align = alLeft
      Caption = 'WordWrap'
      OnClick = sbWordWrapClick
    end
    object sbMayor: TSpeedButton
      Left = 81
      Top = 1
      Width = 23
      Height = 23
      Align = alLeft
      Caption = '+'
      OnClick = sbMayorClick
      ExplicitLeft = 115
      ExplicitTop = 6
      ExplicitHeight = 22
    end
    object sbMenor: TSpeedButton
      Left = 104
      Top = 1
      Width = 23
      Height = 23
      Align = alLeft
      Caption = '-'
      OnClick = sbMenorClick
      ExplicitLeft = 144
      ExplicitTop = 8
      ExplicitHeight = 22
    end
  end
end
