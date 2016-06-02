Unit MATH1;

Interface

Function Arcsin(x: Extended): Extended;
Function ArcCos(x: Extended): Extended;
Function tan(x: Extended): Extended;
Function Cotan(x: Extended): Extended;
Function Arccotan(x: Extended): Extended;
Function Log(x: Extended): Extended;
Function Log10(x: Extended): Extended;
Function XBY(x, y: Extended): Extended;
Function sign(x: Extended): Shortint;
Function min3(a, b, c: Extended): Extended;
Function max3(a, b, c: Extended): Extended;
PROCEDURE Involuta(v: Extended; var al: Extended);

Implementation

Function Arcsin;
Begin
  if x > 1 Then
  Begin
    Writeln;
    Writeln('**Arcsin01** Аргумент под Arcsin =', x);
    runerror;
  End;
  if x = 1 Then
    Arcsin := Pi / 2
  Else
    Arcsin := arctan(x / sqrt(1 - x * x));
End;

Function ArcCos;
Begin
  if x > 1 Then
  Begin
    Writeln;
    Writeln('**Arccos01** Аргумент под Arccos =', x);
    Halt;
  End;
  if x = 1 Then
    ArcCos := 0
  Else
    ArcCos := Pi / 2 - Arcsin(x);
End;

Function tan;
var
  a: Extended;
Begin
  a := Cos(x);
  if (abs(a) < 1E-38) or (abs(a) > 1E38) Then
  Begin
    Writeln('**tan01** Тангенс аргумента = ', x, ' не определен');
    Halt;
  End;
  tan := Sin(x) / a;
End;

Function Cotan;
var
  a: Extended;
Begin
  a := Sin(x);
  if (abs(a) < 1E-38) or (abs(a) > 1E38) Then
  Begin
    Writeln('**cotan01** Котангенс аргумента = ', x, ' не определен');
    Halt;
  End;
  Cotan := Cos(x) / a;
End;

Function Log;
Begin
  if (x <= 0) Then
  Begin
    Writeln('**log01** Натуральный логарифм аргумента = ', x, ' не определен');
    Halt;
  End;
  Log := ln(x);
End;

Function Log10(x: Extended): Extended;
Begin
  if (x <= 0) Then
  Begin
    Writeln('**log1001** Десятичный логарифм аргумента = ', x, ' не определен');
    Halt;
  End;
  Log10 := ln(x) / 2.3025851;
End;

Function sign;
Begin
  sign := 1;
  if (x < 0) Then
    sign := -1;
End;

Function XBY(x, y: Extended): Extended;
var
  a: Extended;
Begin
  if (x < 0) Then
  Begin
    Writeln('**XBY01** Отрицательное число может быть возведено только в целую степень');
    Halt;
  End;
  if (x = 0) or (y = 0) Then
    XBY := 1
  Else
  Begin
    a := y * ln(x);
    if (abs(a) > 87) Then
    Begin
      Writeln('**XBY02** Степень числа слишком велика');
      Halt;
    End;
    XBY := Exp(a);
  End;
End;

Function Arccotan;
Begin
  Arccotan := Pi / 2 - arctan(x);
End;

Function min3;
var
  m: Extended;
Begin
  m := a;
  if (m > b) Then
    m := b;
  if (m > c) Then
    m := c;
  min3 := m;
End;

Function max3;
var
  m: Extended;
Begin
  m := a;
  if (m < b) Then
    m := b;
  if (m < c) Then
    m := c;
  max3 := m;
End;

Procedure Involuta(v: Extended; var al: Extended);
var
  t, del: Extended;
  n: integer;
Begin
  al := 1;
  n := 0;
  Repeat
    t := tan(al);
    del := t - al - v;
    al := al - del / sqr(t);
    Inc(n);
  Until (abs(del) < 1E-6) or (n > 50);
End;

End.
