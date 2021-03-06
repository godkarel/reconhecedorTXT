﻿unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Unit2, Vcl.ExtDlgs;

type
  TForm1 = class(TForm)
    mmoRecebe: TMemo;
    odgAbrirPasta: TOpenTextFileDialog;
    btnCarregar: TButton;
    edtNPalavras: TEdit;
    edtusculo: TEdit;
    btnMaiusculo: TButton;
    btnMinusculo: TButton;
    btnArquivo: TButton;
    btnSalvar: TButton;
    sdgSalvarArquivo: TSaveDialog;
    btnNovoForm: TButton;
    btnAumentaLetra: TButton;
    btnUtf: TButton;
    btnAnsi: TButton;
    procedure btnCarregarClick(Sender: TObject);
    procedure btnMaiusculoClick(Sender: TObject);
    procedure btnMinusculoClick(Sender: TObject);
    procedure btnArquivoClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoFormClick(Sender: TObject);
    function AumentarTexto(Str: string): string;
    procedure btnAumentaLetraClick(Sender: TObject);
    procedure btnUtfClick(Sender: TObject);
    procedure btnAnsiClick(Sender: TObject);
  private
    { Private declarations }


  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.btnCarregarClick(Sender: TObject);
var
  Arquivo: TStringList;
  Linha: String;
  i, j, Cont: Integer;


begin
    Arquivo := TStringList.Create;
    cont:= 0;
    if odgAbrirPasta.Execute then
        begin

            mmoRecebe.Lines.Clear;
            mmoRecebe.Lines.LoadFromFile(odgAbrirPasta.FileName);
            Arquivo.LoadFromFile(odgAbrirPasta.FileName);
            btnSalvar.Enabled := True;
            for i := 0 to Arquivo.Count - 1 do
            begin
              Linha := Arquivo[i];

              for j := 0 to Length(Linha) - 1 do
                if Linha.Chars[j] in ['0'..'9', 'a' .. 'z', 'A' .. 'Z', 'á', 'à', 'ã',
                                      'Á', 'À', 'Ã', 'è', 'é', 'É', 'È', 'í', 'ì', 'Í',
                                      'Ì', 'ó', 'ò', 'õ', 'Ó', 'Ò', 'Õ', 'ú', 'ù', 'Ú',
                                      'Ù', 'â', 'ê', 'î' ,'ô', 'û', 'Â', 'Ê', 'Î', 'Ô', 'Û'] then
                  Inc(Cont);
            end;
            edtNPalavras.Text := IntToStr(Cont);
        end;

end;

procedure TForm1.btnAnsiClick(Sender: TObject);
var
  messageAnsi: AnsiString;
begin
  messageAnsi:= mmoRecebe.Text;
  ShowMessage(messageAnsi);
end;

procedure TForm1.btnArquivoClick(Sender: TObject);
var
  Arquivo: file of Byte;
  ArquivoTamanho: Longint;
begin
if odgAbrirPasta.Execute then
  begin
    AssignFile(Arquivo, odgAbrirPasta.FileName);
    Reset(Arquivo);
    ArquivoTamanho := FileSize(Arquivo);
    ShowMessage (IntToStr (FileSize (Arquivo)) + ' Bytes');
  end;
end;

procedure TForm1.btnMaiusculoClick(Sender: TObject);
var
  Conteudo : String;
begin
  Conteudo := edtusculo.Text;
  UTF8Encode(Conteudo);
  edtusculo.Text := UpperCase(Conteudo);
end;

procedure TForm1.btnNovoFormClick(Sender: TObject);
begin
  Form2.Show
end;

procedure TForm1.btnMinusculoClick(Sender: TObject);
var
  Conteudo : String;
  Variavel : TBytes ;
begin
  Conteudo := edtusculo.Text;
  edtusculo.Text := LowerCase(Conteudo);
end;

procedure TForm1.btnAumentaLetraClick(Sender: TObject);
var
  TextoAumentado: String;
begin
  TextoAumentado := edtusculo.Text;
  TextoAumentado := AumentarTexto(TextoAumentado);
  edtusculo.Text := TextoAumentado;
end;

procedure TForm1.btnSalvarClick(Sender: TObject);
var
Arq: Textfile;
i : Integer;
TextoCod : String;
begin
  i := 1;
  if sdgSalvarArquivo.Execute then
    if trim(sdgSalvarArquivo.FileName) <> '' then
    begin
      AssignFile(Arq,sdgSalvarArquivo.FileName);
      if FileExists(sdgSalvarArquivo.FileName) then
        Append(Arq)
      else
        Rewrite(Arq);
        while not ( i = mmoRecebe.Lines.Count ) do
        begin
          Writeln(Arq,mmoRecebe.Lines.Strings[i]);
          inc(i);
        end;
        System.Close(Arq);
    end;
end;

procedure TForm1.btnUtfClick(Sender: TObject);
var

messageUnicode: UTF8String;
begin
  messageUnicode:= mmoRecebe.Text;
  ShowMessage(messageUnicode)
end;

function TForm1.AumentarTexto(Str: String): String;
var
  i: Integer;
  Esp: Boolean;
begin
  Str := LowerCase(Trim(Str));
  for i := 1 to Length(Str) do
  begin
    if i = 1 then
      Str[i] := UpCase(Str[i])
    else
      begin
        if i <> Length(Str) then
        begin
          Esp := (Str[i] = ' ');

        if esp then
          Str[i+1] := UpCase(Str[i+1]);
        end;
      end;
  end;
  Result := Str;
end;

end.
