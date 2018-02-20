unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Edit1: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure draw( x,y:Integer;var Polyline1:array of TPoint);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  all,convex: Integer;
  ax,ay,bx,by,cx,cy,dx,dy: Integer;
  Pa:array[0..33] of TPoint;
implementation

{$R *.dfm}

function isUnderFlour(x1,y1,x2,y2,x,y:Integer):Boolean;
begin
 isUnderFlour:=true;
 if((x-x1)*(y2-y1)-(y-y1)*(x2-x1)>=0 )
        then isUnderFlour:=false else isUnderFlour:=true;
end;

function isConvex(ax,ay,bx,by,cx,cy,dx,dy:Integer):Boolean;
var r: boolean;
begin
   r:=isUnderFlour(ax,ay,bx,by,cx,cy) and isUnderFlour(ax,ay,bx,by,dx,dy);
   r:=r and isUnderFlour(bx,by,cx,cy,ax,ay) and isUnderFlour(bx,by,cx,cy,dx,dy);
   r:=r and isUnderFlour(cx,cy,dx,dy,ax,ay) and isUnderFlour(cx,cy,dx,dy,bx,by);
   r:=r and isUnderFlour(dx,dy,ax,ay,bx,by) and isUnderFlour(dx,dy,ax,ay,cx,cy);
   isConvex:=r;
end;

procedure TForm1.Button1Click(Sender: TObject);

begin
  ax:= 1 + Random(299);   ay:= 1 + Random(299);
  bx:= 1 + Random(299);   by:= 1 + Random(299);
  cx:= 1 + Random(299);   cy:= 1 + Random(299);
  dx:= 1 + Random(299);   dy:= 1 + Random(299);
  all:=all+1;
 //   Image1.Canvas.PenPos.X :=Int(ax);
 // Image1.Canvas.PenPos.Y:=Int(ay);
  Image1.Canvas.MoveTo(ax,ay);
  if isConvex(ax,ay,bx,by,cx,cy,dx,dy)
    then
    begin
     Image1.Canvas.Pen.Color := clRed;
     convex:=convex+1;
    end
    else  Image1.Canvas.Pen.Color := clBlue;
 Image1.Canvas.Polyline([Point(ax,ay),Point(bx,by),Point(cx,cy),Point(dx,dy),Point(ax,ay)]);
 Edit1.Text:= IntToStr(all)+ ' '+ IntToStr(convex);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 all:=0; convex:=0  ;
 ax:= 1 + Random(299);   ay:= 1 + Random(299);
 bx:= 1 + Random(299);   by:= 1 + Random(299);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
   dx:= bx;   dy:= by;
   bx:= ax;   by:= ay;

    cx:= 1 + Random(299);   cy:= 1 + Random(299);
  if isUnderFlour(bx,by,dx,dy,cx,cy)
    then
    begin
     Image1.Canvas.Pen.Color := clRed;
      end
    else  Image1.Canvas.Pen.Color := clBlue;
    //Image1.Canvas.MoveTo(ax,ay);
    Image1.Canvas.Polyline([Point(bx,by),Point(cx,cy)]);
     ax:= cx;   ay:= cy;
end;

procedure TForm1.draw( x,y:Integer;var Polyline1:array of TPoint);
var p1:array of TPoint;
    i:Integer;
begin

  {*  for i:= 0 to Length(Polyline1)-1  do
     begin
       Polyline1[i].X:=Polyline1[i].X+x;
       Polyline1[i].Y:=Polyline1[i].Y+y;
      end; *}
     Image1.Canvas.MoveTo(x,y);
     Image1.Canvas.Polyline(Polyline1);
end;

procedure TForm1.Button4Click(Sender: TObject);
label begc;
 var  i:Integer;
begin
 begc: Pa[0]:=Point(0,4);
  Pa[1]:=Point(10,4);
  Pa[2]:=Point(10,5);
  Pa[3]:=Point(0,5);
     Pa[4]:= Point(0,6);Pa[5]:=Point(10,6);Pa[6]:=Point(10,7);
     Pa[7]:=Point(0,7);
      Pa[8]:=Point(10,7);Pa[9]:=Point(10,8);Pa[10]:=Point(0,8);
      Pa[11]:=Point(0,9);
      Pa[12]:=Point(10,9);Pa[13]:=Point(10,0);Pa[14]:=Point(14,0);
      Pa[15]:=Point(14,5);
      Pa[16]:=Point(17,5);Pa[17]:=Point(18,6);Pa[18]:=Point(10,5);
      Pa[19]:=Point(10,6);
      Pa[20]:=Point(10,7);Pa[21]:=Point(18,7);Pa[22]:=Point(19,10);
      Pa[23]:=Point(11,9);
      Pa[24]:=Point(18,10);Pa[25]:=Point(0,10);Pa[26]:=Point(0,10);
      Pa[27]:=Point(4,10);
      Pa[28]:=Point(4,12);Pa[29]:=Point(4,11);Pa[30]:=Point(4,10);
      Pa[31]:=Point(13,10);
      Pa[32]:=Point(14,13);Pa[33]:=Point(14,13);

          Image1.Canvas.MoveTo(0,50);
     Image1.Canvas.Pen.Color := clGreen;
     Image1.Canvas.Polyline(Pa);
     sleep(5000);
     Image1.Canvas.Pen.Color :=clWhite;
      Image1.Canvas.Polyline(Pa);
      for i:= 0 to 33 do
     begin
       Pa[i].X:=Pa[i].X+10;
       Pa[i].Y:=Pa[i].Y;
      end;
     Image1.Canvas.Pen.Color := clGreen;
     Image1.Canvas.Polyline(Pa);

     sleep(500);
          Image1.Canvas.Pen.Color :=clWhite;
         Image1.Canvas.Polyline(Pa);

         for i:= 0 to 33 do
     begin
       Pa[i].X:=Pa[i].X+10;
       Pa[i].Y:=Pa[i].Y;
      end;

end;

procedure TForm1.Button6Click(Sender: TObject);
begin
   ax:= 1 + Random(299);   ay:= 1 + Random(299);
  bx:= 1 + Random(299);   by:= 1 + Random(299);
  cx:= 1 + Random(299);   cy:= 1 + Random(299);

  all:=all+1;
 //   Image1.Canvas.PenPos.X :=Int(ax);
 // Image1.Canvas.PenPos.Y:=Int(ay);
  Image1.Canvas.MoveTo(ax,ay);
  if  isUnderFlour(ax,ay,bx,by,cx,cy)
    then
    begin
     Image1.Canvas.Pen.Color := clRed;
     convex:=convex+1;
    end
    else  Image1.Canvas.Pen.Color := clBlue;
 Image1.Canvas.Polyline([Point(ax,ay),Point(bx,by),Point(cx,cy),Point(ax,ay)]);
 Edit1.Text:= IntToStr(all)+ ' '+ IntToStr(convex);
end;

end.
