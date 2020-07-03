unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    mmoSalva: TMemo;
    btnSalva: TButton;
    Save: TSaveDialog;
    procedure btnSalvaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.btnSalvaClick(Sender: TObject);
begin
  if Save.Execute then
  begin
    mmoSalva.Lines.SaveToFile(Save.FileName);
  end;
end;

end.
