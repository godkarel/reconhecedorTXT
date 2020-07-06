object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 569
  ClientWidth = 444
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmoRecebe: TMemo
    Left = 48
    Top = 56
    Width = 361
    Height = 329
    Alignment = taCenter
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnCarregar: TButton
    Left = 151
    Top = 18
    Width = 97
    Height = 21
    Caption = 'CARREGAR'
    TabOrder = 1
    OnClick = btnCarregarClick
  end
  object edtNPalavras: TEdit
    Left = 271
    Top = 18
    Width = 138
    Height = 21
    Alignment = taCenter
    TabOrder = 2
    Text = 'Numero de Palavras'
  end
  object edtusculo: TEdit
    Left = 48
    Top = 446
    Width = 201
    Height = 21
    TabOrder = 3
    Text = 'Digite aqui'
  end
  object btnMaiusculo: TButton
    Left = 255
    Top = 444
    Width = 75
    Height = 25
    Caption = 'Maiusculo'
    TabOrder = 4
    OnClick = btnMaiusculoClick
  end
  object Button1: TButton
    Left = 336
    Top = 444
    Width = 75
    Height = 25
    Caption = 'Minusculo'
    TabOrder = 5
    OnClick = Button1Click
  end
  object btnArquivo: TButton
    Left = 48
    Top = 391
    Width = 121
    Height = 25
    Caption = 'Tamanho do Arquivo'
    TabOrder = 6
    OnClick = btnArquivoClick
  end
  object btnSave: TButton
    Left = 48
    Top = 18
    Width = 97
    Height = 21
    Caption = 'SALVAR'
    TabOrder = 7
    OnClick = btnSaveClick
  end
  object btnNovoForm: TButton
    Left = 336
    Top = 528
    Width = 100
    Height = 33
    Caption = 'Novo Form'
    TabOrder = 8
    OnClick = btnNovoFormClick
  end
  object Button2: TButton
    Left = 48
    Top = 480
    Width = 145
    Height = 25
    Caption = 'Aumentar Primeira Letra'
    TabOrder = 9
    OnClick = Button2Click
  end
  object AbrirPasta: TOpenTextFileDialog
    Filter = '|*.txt'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 16
    Top = 136
  end
  object SalvarArquivo: TSaveDialog
    Filter = 'arquivo.txt|*.txt'
    Left = 16
    Top = 88
  end
end
