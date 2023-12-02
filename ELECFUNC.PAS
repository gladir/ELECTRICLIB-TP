{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/ELECTRICLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit ELECFUNC;

INTERFACE

Function ConductorAmpacity(Material:String;TempRatingC:Integer;SizeAWG:String):Integer;

IMPLEMENTATION

Function ConductorAmpacity(Material:String;TempRatingC:Integer;SizeAWG:String):Integer;Begin
 ConductorAmpacity:=-1;
 If Material='CU'Then Begin
  Case TempRatingC of
    60:Begin
     If SizeAWG='1000MCM'Then ConductorAmpacity:=455 Else
     If SizeAWG='900MCM'Then ConductorAmpacity:=435 Else
     If SizeAWG='800MCM'Then ConductorAmpacity:=410 Else
     If SizeAWG='750MCM'Then ConductorAmpacity:=400 Else
     If SizeAWG='700MCM'Then ConductorAmpacity:=385 Else
     If SizeAWG='600MCM'Then ConductorAmpacity:=350 Else
     If SizeAWG='500MCM'Then ConductorAmpacity:=320 Else
     If SizeAWG='400MCM'Then ConductorAmpacity:=280 Else
     If SizeAWG='350MCM'Then ConductorAmpacity:=260 Else
     If SizeAWG='300MCM'Then ConductorAmpacity:=240 Else
     If SizeAWG='250MCM'Then ConductorAmpacity:=215 Else
     If SizeAWG='#4/0'Then ConductorAmpacity:=195 Else
     IF SizeAWG='#3/0'Then ConductorAmpacity:=165 Else
     If SizeAWG='#2/0'Then ConductorAmpacity:=145 Else
     If SizeAWG='#1/0'Then ConductorAmpacity:=125 Else
     If SizeAWG='#1'Then ConductorAmpacity:=110 Else
     If SizeAWG='#2'Then ConductorAmpacity:=95 Else
     If SizeAWG='#3'Then ConductorAmpacity:=85 Else
     If SizeAWG='#4'Then ConductorAmpacity:=70 Else
     If SizeAWG='#6'Then ConductorAmpacity:=55 Else
     If SizeAWG='#8'Then ConductorAmpacity:=40 Else
     If SizeAWG='#10'Then ConductorAmpacity:=30 Else
     If SizeAWG='#12'Then ConductorAmpacity:=20 Else
     If SizeAWG='#14'Then ConductorAmpacity:=15;
    End;
    75:Begin
     If SizeAWG='1000MCM'Then ConductorAmpacity:=545 Else
     If SizeAWG='900MCM'Then ConductorAmpacity:=520 Else
     If SizeAWG='800MCM'Then ConductorAmpacity:=490 Else
     If SizeAWG='750MCM'Then ConductorAmpacity:=475 Else
     If SizeAWG='700MCM'Then ConductorAmpacity:=460 Else
     If SizeAWG='600MCM'Then ConductorAmpacity:=420 Else
     If SizeAWG='500MCM'Then ConductorAmpacity:=380 Else
     If SizeAWG='400MCM'Then ConductorAmpacity:=335 Else
     If SizeAWG='350MCM'Then ConductorAmpacity:=310 Else
     If SizeAWG='300MCM'Then ConductorAmpacity:=285 Else
     If SizeAWG='250MCM'Then ConductorAmpacity:=255 Else
     If SizeAWG='#4/0'Then ConductorAmpacity:=230 Else
     If SizeAWG='#3/0'Then ConductorAmpacity:=200 Else
     If SizeAWG='#2/0'Then ConductorAmpacity:=175 Else
     If SizeAWG='#1/0'Then ConductorAmpacity:=150 Else
     If SizeAWG='#1'Then ConductorAmpacity:=130 Else
     If SizeAWG='#2'Then ConductorAmpacity:=115 Else
     If SizeAWG='#3'Then ConductorAmpacity:=100 Else
     If SizeAWG='#4'Then ConductorAmpacity:=85 Else
     If SizeAWG='#6'Then ConductorAmpacity:=65 Else
     If SizeAWG='#8'Then ConductorAmpacity:=50 Else
     If SizeAWG='#10'Then ConductorAmpacity:=35 Else
     If SizeAWG='#12'Then ConductorAmpacity:=25 Else
     If SizeAWG='#14'Then ConductorAmpacity:=20;
    End;
    90:Begin
     If SizeAWG='1000MCM'Then ConductorAmpacity:=615 Else
     If SizeAWG='900MCM'Then ConductorAmpacity:=585 Else
     If SizeAWG='800MCM'Then ConductorAmpacity:=555 Else
     If SizeAWG='750MCM'Then ConductorAmpacity:=535 Else
     If SizeAWG='700MCM'Then ConductorAmpacity:=520 Else
     If SizeAWG='600MCM'Then ConductorAmpacity:=475 Else
     If SizeAWG='500MCM'Then ConductorAmpacity:=430 Else
     If SizeAWG='400MCM'Then ConductorAmpacity:=380 Else
     If SizeAWG='300MCM'Then ConductorAmpacity:=320 Else
     If SizeAWG='350MCM'Then ConductorAmpacity:=350 Else
     If SizeAWG='250MCM'Then ConductorAmpacity:=290 Else
     If SizeAWG='#4/0'Then ConductorAmpacity:=260 Else
     If SizeAWG='#3/0'Then ConductorAmpacity:=225 Else
     If SizeAWG='#2/0'Then ConductorAmpacity:=195 Else
     If SizeAWG='#1/0'Then ConductorAmpacity:=170 Else
     If SizeAWG='#1'Then ConductorAmpacity:=145 Else
     If SizeAWG='#2'Then ConductorAmpacity:=130 Else
     If SizeAWG='#3'Then ConductorAmpacity:=115 Else
     If SizeAWG='#4'Then ConductorAmpacity:=95 Else
     If SizeAWG='#6'Then ConductorAmpacity:=75 Else
     If SizeAWG='#8'Then ConductorAmpacity:=55 Else
     If SizeAWG='#10'Then ConductorAmpacity:=40 Else
     If SizeAWG='#12'Then ConductorAmpacity:=30 Else
     If SizeAWG='#14'Then ConductorAmpacity:=25;
   End;
  End;
 End
  Else
 If Material='AL'Then Begin
  Case TempRatingC of
   60:Begin
    If SizeAWG='1000MCM'Then ConductorAmpacity:=375 Else
    If SizeAWG='900MCM'Then ConductorAmpacity:=355 Else
    If SizeAWG='800MCM'Then ConductorAmpacity:=330 Else
    If SizeAWG='750MCM'Then ConductorAmpacity:=320 Else
    If SizeAWG='700MCM'Then ConductorAmpacity:=315 Else
    If SizeAWG='600MCM'Then ConductorAmpacity:=285 Else
    If SizeAWG='500MCM'Then ConductorAmpacity:=260 Else
    If SizeAWG='400MCM'Then ConductorAmpacity:=225 Else
    If SizeAWG='350MCM'Then ConductorAmpacity:=210 Else
    If SizeAWG='300MCM'Then ConductorAmpacity:=195 Else
    If SizeAWG='250MCM'Then ConductorAmpacity:=170 Else
    If SizeAWG='#4/0'Then ConductorAmpacity:=150 Else
    If SizeAWG='#3/0'Then ConductorAmpacity:=130 Else
    If SizeAWG='#2/0'Then ConductorAmpacity:=115 Else
    If SizeAWG='#1/0'Then ConductorAmpacity:=100 Else
    If SizeAWG='#1'Then ConductorAmpacity:=85 Else
    If SizeAWG='#2'Then ConductorAmpacity:=75 Else
    If SizeAWG='#3'Then ConductorAmpacity:=65 Else
    If SizeAWG='#4'Then ConductorAmpacity:=55 Else
    If SizeAWG='#6'Then ConductorAmpacity:=40 Else
    If SizeAWG='#8'Then ConductorAmpacity:=35 Else
    If SizeAWG='#10'Then ConductorAmpacity:=25 Else
    If SizeAWG='#12'Then ConductorAmpacity:=15;
   End;
   75:Begin
    If SizeAWG='1000MCM'Then ConductorAmpacity:=445 Else
    If SizeAWG='900MCM'Then ConductorAmpacity:=425 Else
    If SizeAWG='800MCM'Then ConductorAmpacity:=395 Else
    If SizeAWG='750MCM'Then ConductorAmpacity:=385 Else
    If SizeAWG='700MCM'Then ConductorAmpacity:=375 Else
    If SizeAWG='600MCM'Then ConductorAmpacity:=340 Else
    If SizeAWG='500MCM'Then ConductorAmpacity:=310 Else
    If SizeAWG='400MCM'Then ConductorAmpacity:=270 Else
    If SizeAWG='350MCM'Then ConductorAmpacity:=250 Else
    If SizeAWG='300MCM'Then ConductorAmpacity:=230 Else
    If SizeAWG='250MCM'Then ConductorAmpacity:=205 Else
    If SizeAWG='#4/0'Then ConductorAmpacity:=180 Else
    If SizeAWG='#3/0'Then ConductorAmpacity:=155 Else
    If SizeAWG='#2/0'Then ConductorAmpacity:=135 Else
    If SizeAWG='#1/0'Then ConductorAmpacity:=120 Else
    If SizeAWG='#1'Then ConductorAmpacity:=100 Else
    If SizeAWG='#2'Then ConductorAmpacity:=90 Else
    If SizeAWG='#3'Then ConductorAmpacity:=75 Else
    If SizeAWG='#4'Then ConductorAmpacity:=65 Else
    If SizeAWG='#6'Then ConductorAmpacity:=50 Else
    If SizeAWG='#8'Then ConductorAmpacity:=40 Else
    If SizeAWG='#10'Then ConductorAmpacity:=30 Else
    If SizeAWG='#12'Then ConductorAmpacity:=20;
   End;
   90:Begin
    If SizeAWG='1000MCM'Then ConductorAmpacity:=500 Else
    If SizeAWG='900MCM'Then ConductorAmpacity:=480 Else
    If SizeAWG='800MCM'Then ConductorAmpacity:=445 Else
    If SizeAWG='750MCM'Then ConductorAmpacity:=435 Else
    If SizeAWG='700MCM'Then ConductorAmpacity:=425 Else
    If SizeAWG='600MCM'Then ConductorAmpacity:=385 Else
    If SizeAWG='500MCM'Then ConductorAmpacity:=350 Else
    If SizeAWG='400MCM'Then ConductorAmpacity:=305 Else
    If SizeAWG='350MCM'Then ConductorAmpacity:=280 Else
    If SizeAWG='300MCM'Then ConductorAmpacity:=260 Else
    If SizeAWG='250MCM'Then ConductorAmpacity:=230 Else
    If SizeAWG='#4/0'Then ConductorAmpacity:=205 Else
    If SizeAWG='#3/0'Then ConductorAmpacity:=175 Else
    If SizeAWG='#2/0'Then ConductorAmpacity:=150 Else
    If SizeAWG='#1/0'Then ConductorAmpacity:=135 Else
    If SizeAWG='#1'Then ConductorAmpacity:=115 Else
    If SizeAWG='#2'Then ConductorAmpacity:=100 Else
    If SizeAWG='#3'Then ConductorAmpacity:=85 Else
    If SizeAWG='#4'Then ConductorAmpacity:=75 Else
    If SizeAWG='#6'Then ConductorAmpacity:=55 Else
    If SizeAWG='#8'Then ConductorAmpacity:=45 Else
    If SizeAWG='#10'Then ConductorAmpacity:=35 Else
    If SizeAWG='#12'Then ConductorAmpacity:=25;
   End;
  End;
 End;
End;

END.
