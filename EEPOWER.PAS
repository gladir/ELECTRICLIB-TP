{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/ELECTRICLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit EEPOWER;

INTERFACE

Procedure CapTransfer(t,Vs,R,Cs,Cd:Real;Var RVolt,VFinal:Real);
Function  VCapCharge(t,Vs,R,C:Real):Real;
Function  VCapDischarge(t,Vs,R,C:Real):Real;

IMPLEMENTATION

{ @description:  Cette fonction permet de calculer la tension d'un
                 condensateur se d‚chargeant en fonction du temps.
  @Param: t:     Temps … laquelle calculer la tension.
          Vs:    La tension de d‚marrage du condensateur.
          R:     La valeur ohmique de la r‚sistance utilis‚e … d‚charger.
          C:     Valeur capacitive (en Farads).
}

Function VCapDischarge(t,Vs,R,C:Real):Real;
Var
 Vc:Real;
Begin
 Vc:=Vs*(Exp(-t/(R*C)));
 VCapDischarge:=Vc;
End;

{ @description:  Cette fonction permet de calculer la tension d'un
                 condensateur en charge en fonction du temps.
  @Param: t:     Temps … laquelle calculer la tension.
          Vs:    La tension de charge du condensateur.
          R:     La valeur ohmique de la r‚sistance utilis‚e … d‚charger.
          C:     Valeur capacitive (en Farads).
}

Function VCapCharge(t,Vs,R,C:Real):Real;
Var
 Vc:Real;
Begin
 Vc:=Vs*(1-Exp(-t/(R*C)));
 VCapCharge:=Vc;
End;

{ @description:  Cette fonction permet de calculer la tension aux
                 bornes d'une r‚sistance de jonction (R) connectant
                 respectivement Cs et Cd, les condensateurs de source
                 d'‚nergie et de destination. Calculez la tension finale
                 aux bornes des deux condensateurs.
  @Param: t:     Temps … laquelle calculer la tension de la r‚sistance.
          Vs:    Tension initiale aux bornes de la source-condensateur (Cs).
          R:     Valeur de la r‚sistance connectant les condensateurs.
          Cs:    Valeur de la capacit‚ de la source en Farads.
          Cd:    Valeur de capacit‚ de destination en Farads.
          RVolt: Retourne la tension aux bornes de la r‚sistance au temps t.
          vfinal:Retourne la tension finale … laquelle les deux condensateurs se stabilisent.
}

Procedure CapTransfer(t,Vs,R,Cs,Cd:Real;Var RVolt,VFinal:Real);
Var
 Tau:Real;
Begin
 Tau:=(R*Cs*Cd)/(Cs+Cd);
 RVolt:=Vs*Exp(-t/tau);
 VFinal:=Vs*Cs/(Cs+Cd);
End;

END.