%%% Generationsteil
%%% ===============
%%% Ein Tag umfasst Frühstück, Mittag und Abendbrot
%%% Es sollen 3 einzigartige Gerichte benutzt werden
%%% Gerichte liegen in vorkalkulierten 100kcal Einheiten vor.
%%% Energie soll in etwa gleich über den Tag verteilt werden, aber mehr auf Mittag (Hauptmahlzeit)
%%% Berechne zuerst aus persönlichem Bedarf Anzahl von benötigten 100kcal Einheiten := Z
%%% Teile diese Anzahl durch 3 := X
%%% Weise jeweils X-1 Einheiten Frühstück / Abendbrot zu und Z - 2X +2 der Hauptmahlzeit.

%%% Constraints
%%% ===============
%%% Berücksichtige nur Kombinationen von Gerichten, welche in der Summe den empfohlenen Nährstoffzufuhren nahe kommen.
%%% Frage: Soll berechnung / Statement dieser empfohlenen Tagesdosen in bedarf.lp oder hier erfolgen?
