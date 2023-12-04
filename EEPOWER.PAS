{ @author: Sylvain Maltais (support@gladir.com)
  @created: 2023
  @website(https://www.gladir.com/CODER/ELECTRICLIB-TP)
  @abstract(Target: Turbo Pascal 7, Free Pascal 3.2)
}

Unit EEPOWER;

INTERFACE

Procedure CapBackToBack(C1,C2,Lm,VLN,VLL:Real;Var IMax,IFreq:Real);
Function  CapEnergy(C,v:Real):Real;
Procedure CapTransfer(t,Vs,R,Cs,Cd:Real;Var RVolt,VFinal:Real);
Function  Farads(Va,V,Freq:Real):Real;
Procedure InductorCharge(t,Vs,R,L:Real;Var Vl,Il:Real);
Procedure InductorDischarge(t,Io,R,L:Real;Var Vl,Il:Real);
Function  InductorEnergy(L,I:Real):Real;
Function  LoadedVCapDischarge(t,vo,C,P:Real):Real;
Function  Rectifier(Iload,fswitch,dVout:Real):Real;
Function  TimeDischarge(Vinit,Vmin,C,P,dt:Real;RMS,Eremain:Boolean;Var E:Real):Real;
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

{ @description: Cette fonction permet de calculer l'‚nergie entrepos‚e
                dans un inducteur ‚tant donn‚ l'inductance (en Henries)
                et le courant.
  @param: L:    Valeur d'inductance (en Henries)
          I:    Courant traversant l'inducteur.

}

Function InductorEnergy(L,I:Real):Real;Begin
 InductorEnergy:=(1/2*L*(I*I));
End;

{ @description: Cette fonction permet de calculer la tension et le
                courant d'un inducteur chargeant/entreposeant de
                l'‚nergie.
  @param: t:    Heure … laquelle calculer la tension et le courant.
          Vs:   Tension de charge aux bornes de l'inductance et de la r‚sistance.
          R:    R‚sistance li‚e … l'inducteur.
          L:    Valeur d'inductance en Henries.
          V1:   Retourne la tension aux bornes de l'inductance au temps t.
          I1:   Retourne le courant traversant l'inducteur au temps t.
}

Procedure InductorCharge(t,Vs,R,L:Real;Var Vl,Il:Real);Begin
 Vl:=Vs*Exp(-R*t/L);
 Il:=Vs/R*(1-Exp(-R*t/L));
End;

{ @description:  Cette proc‚dure permet de d‚finir la formule de
                 commutation capacitive dos … dos.
  @param: C1:    La premiŠre capacit‚
          C2:    La deuxiŠme capacit‚
          VLN:   La tension phase-neutre ressentie par l'un des (trois)
                 condensateurs du batterie de condensateurs triphas‚s.
          VLL:   La tension ligne … ligne subie par la batterie de
                 condensateurs triphas‚s.
          IMax:  value le courant maximum.
          IFreq: value la fr‚quence du courant d'appel
}

Procedure CapBackToBack(C1,C2,Lm,VLN,VLL:Real;Var IMax,IFreq:Real);Begin
 IMax:=Sqrt(2/3)*VLL*Sqrt((C1*C2)/((C1+C2)*Lm));
 IFreq:=1/(2*PI*Sqrt(Lm*(C1*C2)/(C1+C2)));
End;

{ @description: Cette proc‚dure permet de calculer la tension et le
                courant d'un inducteur d‚chargeant son ‚nergie entrepos‚e.
  @param: t:    Temps … laquelle calculer la tension et le courant.
          Io:   Courant initial traversant l'inducteur.
          R:    R‚sistance d‚charg‚e.
          L:    Valeur d'inductance en Henries.
          Vl:   Retourne la tension aux bornes de l'inductance au temps t.
          Il:   Courant traversant l'inducteur au temps t.
}

Procedure InductorDischarge(t,Io,R,L:Real;Var Vl,Il:Real);Begin
 Il:=Io*Exp(-R*t/L);
 Vl:=Io*R*(1-Exp(-R*t/L));
End;

{ @description: Cette fonction permet de calculer la capacit‚ requise
                en Farads pour fournir la puissance nominale souhait‚e (Va).
  @param: Va:   La puissance nominale … respecter.
          V:    La tension aux bornes du condensateur; non d‚crit comme
                VLL ou VLN, simplement la tension du condensateur.
          Freq: La fr‚quence du systŠme.

}

Function Farads(Va,V,Freq:Real):Real;Begin
 Farads:=(Va/(2*PI*Freq*(V*V)));
End;

{ @description: Cette fonction permet de calculer la tension entrepos‚e
                (en Joules) dans un condensateur avec une tension charg‚e.
  @param: C:    Capacit‚ en Farads.
          v:    Tension aux bornes du condensateur.
}

Function CapEnergy(C,v:Real):Real;Begin
 CapEnergy:=1/2*C*(V*V);
End;

{ @description: Cette fonction permet de retourner la tension d'un
                condensateur en d‚charge aprŠs un temps (t - secondes)
                ‚tant donn‚ la tension initiale (vo - volts), la taille
                du condensateur (cap - Farads) et la charge (P - Watts).
  @param: t:    Heure … laquelle calculer la tension.
          vo:   Tension initiale du condensateur.
          C:    Capacit‚ (en Farads).
          P:    Consommation ‚lectrique de la charge (en Watts).
}

Function LoadedVCapDischarge(t,vo,C,P:Real):Real;Begin
 LoadedVCapDischarge:=Sqrt((vo*vo)-2*P*t/C);
End;

{ @description: Cette fonction permet de retourner le temps n‚cessaire
                pour d‚charger un condensateur … une tension sp‚cifi‚e
                ‚tant donn‚ un ensemble d'entr‚es.
}

Function TimeDischarge(Vinit,Vmin,C,P,dt:Real;RMS,Eremain:Boolean;Var E:Real):Real;
Var
 T,Vo,Vc,Vcp:Real;
Begin
 T:=0;
 If(RMS)Then Vo:=Vinit*Sqrt(2)
        Else Vo:=Vinit;
 Vc:=LoadedVCapDischarge(T,Vo,C,P);
 While(Vc>=Vmin)do Begin
  T:=T+Dt;
  Vcp:=Vc;
  Vc:=LoadedVCapDischarge(T,Vo,C,P);
 End;
 If(Eremain)Then Begin
  E:=CapEnergy(C,vcp);
  TimeDischarge:=T-Dt;
 End
  Else
 Begin
  TimeDischarge:=T-Dt;
 End;
End;

{ @description:    Cette fonction permet de retourner la capacit‚ (en Farads)
                   d'un condensateur n‚cessaire dans une configuration de
                   redresseur ‚tant donn‚ la fr‚quence du systŠme (en Hz),
                   la charge (en ampŠres) et l'ondulation de tension
                   souhait‚e..
  @param: Iload:   Le courant de charge devant ˆtre respect‚.
          fswitch: La fr‚quence de commutation du systŠme.
          dVout:   Delta-V souhait‚ sur la sortie.
}

Function Rectifier(Iload,fswitch,dVout:Real):Real;Begin
 Rectifier:=Iload/(FSwitch*dVout);
End;

END.