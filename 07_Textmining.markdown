
Unter Text Mining (\cite{wiki:textmining}) wird ein Bündel von Algorithimus-basierten Analyseverfahren zur Entdeckung von Bedeutungsstrukturen verstanden, die Kerninformationen schnell erfassen können. 
Gedacht sind diese Verfahren für die Verarbeitung und Durchsuchen großer Textmengen.

# Aufgabe

Zu Beginn des Projektseminars kam schnell die Frage auf, wie die Tags angelegt werden sollen. Die Eingabefelder der Artikel könnten automatisch zu Tags transformiert werden.
Aber wie wird dann das Beschreibungsfeld behandelt. Ein Beispiel hierzu wäre ein Nutzer, der einen neuen Artikel anlegt und das Beschreibungsfeld mit folgendem Text füllt:
\enquote{Kotflügel für großes Auto}. Folgende Tags sollten automatisch gesetzt werden: Kotflügel, groß und Auto. Doch wie ist es möglich, das Wort \enquote{großes} zu dem Wort \enquote{groß} als Tag umzuwandeln. Durch diese Fragestellung sind die Studenten auf das Thema Text Mining aufmerksam geworden.

# Vorgehen

Folgende drei Teilbereiche des Text Mining wurden behandelt.
Die Stammformreduktion (Stemming), die Lemmatisierung und das Part-of-Speach Tagging.

Bei der Stammformredunktion wird das Wort auf eine Art Wortkern reduziert, der nicht unbedingt in der Sprache existiert.
Bei der Lemmatisierung wird das Wort auf seiner lexikalischen Grundform reduziert.
Als Part-of-Speach Tagging (\cite{wiki:PartOfSpeechTagging}) bezeichnet man die Zuordnung von Wörtern und Satzzeichen eines Textes zu Wortarten. Hierzu werden sowohl die Definition des Wortes als auch der Kontext
berücksichtigt.

# Mögliche Lösungsansätze

## Stammformreduktion
Im Bereich der Stammformreduktion haben die Studenten sich mit dem Porter-Stemmer-Algorithmus auseinandergesetzt.
Der Porter-Stemmer-Algorithmus (\cite{wiki:porterStemmerAlgorithmus}) ist ein verbreiteter Algorithmus der Computerlinguistik zum automatischen Zurückführen von Wörtern auf ihren Wortstamm (Stemming). Der Algorithmus basiert auf einer Menge von Verkürzungsregeln, die so lange auf ein Wort angewandt werden, bis dieses eine Minimalanzahl von Silben aufweist. Der ursprünglich für Wörter der englischen Sprache entwickelte Algorithmus kann relativ leicht für andere Sprachen portiert werden.

Zuerst wird die Anzahl der Vokal-Konsonant-Sequenzen bestimmt. Jedes Wort lässt sich als Zeichenkette in der Form `[C] (VC)<sup>m</sup> [V]` interpretieren, wobei `C` für eine Folge von einem oder mehreren Konsonanten und `V` für eine Folge von einem oder mehreren Vokalen steht. Gemessen wird hier die Anzahl `m` der Vokal-Konsonant-Sequenzen zwischen optional führenden Konsonanten und einer optionalen Folge von Vokalen am Ende.
Beispiele:

- `w[eb] (m=1)`
- `b-[et]-ew-[en] (m=2)`
- `tr-ee (m=0)`

Nach der Bestimmung der Silben werden die vorher festgelegten Verkürzungsregeln abgearbeitet. Die Verkürzungsregeln bestehen aus Paaren von Bedingungen und Ableitungen für verschiedene Suffixe (Wortendungen). Die Verkürzungsregeln werden in Gruppen zusammengefasst. Aus jeder Gruppe darf nur eine Regel angewendet werden.
Beispiel:  Die erste Gruppe beinhaltet die Suffix-Verkürzungsregeln \enquote{sses} $\rightarrow$ \enquote{s}, \enquote{ies} $\rightarrow$ \enquote{i} und \enquote{s}  \enquote{~}, die beispielsweise zu den Ableitungen \enquote{libraries} $\rightarrow$ \enquote{librari} und \enquote{Wikis} $\rightarrow$ \enquote{Wiki} führen. Eine später folgende Gruppe besteht aus der Regel \enquote{y} $\rightarrow$ \enquote{i}, so dass beispielsweise das Wort \enquote{library} auf den gleichen Stamm (\enquote{library} $\rightarrow$ \enquote{librari}) zurückgeführt wird.
Zum besseren Verständnis haben die Studenten den Porter-Stemmmer-Algorithmus (s. Abb. \ref{abb:PorterStemmerAlgorithmus}) zusätzlich für die deutsche Sprache ausprobiert.

