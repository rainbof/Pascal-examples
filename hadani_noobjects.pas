program hadani_cisel;

uses Crt;
Function Menu:Byte;
var
        volba: Byte;
begin
 Repeat
 volba:=0;
  Writeln(' Hlavn¡ Nab¡dka');
  Writeln('----------------');
  Writeln;
  Writeln('1. Hra pro jednoho hr Ÿe');
  Writeln('2. Hra pro dva hr Ÿe');
  Writeln('3. Hra proti poŸ¡taŸi');
  Writeln('4. Konec');
  Writeln;
  Write('Volba:');
  read(volba)
 Until ((volba>0) and (volba<5));

 Menu:=volba;
end;

Function obtiznost:Longint;
var volba: longint;
begin
 repeat
  clrscr;
  Writeln('Zvol si obtiznost');
  Writeln('Hra ma 3 urovne podle rozsahu hadaneho cisla:');
  Writeln('1. Lehka do 100)');
  Writeln('2. Stredni do 1000');
  Writeln('3. Peklo (2,147,483,647)');
  Writeln;
  Writeln('Volba: ');
  Read(volba);
 Until (Volba>0) and (volba<3);

 case volba of
  1: obtiznost:=100;
  2: obtiznost:=1000;
  3: obtiznost:=2147483647;
 end;
end;

procedure pro_jednoho;
var cislo, typ, pokus : longint;

begin
 randomize;
 cislo := random(obtiznost);
 pokus := 0;
 Writeln;
 Writeln('Zadanim volby -1 hru vzdate.');
 Writeln;

 repeat
  inc(pokus);
  write('Zadej svuj tip: ');
  readln(typ);
  if cislo>typ then Writeln(UTF8TOANSI('Zadane cislo je mensi'));
  if cislo<typ then Writeln('Zadane cislo je vetsi');
  writeln(cislo);
 until typ = cislo;
 Writeln('ano bylo to cislo: ',cislo,'. Na uhadnuti bylo potreba ',pokus,' pokusu');

end;

var volba:Byte;
begin

 REPEAT
  Volba:=Menu;
  Case volba of
   1: pro_jednoho;
  end;
 UNTIL Menu = 4; {4=exit}



end.
