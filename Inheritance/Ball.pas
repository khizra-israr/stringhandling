unit Ball;

interface
type
TBall = Class
protected
  ballSize : byte;
  ballSpeed : byte;
published
  Constructor Create(Size : byte);
  procedure Kick(Power : byte);  virtual;
  function GetSpeed : Byte;
End;

implementation
Constructor TBall.Create(Size: Byte);
begin
  ballSpeed := 0;
  ballSize := Size;
end;

procedure TBall.Kick(Power: Byte);
begin
  ballSpeed := (power * ballSize) div 4;
end;

function TBall.GetSpeed : byte;
begin
  Result := ballSpeed;
end;
end. // end
