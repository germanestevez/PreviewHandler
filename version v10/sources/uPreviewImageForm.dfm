inherited FormPreviewImage: TFormPreviewImage
  Caption = 'FormPreviewImage'
  StyleElements = [seFont, seClient, seBorder]
  TextHeight = 15
  object img: TImage [0]
    Left = 0
    Top = 0
    Width = 508
    Height = 440
    Align = alClient
    Center = True
    Proportional = True
    Stretch = True
    Transparent = True
    ExplicitTop = -5
  end
  inherited pnlBotones: TPanel
    StyleElements = [seFont, seClient, seBorder]
    object sbAjustar: TSpeedButton [0]
      Left = 30
      Top = 1
      Width = 80
      Height = 23
      Action = actAjustar
      Align = alLeft
      ParentShowHint = False
      ShowHint = True
      ExplicitLeft = 1
      ExplicitTop = 6
    end
    object SepAjustar: TSplitter [1]
      Left = 110
      Top = 1
      Width = 6
      Height = 23
      Beveled = True
      ExplicitLeft = 81
    end
    object sbCopiar: TSpeedButton [2]
      Left = 116
      Top = 1
      Width = 23
      Height = 23
      Action = actCopy
      Align = alLeft
      ExplicitLeft = 368
      ExplicitTop = 8
      ExplicitHeight = 22
    end
    object SepCopiar: TSplitter [3]
      Left = 139
      Top = 1
      Width = 6
      Height = 23
      Beveled = True
      ExplicitLeft = 405
      ExplicitTop = -7
    end
    inherited pnlExtensión: TPanel
      Font.Height = -11
      ParentFont = False
      StyleElements = [seFont, seClient, seBorder]
    end
    object pnlTamaño: TPanel
      Left = 377
      Top = 1
      Width = 80
      Height = 23
      Align = alRight
      BevelOuter = bvLowered
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited alMain: TActionList
    object actAjustar: TAction
      Caption = 'Ajustar'
      Hint = 'Ajustar tama'#241'o a la ventana'
      OnExecute = actAjustarExecute
    end
    object actCopy: TAction
      Hint = 'Copiar el texto al portapapeles'
      ImageIndex = 6
      OnExecute = actCopyExecute
    end
  end
end
