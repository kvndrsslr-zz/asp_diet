%%% Generationsteil
%%% ===============
%%% Ein Tag umfasst Frühstück, Mittag und Abendbrot
tag(FX,FP1,FY,FP2,FZ,FP3,MX,MP1,MY,MP2,MZ,MP3,AX,AP1,AY,AP2,AZ,AP3) :- fruehstueck(FX,FP1,FY,FP2,FZ,FP3), hauptmahlzeit(MX,MP1,MY,MP2,MZ,MP3), abendbrot(AX,AP1,AY,AP2,AZ,AP3).
%%% Es sollen 3 einzigartige Gerichte benutzt werden
:- tag(FX,FP1,FY,FP2,FZ,FP3,MX,MP1,MY,MP2,MZ,MP3,AX,AP1,AY,AP2,AZ,AP3), FX=MX, FY=MY, FZ=MZ.
:- tag(FX,FP1,FY,FP2,FZ,FP3,MX,MP1,MY,MP2,MZ,MP3,AX,AP1,AY,AP2,AZ,AP3), FX=AX, FY=AY, FZ=AZ.
:- tag(FX,FP1,FY,FP2,FZ,FP3,MX,MP1,MY,MP2,MZ,MP3,AX,AP1,AY,AP2,AZ,AP3), FX=AX, FY=AZ, FZ=AY.
:- tag(FX,FP1,FY,FP2,FZ,FP3,MX,MP1,MY,MP2,MZ,MP3,AX,AP1,AY,AP2,AZ,AP3), AX=MX, AY=MY, AZ=MZ.
%%% Gerichte liegen in vorkalkulierten 100kcal Einheiten vor.
%%% Energie soll in etwa gleich über den Tag verteilt werden, aber mehr auf Mittag (Hauptmahlzeit)
%%% Berechne zuerst aus persönlichem Bedarf Anzahl von benötigten 100kcal Einheiten := Z

portionsBedarf(X/100) :- bedarf(X).
portionsBedarfRest(X%100) :- bedarf(X).
%%% Teile diese Anzahl durch 3 := X
%%% Weise jeweils X-1 Einheiten Frühstück / Abendbrot zu und Z - 2X +2 der Hauptmahlzeit.


%%% Constraints
%%% ===============
%%% Berücksichtige nur Kombinationen von Gerichten, welche in der Summe den empfohlenen Nährstoffzufuhren nahe kommen.
%%% Frage: Soll berechnung / Statement dieser empfohlenen Tagesdosen in bedarf.lp oder hier erfolgen?
