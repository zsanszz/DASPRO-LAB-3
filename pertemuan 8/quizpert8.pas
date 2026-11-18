
program MencariHargaMakanan;

type
  TMakanan = record
    nama: string;
    harga: longint;
  end;

  PMakanan = ^TMakanan;

var
  pMakanan: PMakanan;
  namaTermahal, namaTermurah: string;
  hargaTermahal, hargaTermurah: longint;
  jumlah, i: integer;

begin
  write('Masukkan jumlah makanan: ');
  readln(jumlah);

  New(pMakanan);

  for i := 1 to jumlah do
  begin
    writeln;
    writeln('Data makanan ke-', i);

    write('Nama makanan: ');
    readln(pMakanan^.nama);

    write('Harga makanan: Rp');
    readln(pMakanan^.harga);

    if i = 1 then
    begin
      hargaTermahal := pMakanan^.harga;
      hargaTermurah := pMakanan^.harga;

      namaTermahal := pMakanan^.nama;
      namaTermurah := pMakanan^.nama;
    end
    else
    begin
      if pMakanan^.harga > hargaTermahal then
      begin
        hargaTermahal := pMakanan^.harga;
        namaTermahal := pMakanan^.nama;
      end;

      if pMakanan^.harga < hargaTermurah then
      begin
        hargaTermurah := pMakanan^.harga;
        namaTermurah := pMakanan^.nama;
      end;
    end;
  end;

  writeln;
  writeln('=== HASIL PENCARIAN ===');

  writeln('Makanan termahal: ', namaTermahal);
  writeln('Harga termahal: Rp', hargaTermahal);

  writeln;
  writeln('Makanan termurah: ', namaTermurah);
  writeln('Harga termurah: Rp', hargaTermurah);

  Dispose(pMakanan);

  readln;
end.
