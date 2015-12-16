
%% Berechnung des Grundbedarfs in Kcal pro Tag
%% Grundumsatz (GU) nach Harris und Benedict (1919)

%%Grundumsatz
gu(m, (66473  + (13752 * X) + (5003 * Y) - (6755 * Z)) / 1000) :- gewicht(X), groesse(Y), alter(Z).
gu(w, (655096 + ( 9563 * X) + (1850 * Y) - (4676 * Z)) / 1000) :- gewicht(X), groesse(Y), alter(Z).

%% Grundumsatz skaliert mit PAL um den Grundbedarf(Bedarf) zu errechnen
bedarf(X * Y / 10):- gu(G, X), pal(Y), geschlecht(G).

bedarf(vitaminC,  95) :- geschlecht(w).
bedarf(vitaminC, 110) :- geschlecht(m).

bedarfKcal(kohlenhydrate, X / 2) :- bedarf(X).
