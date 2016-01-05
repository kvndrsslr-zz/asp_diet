
%%% Skalierung der Nährstoffe mit 1000 für mehr Rechengenauigkeit
hatSkaliertNaehrstoff(X,Y,Z * 1000) :-  hatNaehrstoff(X,Y,Z).

%%% Portion hat 5cal
kalorienProPortion(5).

%%% Berechne Gewicht einer Portion
portionHatGewicht(X, (Z * 100) / Y) :- hatKalorien(X, Y), kalorienProPortion(Z).

%%% Berechne skalierte Nährstoffe einer Portion
portionHatNaehrstoff(X, Y, (Z * W) / 100) :- hatSkaliertNaehrstoff(X, Y, Z), portionHatGewicht(X, W).

%%% Hauptmahlzeiten bestehend aus drei Komponenten und dazugehörigen Portionen (insgesamt 20 Portionen)
hauptmahlzeit(X, 10, Y, 7, Z, 3) :- hatKategorie(X, hauptkomponente), hatKategorie(Y, beilage), hatKategorie(Z, gemuese).
hauptmahlzeit(X, 10, Y, 7, Z, 3) :- hatKategorie(X, hauptkomponente), hatKategorie(Y, beilage), hatKategorie(Z,   sosse).
hauptmahlzeit(X, 12, Y, 4, Z, 4) :- hatKategorie(X, hauptkomponente), hatKategorie(Y, gemuese), hatKategorie(Z,   sosse).
hauptmahlzeit(X, 10, Y, 5, Z, 5) :- hatKategorie(X,         beilage), hatKategorie(Y, gemuese), hatKategorie(Z,   sosse).

%%% Snacks bestehend aus drei Komponenten mit Portionen
snack(X, 3, Y, 10, Z, 7) :- hatKategorie(X, getraenk), hatKategorie(Y, snack), hatKategorie(Z,   snack), Y != Z.
snack(X, 3, Y, 10, Z, 7) :- hatKategorie(X, getraenk), hatKategorie(Y, snack), hatKategorie(Z,    obst).

%%% Frühstück und Abendessen sind Snacks
fruehstueck(X, P1, Y, P2, Z, P3) :-         snack(X, P1, Y, P2, Z, P3).
abendessen (X, P1, Y, P2, Z, P3) :-         snack(X, P1, Y, P2, Z, P3).

%%% Oberbegriff für alles ist Mahlzeit
mahlzeit   (X, P1, Y, P2, Z, P3) :- hauptmahlzeit(X, P1, Y, P2, Z, P3).
mahlzeit   (X, P1, Y, P2, Z, P3) :-         snack(X, P1, Y, P2, Z, P3).

%%% Gewichte der Komponenten für ein Gericht von 100cal
komponentengewichte(X, P1 * G1, Y, P2 * G2, Z, P3 * G3, (P1 + P2 + P3) * W) :-
mahlzeit(X, P1, Y, P2, Z, P3), kalorienProPortion(W),
portionHatGewicht(X, G1), portionHatGewicht(Y, G2), portionHatGewicht(Z, G3).

%%% Gewichte der Komponenten für ein Gericht von 800cal (zu Testzwecken)
komponentengewichteGericht(X, G1 * S, Y, G2 * S, Z, G3 * S, W * S) :-
komponentengewichte(X, G1, Y, G2, Z, G3, W), S = 8.

%%% Berechne skalierte Nährstoffe eines Gerichts aus drei Komponenten mit angegebener Portionsanzahl
mahlzeitHatNaehrstoff(N, X, P1, Y, P2, Z, P3, P1 * N1 + P2 * N2 + P3 *N3) :-
hauptmahlzeit(X, P1, Y, P2, Z, P3),
portionHatNaehrstoff(X, N, N1), portionHatNaehrstoff(Y, N, N2), portionHatNaehrstoff(Z, N, N3).

