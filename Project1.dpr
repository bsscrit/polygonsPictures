Program Clock;




uses
  Unit1 in 'Unit1.pas';

{$E exe}




begin
  ClockThread.StartClockThread;
  ClockThread.PaintClock;
end.


