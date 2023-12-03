{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/ELECTRICLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit EEPOWER;

INTERFACE

Procedure CapBackToBack(C1,C2,Lm,VLN,VLL:Real;Var IMax,IFreq:Real);
Procedure CapTransfer(t,Vs,R,Cs,Cd:Real;Var RVolt,VFinal:Real);
Procedure InductorCharge(t,Vs,R,L:Real;Var Vl,Il:Real);
Procedure InductorDischarge(t,Io,R,L:Real;Var Vl,Il:Real);
Function  InductorEnergy(L,I:Real):Real;
Function  VCapCharge(t,Vs,R,C:Real):Real;
Function  VCapDischarge(t,Vs,R,C:Real):Real;

IMPLEMENTATION

{ @description:  Cette fonction permet de calculer la tension d'un
                 condensateur se dÇchargeant en fonction du temps.
  @Param: t:     Temps Ö laquelle calculer la tension.
          Vs:    La tension de dÇmarrage du condensateur.
          R:     La valeur ohmique de la rÇsistance utilisÇe Ö dÇcharger.
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
  @Param: t:     Temps Ö laquelle calculer la tension.
          Vs:    La tension de charge du condensateur.
          R:     La valeur ohmique de la rÇsistance utilisÇe Ö dÇcharger.
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
                 bornes d'une rÇsistance de jonction (R) connectant
                 respectivement Cs et Cd, les condensateurs de source
                 d'Çnergie et de destination. Calculez la tension finale
                 aux bornes des deux condensateurs.
  @Param: t:     Temps Ö laquelle calculer la tension de la rÇsistance.
          Vs:    Tension initiale aux bornes de la source-condensateur (Cs).
          R:     Valeur de la rÇsistance connectant les condensateurs.
          Cs:    Valeur de la capacitÇ de la source en Farads.
          Cd:    Valeur de capacitÇ de destination en Farads.
          RVolt: Retourne la tension aux bornes de la rÇsistance au temps t.
          vfinal:Retourne la tension finale Ö laquelle les deux condensateurs se stabilisent.
}

Procedure CapTransfer(t,Vs,R,Cs,Cd:Real;Var RVolt,VFinal:Real);
Var
 Tau:Real;
Begin
 Tau:=(R*Cs*Cd)/(Cs+Cd);
 RVolt:=Vs*Exp(-t/tau);
 VFinal:=Vs*Cs/(Cs+Cd);
End;

{ @description: Cette fonction permet de calculer l'Çnergie entreposÇe
                dans un inducteur Çtant donnÇ l'inductance (en Henries)
                et le courant.
  @param: L:    Valeur d'inductance (en Henries)
          I:    Courant traversant l'inducteur.

}

Function InductorEnergy(L,I:Real):Real;Begin
 InductorEnergy:=(1/2*L*(I*I));
End;

{ @description: Cette fonction permet de calculer la tension et le
                courant d'un inducteur chargeant/entreposeant de
                l'Çnergie.
  @param: t:    Heure Ö laquelle calculer la tension et le courant.
          Vs:   Tension de charge aux bornes de l'inductance et de la rÇsistance.
          R:    RÇsistance liÇe Ö l'inducteur.
          L:    Valeur d'inductance en Henries.
          V1:   Retourne la tension aux bornes de l'inductance au temps t.
          I1:   Retourne le courant traversant l'inducteur au temps t.
}

Procedure InductorCharge(t,Vs,R,L:Real;Var Vl,Il:Real);Begin
 Vl:=Vs*Exp(-R*t/L);
 Il:=Vs/R*(1-Exp(-R*t/L));
End;

{ @description:  Cette procÇdure permet de dÇfinir la formule de
                 commutation capacitive dos Ö dos.
  @param: C1:    La premiäre capacitÇ
          C2:    La deuxiäme capacitÇ
          VLN:   La tension phase-neutre ressentie par l'un des (trois)
                 condensateurs du batterie de condensateurs triphasÇs.
          VLL:   La tension ligne Ö ligne subie par la batterie de
                 condensateurs triphasÇs.
          IMax:  êvalue le courant maximum.
          IFreq: êvalue la frÇquence du courant d'appel
}

Procedure CapBackToBack(C1,C2,Lm,VLN,VLL:Real;Var IMax,IFreq:Real);Begin
 IMax:=Sqrt(2/3)*VLL*Sqrt((C1*C2)/((C1+C2)*Lm));
 IFreq:=1/(2*PI*Sqrt(Lm*(C1*C2)/(C1+C2)));
End;

{ @description: Cette procÇdure permet de calculer la tension et le
                courant d'un inducteur dÇchargeant son Çnergie entreposÇe.
  @param: t:    Temps Ö laquelle calculer la tension et le courant.
          Io:   Courant initial traversant l'inducteur.
          R:    RÇsistance dÇchargÇe.
          L:    Valeur d'inductance en Henries.
          Vl:   Retourne la tension aux bornes de l'inductance au temps t.
          Il:   Courant traversant l'inducteur au temps t.
}

Procedure InductorDischarge(t,Io,R,L:Real;Var Vl,Il:Real);Begin
 Il:=Io*Exp(-R*t/L);
 Vl:=Io*R*(1-Exp(-R*t/L));
End;


END.