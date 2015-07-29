unit List;

{
 1. TList - Mantain a list of pointers to object
 2. Sorting in list is carroud out by a user-defined critering i.e. compare function
}
interface
uses Classes, lstTList, Winapi.Windows, sysutils;
type

  TCustomList = class(TList)
  private
    FCustomer : TCustomer;
    CurrentItem : PListEntry;
  public
    procedure MoveToNextItem;
    procedure MoveToPreviousItem;
    function GetSelectedItem : string;
    procedure SetDefaultItem(PtrToItem : Pointer);
    function CompareCriteria(PtrObj1 : pointer; PtrObj2 : pointer) : integer;
  end;
implementation

procedure TCustomList.SetDefaultItem(PtrToItem : Pointer);
begin
  CurrentItem := PtrToItem;
end;

procedure TCustomList.MoveToNextItem;
var
 nIndex : integer;
begin
 nIndex := Self.IndexOf(CurrentItem);
 if nIndex < self.Count - 1 then
 begin
  inc(nIndex);
  CurrentItem := Self[nIndex];
 end;
end;

procedure TCustomList.MoveToPreviousItem;
var
 nIndex : integer;
begin
 nIndex := Self.IndexOf(CurrentItem);
 if nIndex > 0 then
 begin
  nIndex := nIndex - 1;
  CurrentItem := Self[nIndex];
 end;
end;

function TCustomList.GetSelectedItem : string;
var
 nIndex : integer;
Begin
  Result := EmptyStr;
  if self.Count > -1 then
  begin
   nIndex := Self.IndexOf(CurrentItem);
   Result := TCustomer(self[nIndex]).Name + ' ' +
             IntToStr(TCustomer(self[nIndex]).Number);
  end;
end;

function TCustomList.CompareCriteria(PtrObj1: Pointer; PtrObj2: Pointer) : integer;
var
 Cust1, Cust2 : TCustomer;
begin
 Cust1 := TCustomer(PtrObj1);
 Cust2 := TCustomer(PtrObj2);
 if (Cust1.Number > cust2.Number) then
  Result := 1
 else if (Cust1.Number = Cust2.Number) then
  Result := 0
 else
  Result := -1;
end;
end.
