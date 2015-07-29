unit clsTObjectList;

interface

uses classes, contnrs;

type

// Base class
TCar = class
public
  function Beep : string; virtual;
end;

{ Derive class }
TPorche = class(TCar)
  function Beep : string; override;
end;

// base class
TCarList1 = class(TObjectList)
private
  function GetCar(AIndex : integer) : TCar;
  procedure SetCar(AIndex : integer; const Value : TCar);

public
  function Add(ACar : TCar) : integer;
  property Items[AIndex : integer] : TCar read GetCar write SetCar;
end;

// base class 2         RCS
TCarList2 = class
  private
    FItems : TList;
    function GetItems(AIndex : integer) : TCar;
    procedure SetItems(AIndex : integer; const AValue : TCar);

  public
    Constructor Create;
    Destructor Destroy ; override;
    function Add(ACar : TCar) : integer;
    property Items[AIndex : integer] : TCar read GetItems write SetItems; default;
end;

implementation
{ TCar class method implementations }
function TCar.Beep : string;
begin
  Result := 'Beep';
end;

{ TPorche class method implementations }
function TPorche.Beep;
begin
  Result := 'Beeeeeeeeeepppppp porche';
end;

{ TCarList1 class method implementations }
function TCarList1.Add(ACar: TCar) : integer;
begin
  Result := inherited Add(ACar);
end;

procedure TCarList1.SetCar(AIndex: Integer; const Value: TCar);
begin
  Put(AIndex, Value);
end;

function TCarList1.GetCar(AIndex: Integer) : TCar;
begin
  Result := GetCar(AIndex);
end;

{ TCarList2 class method implementations }
Constructor TCarList2.Create;
begin
  FItems := TList.Create;
end;

Destructor TCarList2.Destroy;
begin
  if Assigned(FItems) then
    FItems.Free;
end;

function TCarList2.GetItems(AIndex: Integer) : TCar;
begin
  Result := FItems[AIndex];
end;

procedure TCarList2.SetItems(AIndex: Integer; const AValue: TCar);
begin
  FItems[AIndex] := AValue;
end;


function TCarList2.Add(ACar: TCar) :integer;
begin
  Result := FItems.Add(ACar);
end;
end.
