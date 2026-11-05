program pengulangan;
uses crt;
var
i,n,total,angka :integer;
begin
clrscr;

total:= 0;
write('Masukkkan jumlah angka: ');
readln(n);
for i := 1 to n do 
begin
    write('Masukkan angka ke ', i, ': ');
    readln(angka);
    total := total + angka;
end;

writeln;
writeln('Total semua angka= ', total);

readln;

end.