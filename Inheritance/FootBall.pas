unit FootBall;

interface
uses Ball;
type
TFootball = class(TBall)
private
  BallPanel : byte;
published
  Constructor Create(Size : byte; Panel : Byte);
  procedure Kick(Power : byte);  override;
end;

implementation
Constructor TFootball.Create(Size: Byte; Panel: Byte);
begin
  inherited Create(size);
  BallPanel := Panel;
end;

procedure TFootball.Kick(Power: Byte);
begin
  ballSpeed := (power * ballSize * BallPanel) div 24;
end;

end.

