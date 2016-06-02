unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CALCULAT008, Vcl.Samples.Spin, Vcl.ComCtrls, Grids,
  Materials, Unit2, constants, unit4, unit5;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    EditP1: TEdit;
    Label2: TLabel;
    EditN1: TEdit;
    Label3: TLabel;
    EditU: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Label9: TLabel;
    Edit4: TEdit;
    Label8: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    Label13: TLabel;
    Label14: TLabel;
    ComboBox9: TComboBox;
    ComboBox10: TComboBox;
    Label15: TLabel;
    Label16: TLabel;
    ComboBox11: TComboBox;
    ComboBox12: TComboBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    CheckBox1: TCheckBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    CheckBox3: TCheckBox;
    Label23: TLabel;
    CheckBox4: TCheckBox;
    Label25: TLabel;
    Label28: TLabel;
    CheckBox2: TCheckBox;
    PageControl1: TPageControl;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    ButtonTipz: TButton;
    ButtonNom_Sx: TButton;
    SpinEditZw: TSpinEdit;
    ComboBox5: TComboBox;
    Label26: TLabel;
    ComboBox6: TComboBox;
    ComboBox13: TComboBox;
    TabSheet1: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure ButtonTipzClick(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure EditP1Exit(Sender: TObject);
    procedure EditN1Exit(Sender: TObject);
    procedure EditUExit(Sender: TObject);
    procedure Editp1KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure SpinEditZwExit(Sender: TObject);
    procedure EditUKeyPress(Sender: TObject; var Key: Char);
    procedure EditUClick(Sender: TObject);
    procedure ButtonNom_SxClick(Sender: TObject);
    procedure Edit4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  clas: CalculateCWheel;
  FChild: TForm2;
  FChild1: TForm4;
  FChild2: TForm5;
  mascount1, oo: integer;
  masOutput1: array of TMyOutput;
  masInput1: array of TMyInput;
  Form1: TForm1;
  FileName: string;
  i, k: integer;
  Input, Input1: TMyInput;
  Output: TMyOutput;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  Error: byte;
  p, osh: integer;
  termobr11, termobr21, zagotowka1, zagotowka2, wkrug1, wkrug2,
  // ��������� �������� �������� � ������
  Wikrugka1, Wikrugka2: string; // ���������� ����������
begin
  while PageControl1.PageCount > 0 do
    PageControl1.Pages[0].Free;
  Input.TipZ := 1;
  val(EditP1.Text, Input.p1, osh);
  val(EditN1.Text, Input.N1, osh);
  Input.U:=StrToFloat(EditU.Text);
  val(Edit4.Text, Input.Lh, osh);
  Input.mc1 := ComboBox1.Text;
  if ComboBox2.Text = '���������' then
    Input.Termobr1 := 1;
  if ComboBox2.Text = '������������' then
    Input.Termobr1 := 2;
  if ComboBox2.Text = '�������� �������' then
    Input.Termobr1 := 3;
  if ComboBox2.Text = '������� ���' then
    Input.Termobr1 := 4;
  if ComboBox2.Text = '����������' then
    Input.Termobr1 := 5;
  if ComboBox2.Text = '���������������' then
    Input.Termobr1 := 6;
  Input.mc2 := ComboBox3.Text;
  if ComboBox4.Text = '���������' then
    Input.Termobr2 := 1;
  if ComboBox4.Text = '������������' then
    Input.Termobr2 := 2;
  if ComboBox4.Text = '�������� �������' then
    Input.Termobr2 := 3;
  if ComboBox4.Text = '������� ���' then
    Input.Termobr2 := 4;
  if ComboBox4.Text = '����������' then
    Input.Termobr2 := 5;
  if ComboBox4.Text = '���������������' then
    Input.Termobr2 := 6;
  Input.ImprovStrength[1] := CheckBox5.Checked; //�������������� ���������� ��������
  Input.ImprovStrength[2] := CheckBox6.Checked; //�������������� ���������� ������
  if ComboBox7.Text = 'Ra1.6' then //������������� ��������
    Input.Ra1 := 0;
  if ComboBox7.Text = 'Ra3.2' then
    Input.Ra1 := 1;
  if ComboBox7.Text = 'Ra6.3' then
    Input.Ra1 := 2;
  if ComboBox8.Text = 'Ra1.6' then  //������������� ������
    Input.Ra2 := 0;
  if ComboBox8.Text = 'Ra3.2' then
    Input.Ra2 := 1;
  if ComboBox8.Text = 'Ra6.3' then
    Input.Ra2 := 2;
  if ComboBox9.Text = '�������' then  //��������� ��������
    Input.Zagotowka[1] := 0;
  if ComboBox9.Text = '���������' then
    Input.Zagotowka[1] := 1;
  if ComboBox9.Text = '������' then
    Input.Zagotowka[1] := 2;
  if ComboBox9.Text = '�������' then
    Input.Zagotowka[1] := 3;
  if ComboBox10.Text = '�������' then  //��������� ������
    Input.Zagotowka[2] := 0;
  if ComboBox10.Text = '���������' then
    Input.Zagotowka[2] := 1;
  if ComboBox10.Text = '������' then
    Input.Zagotowka[2] := 2;
  if ComboBox10.Text = '�������' then
    Input.Zagotowka[2] := 3;
  if ComboBox11.Text = '������������' then //��������� �������� ��������
    Input.motw[1] := 0;
  if ComboBox11.Text = '����������' then
    Input.motw[1] := 1;
  if ComboBox11.Text = '�����������' then
    Input.motw[1] := 2;
  if ComboBox12.Text = '������������' then //��������� ������� ������
    Input.motw[2] := 0;
  if ComboBox12.Text = '����������' then
    Input.motw[2] := 1;
  if ComboBox12.Text = '�����������' then
    Input.motw[2] := 2;
  Input.Bistr := CheckBox1.Checked;
  if oo = 1 then
  begin
    Input.TipZ := FChild.RadioGroup1.ItemIndex;
    val(FChild.EditBetg.Text, Input.Betg, osh);
    if FChild.CheckBox1.Checked then
      Input.Kanavka := 1
    else
      Input.Kanavka := 0;
  end
  else
  Input.TipZ := 1;
  Input.Zw := SpinEditZw.Value;
  Input.Rewers := CheckBox3.Checked;
  Input.Ka:=1; //����������� ������� ��������
  Input.otw1 := CheckBox2.Checked;
  if ((ComboBox6.Text = '�����') or (ComboBox6.Text = '������ ������')) then
    Input.Wikrugka[1] := 0
  else
    Input.Wikrugka[1] := 1;
  if ((ComboBox6.Text = '�����') or (ComboBox6.Text = '������ ������')) then
    Input.Wikrugka[2] := 0
  else
    Input.Wikrugka[2] := 1;
  Input.nagr := False;
  Input.Loading.GraphBar := 0;
  with Input.Loading do
  begin
    x := 2;
    y := 0.3;
    z := 0.2;
    i := 0.6;
    j := 0.2;
    k := 0.2;
  end;

  Output.mn := 0;
  Input.Nom_Sx := strtoint(ButtonNom_Sx.Caption);
  clas.MakeVersionss(Input);
  ShowMessage('����� ��������� =   ' + inttostr(mascount));
  SetLength(masOutput1, mascount);
  SetLength(masInput1, mascount);
  for i := 0 to mascount - 1 do
  begin
    CALCULAT008.MasOutputOnForm(i, Output, Input1);
    masOutput1[i] := Output;
    masInput1[i] := Input1;
    // ������� ������ �������� � ��������� �� � PageControl
    TabSheet1 := TTabSheet.Create(Self);
    TabSheet1.Caption := '�������' + inttostr(i + 1);
    TabSheet1.PageControl := PageControl1;
    // ������� ������ ��������
    if Input.Termobr1 = 1 then
      termobr11 := '���������';
    if Input.Termobr1 = 2 then
      termobr11 := '������������';
    if Input.Termobr1 = 3 then
      termobr11 := '�������� �������';
    if Input.Termobr1 = 4 then
      termobr11 := '������� ���';
    if Input.Termobr1 = 5 then
      termobr11 := '����������';
    if Input.Termobr1 = 6 then
      termobr11 := '���������������';
    // if ComboBox2.Text = '������������' then
    // Input.Termobr1 := 7;
    // if ComboBox2.Text = '�����' then
    // Input.Termobr1 := 8;
    Input.mc2 := ComboBox3.Text;
    // if ComboBox4.Text = 'AUTO' then
    // Input.Termobr2 := 0; { 0 .. 8 }
    if Input.Termobr1 = 1 then
      termobr21 := '���������';
    if Input.Termobr1 = 2 then
      termobr21 := '������������';
    if Input.Termobr1 = 3 then
      termobr21 := '�������� �������';
    if Input.Termobr1 = 4 then
      termobr21 := '������� ���';
    if Input.Termobr1 = 5 then
      termobr21 := '����������';
    if Input.Termobr1 = 6 then
      termobr21 := '���������������';

    if Input.Zagotowka[1] = 0 then // ��������� ��������
      zagotowka1 := '�������';
    if Input.Zagotowka[1] = 1 then
      zagotowka1 := '���������';
    if Input.Zagotowka[1] = 2 then
      zagotowka1 := '������';
    if Input.Zagotowka[1] = 3 then
      zagotowka1 := '�������';

    if Input.Zagotowka[2] = 0 then // ��������� ������
      zagotowka2 := '�������';
    if Input.Zagotowka[2] = 1 then
      zagotowka2 := '���������';
    if Input.Zagotowka[2] = 2 then
      zagotowka2 := '������';
    if Input.Zagotowka[2] = 3 then
      zagotowka2 := '�������';

    if Input.motw[1] = 0 then // ��������� �������� ��������
      wkrug1 := '������������';
    if Input.motw[1] = 1 then
      wkrug1 := '����������';
    if Input.motw[1] = 2 then
      wkrug1 := '�����������';

    if Input.motw[2] = 0 then // ��������� ������� ������
      wkrug2 := '������������';
    if Input.motw[2] = 1 then
      wkrug2 := '����������';
    if Input.motw[2] = 2 then
      wkrug2 := '�����������';

    if Input.Wikrugka[1] = 0 then
      Wikrugka1 := '�����';
    if Input.Wikrugka[1] = 1 then
      Wikrugka1 := '������ ������';
    if Input.Wikrugka[2] = 0 then
      Wikrugka2 := '�����';
    if Input.Wikrugka[2] = 1 then
      Wikrugka2 := '������ ������';
    with Tmemo.Create(Self) do
    begin
      width := 465;
      Height := 717;
      Parent := TabSheet1;
      ScrollBars := ssVertical;
      Lines.Append('         �������� ������');
      Lines.Append('�������� �� ������� ���� ' + FloatToStrf(Input1.p1, fffixed,
        4, 2) + ' ���');
      Lines.Append('������� �������� ��������  ' + FloatToStrf(Input1.N1,
        fffixed, 4, 2) + ' ��/���');
      Lines.Append('��������� ������������ �����  ' + FloatToStrf(Input1.U,
        fffixed, 4, 2));
      Lines.Append('��������� ���� ������  ' + FloatToStrf(Input1.Lh, fffixed,
        4, 2) + ' ���');
      Lines.Append('�������� ��������  ' + Input.mc1);
      Lines.Append('�������������� �������� ' + termobr11);
      Lines.Append('�������� ������  ' + (Input1.mc2));
      Lines.Append('�������������� ������  ' + termobr21);
      Lines.Append('��������� ��������  ' + zagotowka1);
      Lines.Append('��������� ������  ' + zagotowka2);
      Lines.Append('��������� �������� ��������  ' + wkrug1);
      Lines.Append('��������� �������� ������ ' + wkrug2);
      Lines.Append('��� ������  ' + (CogType[Input1.TipZ]));
      Lines.Append('���������� ���������� ��������  ' + Wikrugka1);
      Lines.Append('���������� ���������� ������ ' + Wikrugka2);
      Lines.Append('   ');
      Lines.Append('         �������������� ���������');
      Lines.Append('����������� ������������ ����� ��������  ' +
        FloatToStrf(Output.Uf, fffixed, 4, 2));
      Lines.Append('������� �������� ������������� ����  ' +
        FloatToStrf(Input.N1, fffixed, 4, 2) + ' ��/���');
      Lines.Append('������� �������� ������  ' + FloatToStrf(Output.n2, fffixed,
        4, 2) + ' ��/���');
      Lines.Append('��������  ' + FloatToStrf(Output.V, fffixed, 4, 2)
        + ' �/�');
      Lines.Append('   ');
      Lines.Append('         ��������� ��������');
      Lines.Append('���������� ������ ' + FloatToStrf(Output.mn,
        fffixed, 4, 2));
      Lines.Append('��������� ���������� ��������   ' + FloatToStrf(Output.aw,
        fffixed, 4, 2) + ' ��');
      Lines.Append('���� ������� ����  ' + FloatToStrf(Input.Betg, fffixed, 4,
        2) + ' ��������');
      Lines.Append('������� ��������   ' + inttostr(Output.St));
      Lines.Append('��������� �-� ����������  ' + FloatToStrf(Output.epsias,
        fffixed, 4, 2));
      Lines.Append('���� ���������� �������� �����  ' +
        FloatToStrf((Output.alfatw * 180 / Pi), fffixed, 4, 2) + ' ��������');
      Lines.Append('����� ������ ������  ' + inttostr(Output.z2));
      Lines.Append('����� ������ ��������  ' + inttostr(Output.z1));
      Lines.Append('����������� �������� ��������� ������� ������  ' +
        FloatToStrf(Output.x2, fffixed, 4, 2));
      Lines.Append('����������� �������� ��������� �������  �������� ' +
        FloatToStrf(Output.x1, fffixed, 4, 2));
      Lines.Append('    ');
      Lines.Append('          ������� �����');
      Lines.Append('������� ���������� ������ ��������   ' +
        FloatToStrf(Output.Da1, fffixed, 4, 2) + ' ��');
      Lines.Append('����������� ������� ��������    ' + FloatToStrf(Output.d1,
        fffixed, 4, 2) + ' ��');
      Lines.Append('��������� ������� ��������    ' + FloatToStrf(Output.Dw1,
        fffixed, 4, 2) + ' ��');
      Lines.Append('������� ���������� ������ ��������   ' +
        FloatToStrf(Output.Df1, fffixed, 4, 2) + ' ��');
      Lines.Append('������ ����� ��������   ' + FloatToStrf(Output.B1, fffixed,
        4, 2) + ' ��');
      Lines.Append('������� ���������� ������  ������   ' +
        FloatToStrf(Output.Da2, fffixed, 4, 2) + ' ��');
      Lines.Append('����������� ������� ������    ' + FloatToStrf(Output.d2,
        fffixed, 4, 2) + ' ��');
      Lines.Append('��������� ������� ������    ' + FloatToStrf(Output.Dw2,
        fffixed, 4, 2) + ' ��');
      Lines.Append('������� ���������� ������ ������   ' +
        FloatToStrf(Output.Df2, fffixed, 4, 2) + ' ��');
      Lines.Append('������ ����� ������   ' + FloatToStrf(Output.B2, fffixed, 4,
        2) + ' ��');
      Lines.Append('    ');
      Lines.Append('            ����������� � ������� ���������');
      Lines.Append('���������� ����������  ' + FloatToStrf(Output.Sigma_H,
        fffixed, 4, 2));
      Lines.Append('������, ������������ ������������ �����   ' +
        FloatToStrf(Output.T1, fffixed, 4, 2) + ' �/�');
      Lines.Append('������, ������������ ���������� �����  ' +
        FloatToStrf(Output.T2, fffixed, 4, 2));
      Lines.Append('��������� �������� �� ���  ' + FloatToStrf(Output.Fv,
        fffixed, 4, 2));
      Lines.Append('�������� ������ ��������  ' + FloatToStrf(Output.Ft2,
        fffixed, 4, 2) + ' �');
      Lines.Append('���������� ������ �������� ' + FloatToStrf(Output.Fr2,
        fffixed, 4, 2) + ' �');
      Lines.Append('������ ������ ��������  ' + FloatToStrf(Output.Fx2, fffixed,
        4, 2) + ' �');
      Lines.Append('�������� ������ ������    ' + FloatToStrf(Output.Ft1,
        fffixed, 4, 2) + ' �');
      Lines.Append('���������� ������ ������   ' + FloatToStrf(Output.Fr1,
        fffixed, 4, 2) + ' �');
      Lines.Append('������ ������ ������    ' + FloatToStrf(Output.Fx1, fffixed,
        4, 2) + ' �');
    end;
  end;
end;

procedure TForm1.ButtonNom_SxClick(Sender: TObject);
begin
  FChild2 := TForm5.Create(Self);
  FChild2.Show;
end;

procedure TForm1.ButtonTipzClick(Sender: TObject);
var
  i9, osh: integer;
begin
  try
    FChild := TForm2.Create(Self);
    if FChild.ShowModal = mrOK then
    begin
      clas.TipZ := FChild.RadioGroup1.ItemIndex;
      if clas.TipZ = 0 then
        ButtonTipz.Caption := 'AUTO';
      if clas.TipZ = 1 then
        ButtonTipz.Caption := '������';
      if clas.TipZ = 2 then
      begin
        val(FChild.EditBetg.Text, Input.Betg, osh);
        Form1.ButtonTipz.Caption := '�����    ' + floattostr(Input.Betg);
      end;
      if clas.TipZ = 3 then
      begin
        if FChild.CheckBox1.Checked then
        begin
          ButtonTipz.Caption := '��������� � ��������';
          clas.Kanavka := 1;
        end
        else
        begin
          clas.Kanavka := 0;
          ButtonTipz.Caption := '���������';
        end;
      end;
    end;
  finally
    FChild1.Free;
    FChild1 := nil;
  end;

  oo := 1;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  if CheckBox4.Checked then
    CheckBox4.Caption := '�������'
  else
    CheckBox4.Caption := '�����������';
end;

procedure TForm1.Edit4Exit(Sender: TObject);
var
  osh: integer; // ��� ������
begin
  val(Edit4.Text, Input.Lh, osh);
  if osh <> 0 then
    ShowMessage('������� �������� ��������')
  else
    clas.Lh := Input.Lh;
end;

procedure TForm1.EditN1Exit(Sender: TObject);
var
  osh: integer; // ��� ������
begin
  val(EditN1.Text, Input.N1, osh);
  if osh <> 0 then
    ShowMessage('������� �������� ��������')
  else
    clas.N1 := Input.N1;
end;

procedure TForm1.EditP1Exit(Sender: TObject);
var
  osh: integer; // ��� ������
begin
  val(EditP1.Text, Input.p1, osh);
  if osh <> 0 then
    ShowMessage('������� �������� ��������')
  else
    clas.p1 := Input.p1;

end;

procedure TForm1.Editp1KeyPress(Sender: TObject; var Key: Char);
var
  i: integer;
begin
  if not(Key in ['0' .. '9', '.', #8]) then
    Key := #0;
  for i := 1 to Length((Sender as TEdit).Text) do
    if ((Key = '.') and ((Sender as TEdit).Text[i] = '.')) then
      Key := #0;
end;

procedure TForm1.EditUClick(Sender: TObject);
var
  FChild1: TForm4;
  St1,st: string;
begin
  try
    st1:=EditU.Text;
    FChild1 := TForm4.Create(Self);
    if FChild1.ShowModal = mrOK then
      St := FChild1.EditU.Text
      else St:=st1;
    EditU.Text := St;
    Input.U := StrToFloat(St);
  finally
    FChild1.Free;
    FChild1 := nil;
  end;
end;

procedure TForm1.EditUExit(Sender: TObject);
begin
 EditU.Text:=FloatToStr(Input.U);
end;

procedure TForm1.EditUKeyPress(Sender: TObject; var Key: Char);
begin
  Key := #0
end;

procedure TForm1.FormShow(Sender: TObject);
var
  i: integer;
begin
  Input.DeltaU := 2;
  Input.U := 3.58;
  clas := CalculateCWheel.Create;
  for i := Low(marca1) to High(marca1) do // ������� ���  �� ���
    ComboBox1.Items.Add(marca1[i]);
  ComboBox1.Text := '45 ���� 1050-74';
  for i := 0 to 5 do
    ComboBox2.Items.Add(HandleStr[i]);
  for i := 0 to 24 do
    ComboBox3.Items.Add(marca1[i]);
  ComboBox3.Text := '45 ���� 1050-74';
  for i := 0 to 5 do
    ComboBox4.Items.Add(HandleStr[i]);
  for i := 0 to 2 do
    ComboBox7.Items.Add(roughness[i]);
  for i := 0 to 2 do
    ComboBox8.Items.Add(roughness[i]);
  for i := 0 to 3 do
    ComboBox9.Items.Add(PatternProcess[i]);
  for i := 0 to 3 do
    ComboBox10.Items.Add(PatternProcess[i]);
  for i := 0 to 2 do
    ComboBox11.Items.Add(Finish[i]);
  for i := 0 to 2 do
    ComboBox12.Items.Add(Finish[i]);
  for i := 0 to 5 do
    ComboBox5.Items.Add(LoadStr[i]);
  for i := 0 to 2 do
    ComboBox6.Items.Add(ToolStr[i]);
  for i := 0 to 2 do
    ComboBox13.Items.Add(ToolStr[i]);
end;

procedure TForm1.SpinEditZwExit(Sender: TObject);
begin
  clas.Zw := SpinEditZw.Value;
end;

end.
