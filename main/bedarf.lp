%%Berechnung des Grundbedarfs in Kcal pro Tag
%%Grundumsatz (GU) nach Harris und Benedict (1919)

%%Grundumsatz maennlich
gum(X):- (66,473 + 13,752 * gewicht + 5,003 * groesse - 6,755 * alter).

%%Grundumsatz weiblich 
guw(X):- (655,096 + 9,563 * gewicht + 1,850 * groesse - 4,676 * alter).

%% Grundumsatz skalliert mit PAL um den Grundbedarf(Bedarf) zu errechnen
%gu(X):- gum(X) = guw(X).
gum(X):- geschelecht(m).
guw(X):- geschlecht(w)
bedarfw(X):- (guw(X) * pal(X)).
bedarfm(X):- (gum(X) * pal(X)).
