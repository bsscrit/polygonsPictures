Program Clock;




uses
  Windows,
  SysUtils,
  ;

{$E exe}



var  i,j:integer;
procedure DrawClock(Temp:integer);
Const Size=50;
var DC,MemDC,CDC,Pen1,Pen2,Pen3:integer;
    I:byte;
    Angle:double;
    Point:TPoint;
begin
DC:=GetDC(0);
MemDC:=CreateCompatibleDC(DC);
CDC:=CreateCompatibleBitmap(DC,Size,Size);
SelectObject(MemDC,CDC);
BitBlt(MemDC,0,0,Size,Size,DC,GetSystemMetrics(SM_CXSCREEN)-Size,0,SRCCOPY);
Pen1:=CreatePen(PS_SOLID,1,0);
Pen2:=CreatePen(PS_SOLID,2,0);
Pen3:=CreatePen(PS_SOLID,3,0);
Ellipse(MemDC,0,0,Size,Size);
For I:=0 to 11 do begin
  if I mod 3=0 then SelectObject(MemDC,Pen2) else SelectObject(MemDC,Pen1);
  Angle:=I*pi/6;
  MoveToEx(MemDC,trunc(0.75*Size/2*cos(Angle)+size/2),trunc(0.75*Size/2*sin(Angle)+size/2),@Point);
  LineTo(MemDC,trunc(Size/2*cos(Angle)+size/2),trunc(Size/2*sin(Angle)+size/2));
end;
SelectObject(MemDC,Pen3);
Angle:=Temp/3600*2*pi/12-pi/2;
MoveToEx(MemDC,Size div 2,Size div 2,@Point);
LineTo(MemDC,trunc(0.6*Size/2*cos(Angle)+Size/2),trunc(0.6*Size/2*sin(Angle)+Size/2));
SelectObject(MemDC,Pen2);
Temp:=Temp mod 3600;
Angle:=Temp/60*2*pi/60-pi/2;
MoveToEx(MemDC,Size div 2,Size div 2,@Point);
LineTo(MemDC,trunc(0.8*Size/2*cos(Angle)+size/2),trunc(0.8*Size/2*sin(Angle)+size/2));
SelectObject(MemDC,Pen1);
Temp:=Temp mod 60;
Angle:=Temp*2*pi/60-pi/2;
MoveToEx(MemDC,Size div 2,Size div 2,@Point);
LineTo(MemDC,trunc(Size/2*cos(Angle)+size/2),trunc(Size/2*sin(Angle)+size/2));
DeleteObject(Pen1);DeleteObject(Pen2);DeleteObject(Pen3);
BitBlt(DC,GetSystemMetrics(SM_CXSCREEN)-Size,0,Size,Size,MemDC,0,0,SRCCOPY);
DeleteObject(CDC);
DeleteDC(MemDC);
ReleaseDC(0,DC);
end;

 Function GetTimeCount:integer;
var H,M,S,Temp:word;
begin
DecodeTime(Time,H,M,S,Temp);
Result:=(H mod 12)*3600+M*60+S;
end;
begin
  I:=1;
  while i=1 do
  begin
     for j:= 1 to 20000 do begin end;
     DrawClock(GetTimeCount);
  end;
 
end.