![\label{abb:PorterStemmerAlgorithmus} Porter-Stemmer-Algorithmus](img/PorterStemmerAlgorithmus.png)

## Lemmatisierung

Im Bereich Lemmatisierung wurde festgestellt, dass ein Wörterbuch im Hintergrund zum Abgleichen benötigt wird. Folgende Möglichkeiten wurden dabei näher betrachtet:

- `Elasticsearch`
- `GermaNet`
- `Sketch Engine`

### Elasticsearch

Elasticsearch (\cite{wiki:Elasticsearch},  \cite{onl:elasticSearch}) ist eine Suchmaschine, die mit indizierten Dokumenten arbeitet. Die kleinste Einheit bilden dabei die Dokumente. Diese werden indiziert, um sie durchsuchen zu können. Mehrere Dokumente bilden einen Typ und mehrere Typen werden als Index bezeichnet. Vergleicht man diesen Aufbau mit einer SQL-Datenbank, wäre ein Dokument eine Zeile, der Typ die Tabelle und der Index die Datenbank.


**Funktionsweise:**

Zur Indexierung wird ein Dokument im JSON-Format an Elasticsearch gesendet. Dort wird daraufhin ein Analyseprozess gestartet. Währenddessen wird das Dokument aufbereitet, indem der Text in einzelne Worte und die Worte in einzelne Buchstaben zerlegt werden. Eigene Umwandlungsstufen sind einbaubar.
Die Resultate des Analyseprozesses werden im Index gespeichert und können dann bei einer Suchanfrage durchsucht werden. Die ursprünglich übermittelten Dokumente werden zusätzlich an einem anderen Ort gespeichert.

**Ergebnis:**

Da die Studenten für die gestellte Aufgabe die Lemmata eines Wortes ermitteln wollen, wurde Elasticsearch nicht genauer untersucht.

### GermaNet

GermaNet (\cite{wiki:germaNet},  \cite{onl:germanetstructure}) ist eine elektronische, lexikographische Referenzdatenbank für den deutschen Wortsinn. Es stammt von der Universität Tübingen. Für GermaNet wurde eine Nutzungslizenz über 
die HTW Dresden erworben. Die Möglichkeit für ein eingegebenes Wort, das Lemma zurück zu erhalten, wurde von den Studenten getestet. Da GermaNet für den semantischen Zusammenhang von Worten gedacht ist, war es nicht möglich nur das Lemma für ein Wort zu erfragen.

### Sketch Engine

Sketch Engine (\cite{wiki:sketchEngine}, \cite{onl:sketchEngine}) ist eine seit 2004 von Lexical Computing Limited entwickelte Corpus Manager- und Analysesoftware. Mittels einer 30-Tage-Testversion haben wir die Möglichkeiten der Sketch Engine überprüft. Sketch Engine bietet u.a. folgende Funktionen:

- Wortlisten
- N-Gramm
- Verteilungs-Thesaurus
- Konkordanzsuche
- Korpusvergleich

Auch hier sind die Studenten nicht weitergekommen, da die Sketch Engine und nicht ein einzelnes Lemma zurückgeben werden kann.

## TreeTagger

Der TreeTagger (\cite{onl:treeTagger2}) der Universität München ist ein Werkzeug zur Annotation eines Textes mittels Part-of-speach Tagging und Lemmata Informationen. Entwickelt wurde er von Helmut Schmidt in dem TC Projekt am Institut für Conputerlinguistik der Universität Stuttgart. Er kann erfolgreich Deutsch, Englisch, Französisch und viele weitere Sprachen taggen. Er besitzt einen handtrainierten Textkorpus, der individuell erweiterbar ist. Einsetzbar ist er unter Windows, Linux und Mac-OS. Der TreeTagger (\cite{onl:treeTagger1}) und das Trainingsprogramm ist frei verfügbar für Forschung, Bildung und Evaluation. Zusätzlich ist unter Windows ein graphisches Interface verfügbar.

**Funktionsweise:**

