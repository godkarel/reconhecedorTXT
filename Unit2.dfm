object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 143
  ClientWidth = 300
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object labCod: TLabel
    Left = 8
    Top = 83
    Width = 157
    Height = 25
    Caption = 'Tamanho em Bytes'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Nyala'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnCodificar: TButton
    Left = 8
    Top = 8
    Width = 113
    Height = 33
    Caption = 'Codificar'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Nyala'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = btnCodificarClick
  end
  object edtCodificar: TEdit
    Left = 8
    Top = 47
    Width = 289
    Height = 21
    TabOrder = 1
  end
  object edtCodificado: TEdit
    Left = 8
    Top = 114
    Width = 289
    Height = 21
    TabOrder = 2
  end
  object btnDecodificar: TButton
    Left = 179
    Top = 8
    Width = 113
    Height = 33
    Caption = 'Decodificar'
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Nyala'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = btnDecodificarClick
  end
end
