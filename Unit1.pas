unit Unit1;

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
    procedure btnAumentaLetraClick(Sender: TObject);
    procedure btnUtfClick(Sender: TObject);
    procedure btnAnsiClick(Sender: TObject);
  private
    function AumentarTexto(Str: string): string;
  public
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnCarregarClick(Sender: TObject);
var
  Arquivo: TStringList;
  Cont: Integer;
begin
  Arquivo := TStringList.Create;
  try
    Cont := 0;
    if odgAbrirPasta.Execute then
    begin
      mmoRecebe.Lines.Clear;
      Arquivo.LoadFromFile(odgAbrirPasta.FileName);
      mmoRecebe.Lines := Arquivo;
      btnSalvar.Enabled := True;

      for var Linha in Arquivo do
        Cont := Cont + Linha.Length;

      edtNPalavras.Text := IntToStr(Cont);
    end;
  finally
    Arquivo.Free;
  end;
end;

procedure TForm1.btnAnsiClick(Sender: TObject);
begin
  ShowMessage(AnsiString(mmoRecebe.Text));
end;

procedure TForm1.btnArquivoClick(Sender: TObject);
var
  Arquivo: file of Byte;
begin
  if odgAbrirPasta.Execute then
  begin
    AssignFile(Arquivo, odgAbrirPasta.FileName);
    try
      Reset(Arquivo);
      ShowMessage(IntToStr(FileSize(Arquivo)) + ' Bytes');
    finally
      CloseFile(Arquivo);
    end;
  end;
end;

procedure TForm1.btnMaiusculoClick(Sender: TObject);
begin
  edtusculo.Text := UpperCase(edtusculo.Text);
end;

procedure TForm1.btnNovoFormClick(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.btnMinusculoClick(Sender: TObject);
begin
  edtusculo.Text := LowerCase(edtusculo.Text);
end;

procedure TForm1.btnAumentaLetraClick(Sender: TObject);
begin
  edtusculo.Text := AumentarTexto(edtusculo.Text);
end;

procedure TForm1.btnSalvarClick(Sender: TObject);
var
  Arq: TextFile;
begin
  if sdgSalvarArquivo.Execute and (Trim(sdgSalvarArquivo.FileName) <> '') then
  begin
    AssignFile(Arq, sdgSalvarArquivo.FileName);
    try
      Rewrite(Arq);
      for var Linha in mmoRecebe.Lines do
        Writeln(Arq, Linha);
    finally
      CloseFile(Arq);
    end;
  end;
end;

procedure TForm1.btnUtfClick(Sender: TObject);
begin
  ShowMessage(UTF8String(mmoRecebe.Text));
end;

function TForm1.AumentarTexto(Str: String): String;
begin
  Str := LowerCase(Trim(Str));
  for var i := 1 to Length(Str) do
    if (i = 1) or (Str[i - 1] = ' ') then
      Str[i] := UpCase(Str[i]);
  Result := Str;
end;

end.
