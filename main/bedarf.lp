
%% Berechnung des Grundbedarfs in Kcal pro Tag
%% Grundumsatz (GU) nach Harris und Benedict (1919)

%%Grundumsatz in Kcal/Tag
gu(m, (66473  + (13752 * X) + (5003 * Y) - (6755 * Z)) / 1000) :- gewicht(X), groesse(Y), alter(Z).
gu(w, (655096 + ( 9563 * X) + (1850 * Y) - (4676 * Z)) / 1000) :- gewicht(X), groesse(Y), alter(Z).

%% Grundumsatz skaliert mit PAL um den Grundbedarf(Bedarf) zu errechnen
bedarf(kcal, X * Y / 10):- gu(G, X), pal(Y), geschlecht(G).

%% Tagesbedarf Vitamin C in Milligramm Bedarf fuer 19 - 25
bedarf(vitaminC,  95) :- geschlecht(w).
bedarf(vitaminC, 110) :- geschlecht(m).

%% Tagesbedarf Vitamin B6 in Mikrogramm Bedarf feur 19 - 25
bedarf(vitaminB6,  1200) :- geschlecht(w).
bedarf(vitaminB6,  1600) :- geschlecht(m).

%% Tagesbedarf Magnesium in Milligramm Bedarf feur 19 - 25
bedarf(magnesium, 310) :- geschlecht(w).
bedarf(magnesium, 400) :- geschlecht(m).

%% Tagesbedarf Eisen in Mikrogramm Bedarf feur 19 - 25
bedarf(eisen, 1500) :- geschlecht(w).
bedarf(eisen, 1000) :- geschlecht(m).

%% Tagesbedarf Calcium in Milligramm Bedarf feur 19 - 25
bedarf(calcium, 1000).

%% Tagesbedarf Bedarf Proteine 
bedarf(protein, (X * 8)/10 ):- gewicht(X), geschlecht(w).
bedarf(protein, (X * 9)/10 ):- gewicht(X), geschlecht(m).

%% Tagesbedarf Bedarf Kohlenhydrate min 50% des Tagesbedarfs (1g Kohlenhydrate =  4,1 kcal)
bedarf(kohlenhydrate, ((X * 25 / 100) * 10) / 41) :- bedarf(kcal, X).

%% Tagesbedarf Fette max 30% des Tagesbedarfs (1 g Fett =  9,3 kcal)
bedarfMax(fett, (((X * 30)/100) * 10) / 93) :- bedarf(kcal, X).

%%%Quellen
% Die Referenzwerte fuer die Naehrstoffzufuhr stammen von der DGE (https://www.dge.de/) 
% Zur berechnung des Grundbedarfs und zur Ermmittlung des PAL Werts siehe (http://www.ernaehrung.de/tipps/allgemeine_infos/ernaehr10.php)
