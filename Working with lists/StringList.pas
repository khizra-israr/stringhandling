unit StringList;
{
 TStringList is usefule for processing string i.e insertion, move and sort
 List can be built from a
  Comma seperated string (
  Built by string (AddStrings)
  From a file (LoadFromFile)
 It is derived from TStrings
}
interface
uses Classes, sysUtils;
type
TCustomStringList = class(TStringList)
 Public
 procedure AddStrings(s : array of string);
 procedure Split(const Delimiter : char; Input : String; const Strings : TStrings);
end;

implementation

{
 Adding a list of array to string object
 AddString(['cat', 'dog', 'monkey']);
}
procedure TCustomStringList.AddStrings(s: array of string);
var
  nIndex : integer;
begin
  BeginUpdate;
  for nIndex := 0 to High(s) do
    Add(s[nIndex]);
  EndUpdate;
end;

procedure TCustomStringList.Split(const Delimiter: Char; Input: string; const Strings: TStrings);
begin
  Assert(Assigned(Strings));
  // Strings.Clear;
  Strings.Delimiter := Delimiter;
  Strings.DelimitedText := '"' + StringReplace(Input, Delimiter, '"' + Delimiter +  '"', [rfReplaceAll]) + '"';
end;
end.
