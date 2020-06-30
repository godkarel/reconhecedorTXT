unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtDlgs;

type
  TForm1 = class(TForm)
    mmoRecebe: TMemo;
    AbrirPasta: TOpenTextFileDialog;
    btnCarregar: TButton;
    edtNPalavras: TEdit;
    edtusculo: TEdit;
    btnMaiusculo: TButton;
    Button1: TButton;
    btnArquivo: TButton;
    procedure btnCarregarClick(Sender: TObject);
    procedure btnMaiusculoClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnArquivoClick(Sender: TObject);
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
  i, j, cont: integer;


begin
    Arquivo := TStringList.Create;
    cont:= 0;
    if AbrirPasta.execute then
        begin
            mmoRecebe.Lines.Clear;
            mmoRecebe.Lines.LoadFromFile(AbrirPasta.FileName);
            Arquivo.LoadFromFile(AbrirPasta.FileName);

            for i := 0 to Arquivo.Count - 1 do
            begin
              Linha := Arquivo[i];
              for j := 0 to Length(Linha) do
                if Linha[j] in ['0'..'9', 'a' .. 'z', 'A' .. 'Z', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�',
                '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�' ,'�', '�', '�', '�', '�', '�' ,'�'] then
                  Inc(cont);
            end;
            edtNPalavras.Text := IntToStr(cont);
        end;

end;

procedure TForm1.btnArquivoClick(Sender: TObject);
var
Arquivo: file of Byte;
ArquivoTamanho: Longint;
begin
if AbrirPasta.Execute then
begin
AssignFile(Arquivo, AbrirPasta.FileName);
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

procedure TForm1.Button1Click(Sender: TObject);
var
  Conteudo : String;
  variavel : TBytes ;
begin
    Conteudo := edtusculo.Text;
    variavel := TEncoding.UTF8.GetBytes(Conteudo);
    edtusculo.Text := LowerCase(Conteudo);
end;

end.
