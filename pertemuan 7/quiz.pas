
program HasilStudiMahasiswa;

uses crt;

const
    MaxMahasiswa = 100;
    MaxMatkul = 20;

type
    TDataMatkul = record
        namaMatkul : string[50];
        sks : integer;
        nilai : char;
    end;

    TMahasiswa = record
        nama : string[50];
        nim : string[20];
        jumlahMatkul : integer;
        matkul : array[1..MaxMatkul] of TDataMatkul;
        totalSKS : integer;
        totalMutu : real;
        IP : real;
    end;

var
    mahasiswa : array[1..MaxMahasiswa] of TMahasiswa;
    jumlahMahasiswa : integer;
    i, j : integer;

function KonversiNilai(nilai : char): real;
begin
    case UpCase(nilai) of
        'A'  : KonversiNilai := 4.0;
        'B'  : KonversiNilai := 3.0;
        'C'  : KonversiNilai := 2.0;
        'D'  : KonversiNilai := 1.0;
        'E'  : KonversiNilai := 0.0;
        else KonversiNilai := 0.0;
    end;

    if UpCase(nilai) = 'X' then
        KonversiNilai := 3.5
    else if UpCase(nilai) = 'Y' then
        KonversiNilai := 2.5;
end;

begin
    clrscr;

    writeln('====================================');
    writeln('       PROGRAM HASIL STUDI          ');
    writeln('           MAHASISWA                ');
    writeln('====================================');

    write('Masukkan jumlah mahasiswa: ');
    readln(jumlahMahasiswa);

    { Input data mahasiswa }
    for i := 1 to jumlahMahasiswa do
    begin
        writeln;
        writeln('Data Mahasiswa ke-', i);

        write('Nama Mahasiswa : ');
        readln(mahasiswa[i].nama);

        write('NIM            : ');
        readln(mahasiswa[i].nim);

        write('Jumlah Mata Kuliah: ');
        readln(mahasiswa[i].jumlahMatkul);

        mahasiswa[i].totalSKS := 0;
        mahasiswa[i].totalMutu := 0;

        { Input data mata kuliah }
        for j := 1 to mahasiswa[i].jumlahMatkul do
        begin
            writeln;
            writeln('Mata Kuliah ke-', j);

            write('Nama Mata Kuliah : ');
            readln(mahasiswa[i].matkul[j].namaMatkul);

            write('Jumlah SKS       : ');
            readln(mahasiswa[i].matkul[j].sks);

            write('Nilai (A/B/C/D/E): ');
            readln(mahasiswa[i].matkul[j].nilai);

            mahasiswa[i].totalSKS :=
                mahasiswa[i].totalSKS +
                mahasiswa[i].matkul[j].sks;

            mahasiswa[i].totalMutu :=
                mahasiswa[i].totalMutu +
                (KonversiNilai(mahasiswa[i].matkul[j].nilai) *
                mahasiswa[i].matkul[j].sks);
        end;

        { Menghitung IP }
        if mahasiswa[i].totalSKS > 0 then
            mahasiswa[i].IP :=
                mahasiswa[i].totalMutu / mahasiswa[i].totalSKS
        else
            mahasiswa[i].IP := 0;
    end;

    { Menampilkan hasil studi satu per satu }
    clrscr;

    for i := 1 to jumlahMahasiswa do
    begin
        writeln('====================================');
        writeln('       HASIL STUDI MAHASISWA        ');
        writeln('====================================');

        writeln('Nama Mahasiswa : ', mahasiswa[i].nama);
        writeln('NIM            : ', mahasiswa[i].nim);

        writeln;
        writeln('Daftar Mata Kuliah:');
        writeln('------------------------------------');

        for j := 1 to mahasiswa[i].jumlahMatkul do
        begin
            writeln('Mata Kuliah : ',
                mahasiswa[i].matkul[j].namaMatkul);
            writeln('SKS         : ',
                mahasiswa[i].matkul[j].sks);
            writeln('Nilai       : ',
                mahasiswa[i].matkul[j].nilai);
            writeln('------------------------------------');
        end;

        writeln('Total SKS    : ', mahasiswa[i].totalSKS);
        writeln('Total Mutu   : ', mahasiswa[i].totalMutu:0:2);
        writeln('IP Mahasiswa : ', mahasiswa[i].IP:0:2);

        writeln;
        writeln('Tekan ENTER untuk melanjutkan...');
        readln;
        clrscr;
    end;

    writeln('Semua data hasil studi mahasiswa selesai ditampilkan.');
    readln;
end.