Der TreeTagger benötig seinen Textkorpus. Er berechnet zwei Wahrscheinlichkeitsarten und weist dann dem wahrscheinlichsten Tag, die Wortart und das Lemma, zu. Die erste Wahrscheinlichkeit ist lexikalisch, d.h. der TreeTagger durchsucht einen Textkorpus nach einem Wort, um damit die Wortart und das Lemma ausgeben zu können.
Die zweite Wahrscheinlichkeit ist distributional und entsteht durch den Zusammenhang von Wörtern in einem Satz. Aus beiden Wahrscheinlichkeiten wird eine gesamte Wahrscheinlichkeit berechnet und der TreeTagger ordnet demnach die Wortart zu und gibt das Lemma an. Er rechnete mit zwei Wahrscheinlichkeiten, da gerade in der deutschen Sprache, je nach Verwendung des Wortes in einem Satz, ein Wort unterschiedlichen Wortarten angehören kann.
Beispiel: Ich wasche meine Hose.

**Ausgabe TreeTagger:**

| Wort   | Wortart | Lemma   |
|--------|---------|---------|
| Ich    | /PPER   | Ich     |
| wasche | /VVFIN  | waschen |
| meine  | /PPOSAT | ich     |
| Hose   | /NN     | Hose    |
| .      | /$      | .       |

- PPER = Personalpronomen
- VVFIN = Verb finite Form
- PPOSAT = Possessivpronomen
- NN = Nomen
- $ = Satzzeichen

In diesem Fall muss der TreeTagger bei dem Wort \enquote{meine} zwei Wahrscheinlichkeiten vergleichen. \enquote{meine} kann sowohl als Possessivpronomen (eine Form des Wortes ich) oder als finites Verb
(ein Verb des Wortes Meinung) zugeordnet werden.
Jetzt findet der TreeTagger in seinem Korpus zwei Mal eine Wortart für das Wort \enquote{meine} aus dem Beispielsatz. Zu je einer Wahrscheinlichkeit ist das Wort \enquote{meine} ein Verb oder ein Pronomen. Findet der TreeTagger ein Wort nicht in seinem Korpus, ersetzt er alle Großbuchstaben durch Kleinbuchstaben und startet die Suche von vorne, sollte er es danach nicht finden.
Die zweite Wahrscheinlichkeit mit der der TreeTagger arbeitet ist distributional. Wie wahrscheinlich ist es, dass aus dem obigen genannten Beispielsatz auf ein Verb (wasche) ein weiteres folgt und wie wahrscheinlich ist es, dass auf ein Verb (wasche) ein Possessivpronomen folgt.
Anhand der umliegenden Wörter kann der TreeTagger genauere Zuordnungen treffen.

**Auswertung:**

Das erste Problem ist, dass der TreeTagger besser mit ganzen Sätzen arbeitet. Der weiteren bedeutetet Wahrscheinlichkeit nicht Sicherheit. Bei 20.000 Wörtern ordnet der TreeTagger zu 97,53% die richtige Wortart zum jeweiligen Wort zu. Die größte Schwachstelle, die die Studenten im TreeTagger sahen, war die Tatsache, dass er nicht hauptsächlich zur Findung der Lemmata dient, sondern Wortarten zuordnen soll. Das der TreeTagger zusätzlich anhand seines Korpus auch Lemmata ausgeben kann, ist nur ein schöner Zusatz.
Würden die Studenten den TreeTagger für ihre o.g. Aufgabe einsetzen wollen, müssten sie den Textkorpus mittels des Trainingsprogrammes erweitern, d.h. händisch Wortarten und Lemmata zuordnen. Daraus wurde geschlossen, dass die Tagliste für das ERP-System händisch geführt werden kann. Der Aufwand wäre der Gleiche.

## Wortschatzprojekt Uni Leipzig

