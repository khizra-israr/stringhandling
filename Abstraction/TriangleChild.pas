unit TriangleChild;

interface

uses AbstractBasePolygon;

type
TTriangle = Class (TPolygon)
private
  function GetSideCount : byte;  override;
  procedure SetSideCount (Count : byte);  override;
  function GetAreaA : single; override;
published
  Constructor Create(length : byte);
End;

implementation

{ Constructor }
Constructor TTriangle.Create(length: Byte);
begin
  inherited Create(length);
end;

function TTriangle.GetSideCount;
begin
  Result := GetSideCount;
end;

procedure  TTriangle.SetSideCount(Count: Byte);
begin
  inherited SetSideCount(count);
end;

function TTriangle.GetAreaA;
begin
  Result := Length * Length / 2;
end;
end.
