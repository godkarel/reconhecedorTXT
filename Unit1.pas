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
    Edit1: TEdit;
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
var i:Integer;

begin
    if AbrirPasta.execute then
        begin
            mmoRecebe.Lines.Clear;
            mmoRecebe.Lines.LoadFromFile(AbrirPasta.FileName);
        end;

end;

end.
