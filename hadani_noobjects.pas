program hadani_cisel;

uses Crt;
Function Menu:Byte;
var
        volba: Byte;
begin
 Repeat
 volba:=0;
  Writeln(' Hlavni Nabidka');
  Writeln('----------------');
  Writeln;
  Writeln('1. Hra pro jednoho hrace');
  Writeln('2. Hra pro dva hrace');
  Writeln('3. Hra proti pocitaci');
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
 Writeln('Ano bylo to cislo: ',cislo,'. Na uhadnuti bylo potreba ',pokus,' pokusu');

end;

Procedure prodva;
var
   cislo1, typ1, pokus1 : longint;
   cislo2, typ2, pokus2 : longint;
   difficulty, pokus : longint;

begin
 randomize;
 difficulty := obtiznost;
 cislo1 := random(obtiznost);
 cislo2 := random(obtiznost);

 pokus1 := 0;
 pokus2 := 0;

 Writeln;
 Writeln('Hadani cisel varianta pro dva hrace. Kazdy hada sve cislo.');
 Writeln('Zadanim volby -1 hru vzdate.');
 Writeln;

 repeat
  if typ1<>-1 then inc(pokus1);
  if typ2<>-1 then inc(pokus2);

  If (not (typ1=-1)) and (not (typ1=cislo1)) then
  Begin
    write('Hraci 1 zadej svuj tip: ');
    readln(typ1);
    if cislo1>typ1 then Writeln('Zadane cislo je mensi');
    if cislo1<typ1 then Writeln('Zadane cislo je vetsi');
    if cislo1 = typ1 then Writeln('Ano bylo to cislo: ',cislo1,'. Na uhadnuti bylo potreba ',pokus1,' pokusu');

    if typ1=-1 then Begin
                     Writeln('Hrac 1 vzdal svoji hru.');
                     dec(pokus1)
                    end;
  end;

  If (not (typ2=-1)) and (not (typ2=cislo2)) then
  Begin
    write('Hraci 2 zadej svuj tip: ');
    readln(typ2);
    if cislo2>typ2 then Writeln('Zadane cislo je mensi');
    if cislo2<typ2 then Writeln('Zadane cislo je vetsi');
    if cislo2 = typ2 then Writeln('Ano bylo to cislo: ',cislo2,'. Na uhadnuti bylo potreba ',pokus2,' pokusu');
    if typ2=-1 then Begin
                     Writeln('Hrac 2 vzdal svoji hru.');
                     dec(pokus2)
                    end;
  end;

  writeln(cislo1,',',cislo2);
 until ((typ1 = cislo1) or (typ1 = -1)) and ((typ2 = cislo2) or (typ2=-1));


end;

var volba:Byte;
begin

 REPEAT
  Volba:=Menu;
  Case volba of
   1: pro_jednoho;
   2: prodva;
  end;
 UNTIL Menu = 4; {4=exit}
end.
