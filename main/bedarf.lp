
%% Berechnung des Grundbedarfs in Kcal pro Tag
%% Grundumsatz (GU) nach Harris und Benedict (1919)

%%Grundumsatz
gu(m, (66473  + (13752 * X) + (5003 * Y) - (6755 * Z)) / 1000) :- gewicht(X), groesse(Y), alter(Z).
gu(w, (655096 + ( 9563 * X) + (1850 * Y) - (4676 * Z)) / 1000) :- gewicht(X), groesse(Y), alter(Z).

%% Grundumsatz skaliert mit PAL um den Grundbedarf(Bedarf) zu errechnen
bedarf(X * Y / 10):- gu(G, X), pal(Y), geschlecht(G).

%% Vitamin C in Milligramm Bedarf fuer 19 - 25
bedarf(vitaminC,  95) :- geschlecht(w).
bedarf(vitaminC, 110) :- geschlecht(m).

%% Vitamin B6 in Mikrogramm Bedarf feur 19 - 25
bedarf(vitaminB6,  12) :- geschlecht(w).
bedarf(vitaminB6,  15) :- geschlecht(m).

%% Magnesium in Milligramm Bedarf feur 19 - 25
bedarf(magnesium, 310) :- geschlecht(w).
bedarf(magnesium, 400) :- geschlecht(m).

%% Eisen in Mikrogramm Bedarf feur 19 - 25
bedarf(eisen, 150) :- geschlecht(w).
bedarf(eisen, 100) :- geschlecht(m).

%% Calcium in Milligramm Bedarf feur 19 - 25
bedarf(calcium, 1000) :- geschlecht(w).
bedarf(calcium, 1000) :- geschlecht(m).

bedarfKcal(kohlenhydrate, X / 2) :- bedarf(X).
