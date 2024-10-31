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
    procedure ToggleButtons(IsEncoded: Boolean);
  public
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.ToggleButtons(IsEncoded: Boolean);
begin
  btnCodificar.Enabled := not IsEncoded;
  btnDecodificar.Enabled := IsEncoded;
end;

procedure TForm2.btnCodificarClick(Sender: TObject);
var
  TextoCodificado: String;
  ByteCodificado: TBytes;
begin
  TextoCodificado := edtCodificar.Text;
  if TextoCodificado.IsEmpty then
  begin
    ShowMessage('Por favor, insira um texto para codificar.');
    Exit;
  end;

  ByteCodificado := TEncoding.UTF8.GetBytes(TextoCodificado);
  edtCodificado.Text := TEncoding.UTF8.GetString(ByteCodificado);
  edtCodificar.Clear;
  ToggleButtons(True);
end;

procedure TForm2.btnDecodificarClick(Sender: TObject);
var
  TextoCodificado: TBytes;
begin
  if edtCodificado.Text.IsEmpty then
  begin
    ShowMessage('Por favor, insira um texto codificado para decodificar.');
    Exit;
  end;

  TextoCodificado := TEncoding.UTF8.GetBytes(edtCodificado.Text);
  edtCodificar.Text := TEncoding.UTF8.GetString(TextoCodificado);
  edtCodificado.Clear;
  ToggleButtons(False);
end;

end.