Das Wortschatzprojekt der Universität Leipzig (\cite{onl:wortschatzLeipzigApi)beinhaltet korpusbasierte monolinguale Wörterbücher für unter anderem die deutsche Sprache. Es wird seit 1998 von Gerhard Heyer und Uwe Quasthoff an der Universität Leipzig entwickelt.
Es wurde ein umfassender Korpus des deutschen Wortschatzes als Vollformlexikon erstellt. Die über Jahre aufgebaute Lexikondatenbank wurde über das Internet zur Nutzung verfügbar gemacht und zur Bearbeitung und Ergänzung zur Verfügung gestellt. Seitdem wurde es beständig erweitert.
Das Lexikon umfasst aktuell ca. 35 Millionen Beispielsätze mit 500 Millionen laufenden Wörtern.
Der Zweck des Projektes soll vor allem der Sprachverarbeitung und Texttechnologie dienen.
Die Annotation der Token umfasst das Sachgebiet Beispielsätze sowie die Grammatik.
Da das Ziel aus der Ermittlung der Lemmata der Worte des Beschreibungsfeldes bestand, schien das Wortschatzprojekt eine geeignete Lösung darzustellen.

**Umsetzung**

Die Universität Leipzig stellt u.a. einige SOAP-Webservices zur Verfügung, mit denen ein direkter Datenzugriff sowie gezielte Abfragen möglich sind. Zu jedem Webservice wird ein Beispielclient mit Quellen zur Verfügung gestellt. Dies ermöglicht die Kombination sowie das Einbauen der Webservices in eigene Programme.
Die Zugriffsvoraussetzungen unterscheiden sich je nach Abfrageumfang.
Für einfache Abfragen kann das login \enquote{anonymous} mit dem Passwort \enquote{anonymous} verwendet werden. Eine Registrierung ist für komplexere Abfragen allerdings erforderlich, um bei Problemen kontaktiert werden zu können. Massendatenabfragen sind lediglich Kooperationspartnern vorbehalten.
Da der Verwendung des Wortschatzprojektes vorerst lediglich ein \enquote{Versuch} durchgeführt werden sollte, wurde sich auf das allgemeine Login für einfache Abfragen beschränkt. Nach einigen Recherchen mit dem Ziel einen bereits bestehenden und benutzbaren Code zur Abfrage des Lemmata zu erhalten, sind die Studenten auf eine C#-API (\cite{onl:herrmann}) zur Abfrage des Thesaurus  gestoßen. Diese API wurde von Raffael Herrmann im Juli 2013 entwickelt.

*Die Funktionsweise und der Aufbau des Codes wurde in (\cite{onl:herrmann}) ausführlich erklärt, so dass hier nicht weiter darauf eingegangen wird.*

Nach Start der API öffnet sich ein Konsolenfenster (\autoref{abb:EingabeCSharpAPIThesaurus}). Nun ist es möglich ein Wort einzugeben von welchem man den zugehörigen Thesaurus als Rückgabewert erhalten möchte.

![\label{abb:EingabeCSharpAPIThesaurus} Eingabe C# - API Thesaurus](img/EingabeCAPIThesaurus.jpg)

Als Rückgabe (\autoref{abb:RueckgabeCSharpAPIThesaurus}) erhält man alle gefundenen Thesauri, sowie die Anzahl der Synonyme.

![\label{abb:RueckgabeCSharpAPIThesaurus} Rückgabe C# - API Thesaurus](img/RueckgabeCAPIThesaurus.jpg)


Das Ziel bestand daraus, statt des Thesaurus die Lemmata des Eingabewortes zu erhalten. Darüber hinaus sollte es möglich sein mehrere Worte nacheinander abzufragen. Die Eingabe sollte außerdem über einlesen einer Liste aus einem Textdokument erfolgen. Folgende Codeabschnitte wurden daher geändert:

Änderungen der Funktion `GetSynonyms()` sind in \autoref{abb:CSharp-FunktionGetBaseform} erkennbar.

![\label{abb:CSharp-FunktionGetBaseform} C# - Funktion `GetBaseform`](img/CFunktionGetBaseform.jpg)

Zeile 23 bis 25
	Änderung der Servicereferenz zur Abfrage der Lemmata.

Zeile 27 bis 29
	Erstellen des Webservice-Clients.

Zeile 31 bis 32
	Konfiguration des Clients, da der Webservice Zugangsdaten erfordert.

Zeile 34 bis 45
	Erstellung der Aufrufparameter.
	Es sind 2 Parameter erforderlich, zum Einen das Wort zu welchem das Lemmata zurück 	gegeben werden soll sowie das Wörterbuch in dem gesucht werden soll. Das Wörterbuch
	wurde bereits im Funktionskopf übergeben (`string corpus = "de"`). Die Parameter können nicht als \enquote{String} übergeben werden, sondern erfordern obige Datenstruktur.

Die Funktion `Main()` mit Änderungen ist in \autoref{abb:CSharp-FunktionMain} zu finden.

![\label{abb:CSharp-FunktionMain} C# - FunktionMain](img/CFunktionMain.jpg)

Zeile 16 bis 17
	Anlegen der Hilfsparameter.
	Counter um Anzahl der Eingabe Worte im Dokument zu zählen.

Zeile 20 bis 21
	Einlesen des Dokuments welches Liste mit Worten enthält
	Erstellen des Dokuments in dem die zurückgegebenen Lemmata gespeichert werden sollen.

Zeile 23 bis 31
	Hier erfolgt der Aufruf der Funktion GetBaseform(); .
	*Jedes zurückgegebene Lemma wird in die Datei ergebnis.txt geschrieben sowie auf der 	Konsole ausgegeben. Die Schleife wird so lange erneut aufgerufen bist die Datei test.txt 	keine Zeile mehr enthält.*

Bei der Eingabe der Worte \enquote{guter}, \enquote{Katzen} und \enquote{schneller} erfolgt nun folgende Rückgabe (\autoref{abb:RückgabeCSharp-APIBaseform}).

![\label{abb:RückgabeCSharp-APIBaseform} Rückgabe C# - APIBaseform](img/RueckgabeCAPIBaseform.jpg)

Zu jedem Wort wird das Lemma sowie die Wortart zurückgegeben. Bei obigem Beispiel also:

| Wort      | Lemma   | Wortart      |
| :---      | :---    | :----------  |
| Guter     | Gut     | A (Adjektiv) |
| Katzen    | Katze   | N (Nomen)    |
| Schneller | Schnell | A (Adjektiv) |

**Auswertung:**

Generell eignet sich das Wortschatzprojekt sehr gut zur Abfrage der Lemmata und auch
der Wortart eines Wortes. Bei einer Eingabe von 263 Wörtern aus einem Buchabschnitt konnten die Studenten eine richtige Lemmatazuordnung von 92% feststellen.

Da es sich um sehr fachspezifische Daten handelt, welche als Eingabe erfolgen würden, ist das Wortschatzprojekt nicht geeignet. Bei unbekannten Wörtern erfolgt keine Rückgabe.
Bei einer Eingabe von 199 Wörtern aus einem Abschnitt eines Zahnmedizinischen Katalogs lag die Genauigkeit nunmehr bei 62%. Darüber hinaus führt die Eingabe von Zahlen zu einer Überflutung an Rückgaben.

## Fazit

Zusammengefasst wurde der TreeTagger und das Wortschatzprojekt miteinander verglichen. Dazu haben die Studenten das Buch \enquote{Volkserzählung} (\cite{onl:volkszaehlungen}) aus dem Gutenbergprojekt und Katalogdaten aus dem zahnärztlichen und kieferorthopädischen Bereich durch beide Programme laufen lassen. Aufgrund des begrenzten Abfragekontingentes des Wortschatzprojektes mussten die übergebenen Wörter stark begrenzt werden. Aus dem Buch \enquote{Volkserzählungen} von Lew Tolstoi wurden 263 Wörter des ersten Kapitels übergeben. Hier lag der TreeTagger mit 97 \% (255) richtig zugeordneten Lemmata besser, als das Wortschatzprojekt mit 92 \% (241) richtigen Lemmata. Wie es auch im folgenden Diagramm veranschaulicht dargestellt wurde. Bei den Katalogdaten lag das Wortschatzprojekt mit 65 % (130) richtig zugeordneten Lemmata vor dem TreeTagger mit nur 59 \% (117) richtiger Zuordnung. Es ist deutlich zu erkennen, dass der TreeTagger (\autoref{abb:TreeTaggerWortschatzprojekt}) mit umliegenden Wörtern in einem Satz arbeitet, was bei den Katalogdaten nicht gegeben war. Es handelt sich bei den Katalogdaten um einen Auszug auf einer Artikeldatenbank, der aus insgesamt 199 Wörtern bestand.

![\label{abb:TreeTaggerWortschatzprojekt} TreeTagger vs. Wortschatzprojekt](img/TreeTaggerWortschatzprojekt.png)

Sollte Lemmatisierung in dem ERP-System umgesetzt werden, würde sich eine Mischung aus dem Wortschatzprojekt und dem TreeTagger empfehlen. Da die Daten im ERP-System eher wie die Katalogdaten aufgebaut sind, hat das Wortschatzprojekt mit seinem breiten Wörterstamm einen klaren Vorteil, was die Zuordnung bei einzelnen Worten vereinfacht.

Identifizierter Lösungsansatz:
Alle anderen Felder bei der Anlage eines Artikels werden zu Tags, damit können die Wörter im Beschreibungsfeld erst mit den vorhandenen Tag abgeglichen werden. Mittels einer Füllwörterliste können nicht relevante Wörter wie (für, ein, und, usw.) herausgefiltert werden und nur bei den noch verbleibenden Wörtern, könnte mit Hilfe des Wortschatzprojektes oder auch des TreeTaggers das Lemma gefunden und als Tag hinzugefügt werden.
