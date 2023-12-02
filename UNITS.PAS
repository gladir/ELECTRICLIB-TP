{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/ELECTRICLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit UNITS;

INTERFACE

Type
 ElectricUnit=(
  Joule,
  MilliJoule,
  MicroJoule,
  GigaWatt,
  MegaWatt,
  KiloWatt,
  Watt,
  MilliWatt,
  MicroWatt,
  Percentage
 );

Function GigaWattToKiloWatt(R:Real):Real;
Function GigaWattToMegaWatt(R:Real):Real;
Function GigaWattToWatt(R:Real):Real;
Function KiloWattToGigaWatt(R:Real):Real;
Function KiloWattToMegaWatt(R:Real):Real;
Function KiloWattToWatt(R:Real):Real;
Function MegaWattToKiloWatt(R:Real):Real;
Function MegaWattToGigaWatt(R:Real):Real;

IMPLEMENTATION

Function GigaWattToKiloWatt(R:Real):Real;Begin
 GigaWattToKiloWatt:=R*1000000.0;
End;

Function GigaWattToMegaWatt(R:Real):Real;Begin
 GigaWattToMegaWatt:=R*1000.0;
End;

Function GigaWattToWatt(R:Real):Real;Begin
 GigaWattToWatt:=R*1000000000.0;
End;

Function KiloWattToWatt(R:Real):Real;Begin
 KiloWattToWatt:=R*1000.0;
End;

Function KiloWattToMegaWatt(R:Real):Real;Begin
 KiloWattToMegaWatt:=R*0.001;
End;

Function KiloWattToGigaWatt(R:Real):Real;Begin
 KiloWattToGigaWatt:=R*0.000001;
End;

Function MegaWattToGigaWatt(R:Real):Real;Begin
 MegaWattToGigaWatt:=R*0.001;
End;

Function MegaWattToKiloWatt(R:Real):Real;Begin
 MegaWattToKiloWatt:=R*1000.0;
End;

END.