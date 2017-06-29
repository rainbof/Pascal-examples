type

 obj1 = object
  procedure c;
 end;

 obj2 = object(obj1)
 end;

 neco = record
  filler : array[1..50] of byte;
 end;

 Pneco = ^neco;

var
 promena : pointer;

procedure obj1.c;
begin
 new(promena);
 mem(promena,sizeof(neco));
 dispose(promena);
end;


begin

end.