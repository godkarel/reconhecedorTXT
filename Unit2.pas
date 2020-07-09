unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    btnCodificar: TButton;
    edtCodificar: TEdit;
    edtCodificado: TEdit;
    btnDecodificar: TButton;
    labCod: TLabel;
    procedure btnCodificarClick(Sender: TObject);
    procedure btnDecodificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  TextoCodificado : string;
  ByteCodificado : TBytes;
implementation

{$R *.dfm}

procedure TForm2.btnCodificarClick(Sender: TObject);
begin
  TextoCodificado := edtCodificar.Text;
  ByteCodificado := TEncoding.UTF8.GetBytes(TextoCodificado);
  edtCodificado.text := IntToStr(SizeOf(ByteCodificado));
  edtCodificar.Clear;
  btnCodificar.Enabled := false;
  btnDecodificar.Enabled := true;
end;

procedure TForm2.btnDecodificarClick(Sender: TObject);
begin
  edtCodificar.Text := TEncoding.UTF8.GetString(ByteCodificado);
  edtCodificado.Clear;
  btnCodificar.Enabled := true;
  btnDecodificar.Enabled := false;
end;

end.
