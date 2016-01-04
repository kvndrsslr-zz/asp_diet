
%% Berechnung des Grundbedarfs in Kcal pro Tag
%% Grundumsatz (GU) nach Harris und Benedict (1919)

%%Grundumsatz in Kcal/Tag
gu(m, (66473  + (13752 * X) + (5003 * Y) - (6755 * Z)) / 1000) :- gewicht(X), groesse(Y), alter(Z).
gu(w, (655096 + ( 9563 * X) + (1850 * Y) - (4676 * Z)) / 1000) :- gewicht(X), groesse(Y), alter(Z).

%% Grundumsatz skaliert mit PAL um den Grundbedarf(Bedarf) zu errechnen
bedarf(X * Y / 10):- gu(G, X), pal(Y), geschlecht(G).

%% Vitamin C in Milligramm Bedarf fuer 19 - 25
bedarfvitC(vitaminC,  95) :- geschlecht(w).
bedarfvitC(vitaminC, 110) :- geschlecht(m).

%% Vitamin B6 in Mikrogramm Bedarf feur 19 - 25
bedarfvitB6(vitaminB6,  1200) :- geschlecht(w).
bedarfvitB6(vitaminB6,  1600) :- geschlecht(m).

%% Magnesium in Milligramm Bedarf feur 19 - 25
bedarfMg(magnesium, 310) :- geschlecht(w).
bedarfMg(magnesium, 400) :- geschlecht(m).

%% Eisen in Mikrogramm Bedarf feur 19 - 25
bedarfFe(eisen, 1500) :- geschlecht(w).
bedarfFe(eisen, 1000) :- geschlecht(m).

%% Calcium in Milligramm Bedarf feur 19 - 25
bedarfCa(calcium, 1000) :- geschlecht(w).
bedarfCa(calcium, 1000) :- geschlecht(m).

%% Bedarf Proteine 
bedarfProt(protein, (X * 8)/10 ):- gewicht(X), geschlecht(w).
bedarfProt(protein, (X * 9)/10 ):- gewicht(X), geschlecht(m).

%% Bedarf Kohlenhydrate (Kcal)
bedarfKcal(kohlenhydrate, X / 2) :- bedarf(X).

%% Bedarf Fette 30% des Tagesbedarfs (Kcal)
bedarfFett(fett, (X * 30)/100):- bedarf(X).