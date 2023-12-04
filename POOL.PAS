{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/ELECTRICLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit POOL;

INTERFACE

Function  GetKiloWattsByAmpereAndVoltage(Amp,Volt:Real):Real;
Function  GetPoolAmpere:Real;
Function  GetPoolVolts:Integer;
Function  GetPriceForSwimmingPoolMotor(NumberOfDays:Real):Real;
Function  GetPriceOfkWh:Real;
Procedure SetPoolAmpere(Ampere:Real);
Procedure SetPoolVolts(Volts:Integer);
Procedure SetPriceOfkWh(Price:Real);

IMPLEMENTATION

Const
 NumbersOfHoursByDays=24;

Var
 PriceOfkWh:Real;
 PoolAmpere:Real;
 PoolVolts:Integer;

Function GetKiloWattsByAmpereAndVoltage(Amp,Volt:Real):Real;Begin
 GetKiloWattsByAmpereAndVoltage:=(Amp*Volt)/1000;
End;

Function GetPriceForSwimmingPoolMotor(NumberOfDays:Real):Real;Begin
 GetPriceForSwimmingPoolMotor:=
  GetKiloWattsByAmpereAndVoltage(PoolAmpere,PoolVolts)*PriceOfkWh*NumbersOfHoursByDays*NumberOfDays;
End;

Procedure SetPriceOfkWh(Price:Real);Begin
 PriceOfkWh:=Price;
End;

Function GetPriceOfkWh:Real;Begin
 GetPriceOfkWh:=PriceOfkWh;
End;

Procedure SetPoolAmpere(Ampere:Real);Begin
 PoolAmpere:=Ampere;
End;

Function GetPoolAmpere:Real;Begin
 GetPoolAmpere:=PoolAmpere;
End;

Procedure SetPoolVolts(Volts:Integer);Begin
 PoolVolts:=Volts;
End;

Function GetPoolVolts:Integer;Begin
 GetPoolVolts:=PoolVolts;
End;

BEGIN
 PriceOfkWh:=0.0751; { Valeur par d‚faut 7.51 cents de l'heure le Kilowatteurs }
 PoolAmpere:=9;      { Valeur par d‚faut 9 amps pour un moteur de piscine }
 PoolVolts:=110;     { Valeur par d‚faut 110 volts pour un moteur de piscine }
END.