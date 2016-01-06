ASP Praktikum - Ernährungsplan (Gruppe 4)
======================================================

Grundaufbau
-------------------

Wir entschieden uns für eine Art Pluginsystem, um verschiedene Diäten umsetzen zu können.
Das Hauptprogramm im Ordner `main/` generiert Mahlzeiten, welche dann von den speziellen Diäten in Unterordnern von `diet/` zu einem Tagesplan, und darauf aufbauend einem Wochenplan, kombiniert werden sollen.

###`main`-Programm###

Das `main`-Programm besteht aus den Dateien `person.lp`, `bedarf.lp`, `nahrung.lp` und `mahlzeit.lp`.
Seine Hauptaufgabe besteht in der Generierung von Mahlzeiten aus Komponenten.
In `person.lp` erfolgt die Beschreibung des Nutzers. Mithilfe dieser Informationen wird in `bedarf.lp` der individuelle Nährstoffbedarf des Nutzers ermittelt.
Die verschienenen Nahrungskomponenten und deren beinhalteten Nährstoffe sind in `nahrung.lp` beschrieben.
Die Regeln in `mahlzeit.lp` generieren schließlich verschiene Typen von Mahlzeiten wie Frühstück, Hauptmahlzeit, Abendbrot und Snacks, welche von Diäten zu Essensplänen zusammengesetzt werden sollen.


####`person.lp`####

Die Parameter des Programms

- Geschlecht
- Größe
- Gewicht
- Alter
- Physical Activity Level (PAL)

werden hier beschrieben.
Es ist denkbar, dass jeder Nutzer die Datei kopiert, verändert und dann clingo mit seiner Nutzerdatei aufruft.

####`bedarf.lp`####

In dieser Datei wird der täglich empfohlene Bedarf von Energie und einigen Nährstoffen aus den Nutzerdaten ermittelt.
Hierfür nutzen wir die Empfehlungen der DGE (http://www.dge.de).

####`nahrung.lp`####

Wir entschieden uns für die Kombination von Komponenten zu Mahlzeiten, da der entstehende Essensplan somit sehr abwechslungsreich gestaltet werden kann. Mithilfe des Prädikats `hatBestandteil` kann beschrieben werden, welche besonderen Inhaltsstoffe Komponenten haben (Laktose, Gluten, Fisch, Fleisch, ...), um darauf in spezialisierten Diäten Rücksicht zu nehmen.
####`mahlzeit.lp`####

Es werden 2 Grundtypen von Mahlzeiten generiert, Snacks und Hauptmahlzeiten.
Außerdem werden Frühstück und Abendbrot als Snack deklariert und anschließend alle vier Typen unter dem Prädikat `mahlzeit` zusammengefasst.

Die Bildungsvorschriften der Snacks und Hauptmahlzeiten sind an unseren Essgewohnheiten ausgerichtet, aber keineswegs vollständig. So haben wir uns, um Redundanz im Programm zu vermeiden, dafür entschieden Mahlzeiten als 3er Tupel von Komponenten zu betrachten. Dies erfasst den Grundcharakter der meisten Mahlzeiten, lässt aber natürlich auch einige Zutaten außen vor, welche man i.d.R. dazu verwendet. So werden viele Menschen, wenn sie Spinat, Kartoffeln und Ei essen, Rahmspinat servieren, womit das Gericht dem um einiges mehr Fett beinhaltet als es unser Programm errechnet. Das nahmen wir jedoch in Kauf um Komplexität zu vermindern und eine einfache Modellierung des weiteren Programms zu ermöglichen.

Die Mahlzeiten hier sind so skaliert, dass sie insgesamt 100kcal Energie beinhalten. Es ist die Aufgabe der Diätunterprogramme auf dieser Grundportion aufbauend weiter zu skalieren um den Bedarf abzudecken.

### Diäten ###

Diäten sollten ursprünglich aus einem Tagesplaner- und einem Wochenplanerprogramm bestehen.
Aufgrund der Probleme, die weiter im Text unter "Grenzen des Programms" zusammengefasst sind, bestehen Diäten nun nur noch aus einem Tagesplaner, welcher mithilfe der Mengenbeschränkungssyntax eine Woche aus 7 Tage generiert.

#### Standard ####

Die Standarddiät generiert einen Essensplan ohne Einschränkung der Zutaten. Ursprünglich war geplant, für jeden Tag ein anderes Hauptgericht zu garantieren. Dies wäre jedoch nach unserem Verständnis von ASP nur mit einem Wochenprädikat machbar gewesen. Da dieses aber aufgrund des hohen Rechenaufwandes nicht umsetzbar war, mussten wir diese Idee verwerfen.


#### Ovo-Lacto Vegetarisch ####

...

#### Gluten-frei ####

...

#Grenzen des Programms#

Aufgrund der knappen Bearbeitungszeit um den Jahreswechsel teilten wir die Aufgaben im Dezember auf mit dem Vorhaben, die einzelnen Bausteine im Januar zusammen zu setzen. Als wir dies getan hatten, wurde schnell klar, dass clingo mit dem kombinatorischen Aufwand unserer Modellierung überfordert ist. Selbst wenn wir die Wochen wegließen benutzte das Programm über 6 GB RAM und rechnete minutenlang bis es eine Antwort ausgab. 
Als erste Maßnahme dagegen reduzierten wir die verfügbaren Nahrungskomponenten von etwa 50 auf 25 und nahmen eine Mengenbeschränkung der Tage auf 10 vor.
Damit erfolgte die Generierung der Tage nun in akzeptabler Zeit (3s). Egal wie wir jedoch die Modellierung der Woche mitsamt Constraints versuchten, kamen wir nie zu einem akzeptabel termininierendem Programm. Deshalb entschieden wir uns, von der konkreten Modellierung der Woche abzusehen und das Programm stattdessen Modelle von 7 Tagen erzeugen zu lassen. Die Auswahl einer Woche könnte dann bspw. erfolgen indem man das Programm mit `clingo 0 [...]` startet und dann von einem shellscript zufällig terminieren lässt. Das letzte ausgegebene Modell ist dann der vorgeschlagene Wochenplan.
