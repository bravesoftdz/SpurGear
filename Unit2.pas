unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    EditBetg: TEdit;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    //
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
  osh: integer;
begin
  Input.Tipz := RadioGroup1.ItemIndex;

  if Input.Tipz = 0 then
    form1.ButtonTipz.Caption := 'AUTO';
  if Input.Tipz = 1 then
    form1.ButtonTipz.Caption := 'Прямой';
  if Input.Tipz = 2 then
  begin
    val(EditBetg.Text, Input.Betg, osh);
    form1.ButtonTipz.Caption := 'Косой    ' + floattostr(Input.Betg);
  end;
  if Input.Tipz = 3 then
  begin
    if FChild.CheckBox1.Checked then
    begin
      form1.ButtonTipz.Caption := 'Шевронный с канавкой';
      Input.Kanavka := 1;
    end
    else
    begin
      Input.Kanavka := 0;
      form1.ButtonTipz.Caption := 'Шевронный';
    end;
  end;

  close;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  close;
end;

procedure TForm2.RadioGroup1Click(Sender: TObject);
begin
  if RadioGroup1.ItemIndex = 2 then
  begin
    Label1.Visible := true;
    EditBetg.Visible := true;
  end;
  if RadioGroup1.ItemIndex <> 2 then
  begin
    Label1.Visible := False;
    EditBetg.Visible := False;
  end;
  if RadioGroup1.ItemIndex = 3 then
  begin
    CheckBox1.Visible := true;
  end;
  if RadioGroup1.ItemIndex <> 3 then
  begin
    CheckBox1.Visible := False;
  end;
end;

end.
