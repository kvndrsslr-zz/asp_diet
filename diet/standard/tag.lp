%%% Generationsteil
%%% ===============
%%% Ein Tag umfasst Frühstück, Mittag und Abendbrot
%%% Gerichte liegen in vorkalkulierten 100kcal Einheiten vor.
%%% Energie soll in etwa gleich über den Tag verteilt werden, aber mehr auf Mittag (Hauptmahlzeit)
%%% Berechne zuerst aus persönlichem Bedarf Anzahl von benötigten 100kcal Einheiten := Z
%%% Teile diese Anzahl durch 3 := X
%%% Weise jeweils X-1 Einheiten Frühstück / Abendbrot zu und Z - 2X +2 der Hauptmahlzeit.
tag(FX,FP1*X/300-1,FY,FP2*X/300-1,FZ,FP3*X/300-1,MX,MP1*(X/300+2),MY,MP2*(X/300+2),MZ,MP3*(X/300+2),AX,AP1*X/300-1,AY,AP2*X/300-1,AZ,AP3*X/300-1) :- fruehstueck(FX,FP1,FY,FP2,FZ,FP3), hauptmahlzeit(MX,MP1,MY,MP2,MZ,MP3), abendessen(AX,AP1,AY,AP2,AZ,AP3), bedarf(kcal, X).
%%% Constraints
%%% ===============
%%% Es sollen 3 einzigartige Gerichte benutzt werden
%:- tag(FX,FP1,FY,FP2,FZ,FP3,MX,MP1,MY,MP2,MZ,MP3,AX,AP1,AY,AP2,AZ,AP3), FX=MX, FY=MY, FZ=MZ.
%:- tag(FX,FP1,FY,FP2,FZ,FP3,MX,MP1,MY,MP2,MZ,MP3,AX,AP1,AY,AP2,AZ,AP3), FX=AX, FY=AY, FZ=AZ.
%:- tag(FX,FP1,FY,FP2,FZ,FP3,MX,MP1,MY,MP2,MZ,MP3,AX,AP1,AY,AP2,AZ,AP3), FX=AX, FY=AZ, FZ=AY.
%:- tag(FX,FP1,FY,FP2,FZ,FP3,MX,MP1,MY,MP2,MZ,MP3,AX,AP1,AY,AP2,AZ,AP3), AX=MX, AY=MY, AZ=MZ.
%%% Berücksichtige nur Kombinationen von Gerichten, welche in der Summe über den jeweiligen empfohlenen Nährstoffmengen liegen.
%%% Minimalbedarf 
:- tag(FX,FP1,FY,FP2,FZ,FP3,MX,MP1,MY,MP2,MZ,MP3,AX,AP1,AY,AP2,AZ,AP3), portionHatNaehrstoff(FX, A, B1), portionHatNaehrstoff(FY, A, B2), portionHatNaehrstoff(FZ, A, B3), portionHatNaehrstoff(MX, A, B4), portionHatNaehrstoff(MY, A, B5), portionHatNaehrstoff(MZ, A, B6), portionHatNaehrstoff(AX, A, B7), portionHatNaehrstoff(AY, A, B8), portionHatNaehrstoff(AZ, A, B9), bedarf(A, B10),  FP1*B1+FP2*B2+FP3*B3+MP1*B4+MP2*B5+MP3*B6+AP1*B7+AP2*B8+AP3*B9 < B10.
%%% Maximalbedarf
%:- tag(FX,FP1,FY,FP2,FZ,FP3,MX,MP1,MY,MP2,MZ,MP3,AX,AP1,AY,AP2,AZ,AP3), portionHatNaehrstoff(FX, A, B1), portionHatNaehrstoff(FY, A, B2), portionHatNaehrstoff(FZ, A, B3), portionHatNaehrstoff(MX, A, B4), portionHatNaehrstoff(MY, A, B5), portionHatNaehrstoff(MZ, A, B6), portionHatNaehrstoff(AX, A, B7), portionHatNaehrstoff(AY, A, B8), portionHatNaehrstoff(AZ, A, B9), bedarfMax(A, B10),  FP1*B1+FP2*B2+FP3*B3+MP1*B4+MP2*B5+MP3*B6+AP1*B7+AP2*B8+AP3*B9 > B10.
