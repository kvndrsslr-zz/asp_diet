
%% Berechnung des Grundbedarfs in Kcal pro Tag
%% Grundumsatz (GU) nach Harris und Benedict (1919)

%%Grundumsatz maennlich
gum(66,473 + (13,752 * gewicht(X)) + (5,003 * groesse(Y)) - (6,755 * alter(Z))):- gewicht(X), groesse(Y),alter(Z).

%%Grundumsatz weiblich 
%guw(655,096 + 9,563 * gewicht + 1,850 * groesse - 4,676 * alter).

%% Grundumsatz skalliert mit PAL um den Grundbedarf(Bedarf) zu errechnen
%gu(X):- gum(X) = guw(X).
%gum(X):- geschelecht(m).
%guw(X):- geschlecht(w)
%bedarfw(X):- (guw(X) * pal(X)).
%bedarfm(X):- (gum(X) * pal(X)).
