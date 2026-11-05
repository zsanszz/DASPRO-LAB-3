program Perkalian;
var
  i, hasil: integer;
begin
  for i := 1 to 100 do
  begin
    hasil := 1 * i;

    if (hasil mod 3 <> 0) or (hasil mod 5 <> 0) then
    begin
      writeln('1 x ', i, ' = ', hasil);
    end;
  end;
  readln;
end.