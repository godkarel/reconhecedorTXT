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
    NPalavras: TEdit;
    procedure btnCarregarClick(Sender: TObject);
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
            Arquivo.LoadFromFile(AbrirPasta.FileName);

            for i := 0 to Arquivo.Count - 1 do
            begin
              Linha := Arquivo[i];
              for j := 0 to Length(Linha) do
                if Linha[j] in ['a' .. 'z', 'A' .. 'Z'] then
                  Inc(cont);
            end;
            NPalavras.Text := IntToStr(cont);
        end;

end;

end;