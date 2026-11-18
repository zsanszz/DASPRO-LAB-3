
program DuaPointer;

var
  angka: integer;
  p1, p2: ^integer;

begin
  write('Masukkan sebuah nilai: ');
  readln(angka);

  p1 := @angka;
  p2 := @angka;

  writeln;
  writeln('=== HASIL PROGRAM ===');

  writeln('Nilai variabel: ', angka);

  writeln('Alamat variabel: ', PtrUInt(@angka));

  writeln('Nilai yang ditunjuk pointer 1: ', p1^);

  writeln('Nilai yang ditunjuk pointer 2: ', p2^);

  readln;
end.
