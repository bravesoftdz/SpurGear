unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, CALCULAT008;

type
  TForm4 = class(TForm)
    Label2: TLabel;
    EditU: TEdit;
    EditDeltaU: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure EditUKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  clas1: CalculateCWheel;
  st: string;
implementation

uses Unit1;
{$R *.dfm}

procedure TForm4.Button1Click(Sender: TObject);
begin
  st := EditU.Text;
  input.U := StrToFloat(st);
end;

procedure TForm4.EditUKeyPress(Sender: TObject; var Key: Char);
var i:integer;
begin
if Key='.' then
  Key:=',';
if not(Key in ['0' .. '9', FormatSettings.DecimalSeparator, #8]) then
    Key := #0;
 for i := 0 to Length(EditU.Text) do
    if (Key = FormatSettings.DecimalSeparator) and (EditU.Text[i]=FormatSettings.DecimalSeparator) then
      Key := #0;

end;

procedure TForm4.FormShow(Sender: TObject);
begin
  EditU.Text := FloatToStr(Input.u);
  EditDeltaU.Text := floattostr(Input.DeltaU);
end;

end.
