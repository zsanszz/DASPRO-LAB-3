program statementwhile;
uses crt;

var
angka :integer;

begin
clrscr;

write('Masukkan angka: ');
readln(angka);

while angka > 0 do 
begin
writeln('angka ', angka,' adalah bilangan positif');
angka := 0;
end;
write('Masukkan angka lagi(0 untuk berhenti): ');

end.