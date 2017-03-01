
Aufgrund des sehr frühen Entwicklungsstandes von der echten Laufzeitumgebung für die WordCloud wurde beschlossen zunächst einen ähnlichen Prototyp zu erstellen mit dem Ziel, die komplexen Abläufe des realen Systems einfacher darzustellen, um ungewollte und für das Projektteam nicht nachvollziehbare Nebeneffekte während der Entwicklungsphase stark zu reduzieren. Anhand des Prototyp wurde die Berechnung von Folksonomien und die Möglichkeiten der Tageingabe erforscht.

Um eine einfache Datenbasis zum Testen zu erstellen wurde die freie Datenbank Terra\footnote{\cite{TN_libero_mab2337570} via \href{https://www.sachsen.schule/~terra2014/index.php}{https://www.sachsen.schule/~terra2014/index.php} \label{foot:terra} } ausgewählt. Sie enthält geografische Daten wie Städte, Flüsse und Berge mit Relation untereinander, was sich als sehr nützlich erwies, da sich diese einfach in Tags übertragen ließen.

# Aufbau

In diesen Abschnitt wird der Aufbau des Prototyp beschrieben.

## Funktionen

In diesem Teilabschnitt werden die implementierten Funktionen kurz erläutert.

Datenbank
:	Die folgenden Funktionen dienen dem Anlegen und Modifizieren der Datenbankdateien zur persistenten Datenhaltung.

Datenbank anlegen oder laden
:	Über den Reiter \enquote{Datenbank} $\rightarrow$ \enquote{Laden} kann eine leere Datenbank geladen und neu befüllt oder eine vorhandene geladen und bearbeitet werden.

Datenbank leeren
:	Über den Reiter \enquote{Datenbank} $\rightarrow$ \enquote{Leeren} kann man in einer zuvor geladenen Datenbank alle Datensätze löschen.

\newpage

## Darstellung

Die ausführlichste Erläuterung zum Thema Visualisierung von WordClouds war Wordle (\cite{misc:worlde}). Das Prinzip der Gewichtung von Worten und spiralförmigen Darstellung beginnend mit dem höchstgewichteten in der Bildmitte wurde aus den Beispielen entlehnt. Die Funktionsweise ist nachvollziehbar im Vortrag zur Visulaisierung von Tag-Clouds (\cite{misc:TagCloudDrawing}) dargelegt. Zusätzlich half uns der Code des Projektes WordCloud (\cite{misc:WordCloudTalbot}) nicht den Fehler zu begehen eine Positionierung über Bitmaps zu versuchen. Die Performance mit mehreren Sekunden zur Generierung eines einzelnen Bildes ist hier ausreichend abschreckend. Deshalb werden die Elemnte unserer Tag-Cloud ohne Bitmap in Rechtecken mit Positionsangabe sowie den Dimensionen Höhe und Breite versehen.
Wir haben unsere Worte (Tags) weiterhin mit einem Gewicht versehen definiert. Dieses kann u.a. aus der Häufigkeit oder später einmal aus der Verknüpfungshäufigkeit in Wortenetzen (s.a. \autoref{sec:wortschatzprojekt}) ermittelt werden. Für die Testdaten wird dies schlicht inkrementell oder zufällig auf die Tags verteilt.
Die Bildmitte kann aus den vorgegebenen Dimensionen des Bildes ermittelt werden. Weitere Parameter der Spirale sollen experimentiell in Verbindung mit Tests zur Performance (\autoref{sec:AussehenTagCloud}) ermittelt werden. Zu vermuten ist hier als Abstand zwischen zwei Linienzügen die Höhe der kleinsten Schriftdarstellung.
Wie in den Anforderungen bereits vorgegeben werden in der Zieldarstellung keine farblichen Tags gefordert. 

### Daten

Die folgenden Funktionen dienen Import und Export von gespeicherten Daten von bzw. in andere Systeme und deren manuellen Modifikation.

TerraDB XML in SQLite Datenbank konvertieren \label{Abschn:TerraDBXML}
:	Im Prototyp ist es möglich die XML-Export-Datei der Terra Datenbank in eine SQLite Datenbank umzuwandeln, damit weitere Transformationen einfacher mit SQL umgesetzt werden können. Dafür wird zunächst die XML Datei ausgewählt und anschließend der Speicherort der SQLiteDatenbank. Danach wird für jeden Tag-Typen eine Tabelle mit allen Attributen erstellt und anschließend die XML Datei eingelesen und die Datensätze entsprechend eingefügt. Fremdschlüssel werden nicht beachtet. Am Ende entsteht eine SQLite Datenbank die das gleiche Schema wie die XML Datei ausweist mit dem Vorteil, dass dieses mit SQL abgefragt werden kann.

TerraDB SQLite Datenbank importieren
:	Die bei \autoref{Abschn:TerraDBXML} erstellte SQLite Datenbank muss jetzt wieder geladen werden und mit Hilfe von SQL Abfragen werden die BusinessObjects und Tags erstellt. Dabei wurde statische Tags, d.h. diejenigen die bei allen BusinessObject des ElementTyps gleich sind, und Dynamische Tags, d.h. diejenigen die aus Attributen oder Verknüpfungstabellen des Elements gewonnen werden und für jedes Business Object unterschiedlich sein können.

+-------------+-------------------+-------------------------------------------------------------+
| Element Typ | Statistische Tags | Dynamische Tags                                             |
+=============+===================+=============================================================+
| Berg        | berg              | Name, Land, Landteil, Gebirge                               |
+-------------+-------------------+-------------------------------------------------------------+
| Ebene       | eben              | Name, Land, Landteil                                        |
+-------------+-------------------+-------------------------------------------------------------+
| Fluss       | fluss             | Name, Land, Landteil, MündetInElementName                   |
+-------------+-------------------+-------------------------------------------------------------+
| Insel       | insel             | Name, Land, Landteil, Inselgruppe                           |
+-------------+-------------------+-------------------------------------------------------------+
| Land        | land              | Name, Land, Landteil                                        |
+-------------+-------------------+-------------------------------------------------------------+
| Landteil    | landteil          | Name, Land, Landteil                                        |
+-------------+-------------------+-------------------------------------------------------------+
| Meer        | meer              | Name, Land, Landteil                                        |
+-------------+-------------------+-------------------------------------------------------------+
| See         | see               | Name, Land, Landteil                                        |
+-------------+-------------------+-------------------------------------------------------------+
| Stadt       | stadt             | Name, Land, Landteil, LiegtAnElementTyp, LiegtAnElementName |
+-------------+-------------------+-------------------------------------------------------------+
| Wüste       | wueste            | Name, Land, Landteil, Wüstenart                             |
+-------------+-------------------+-------------------------------------------------------------+

BusinessObject hinzufügen
:	Um ein neues BussinessObject hinzuzufügen, kann über die Menüleiste unter dem Reiter \enquote{Daten} $\rightarrow$ \enquote{Neuer Datensatz} ein neues BussinessObject erstellt werden. Hierfür müssen nur alle benötigten Daten des hinzuzufügenden Objekts in das Formular eingetragen werden. Das neue Objekt wird nach dem Bestätigen direkt in der Datenbank gespeichert.

Datenbank als Cypher Graph Definition exportieren
:	Im Prototyp existiert ein Service, welcher Code für das Anlegen einer Neo4J\footnote{\href{https://neo4j.com/}{https://neo4j.com/}} Datenbank erstellt. Dieser Code erstellt die benötigten Datensätze über BussinesObjects und Tags sowie deren Beziehung zueinander.

BusinessObject anzeigen und editieren
:	Um ein konkretes BussinessObject anzuzeigen, muss lediglich auf dieses geklickt werden. Es öffnet sich ein Fenster welches alle Daten zum angeklickten Objekt in einem Formular anzeigt, worin diese auch direkt geändert werden können.

### WordCloud

Die folgenden Funktionen dienen zur Modifikation des Filters bezogen auf die Tags zum Filter über die WordCloud.

Hinzufügen
:	Um ein Tag zum Filter hinzuzufügen, ist lediglich ein Klick auf das gewünschte Tag in der WordCloud nötig. Dieses wird dann sofort zum Filter hinzugefügt. Sofort darauffolgend aktualisiert sich auch die WordCloud und die Anzeige der gefundenen BussinessObjects, da diese direkt von dem Filter abhängen.

Entfernen
:	Einen Tag vom Filter zu entfernen ist ähnlich simpel, wie einen Tag zum Filter hinzuzufügen. Zum Entfernen ist ebenfalls nur ein Klick auf das zu entfernende Tag im Filter nötig. Darauffolgend wird, analog zum Tag hinzufügen, die WordCloud sowie die Anzeige der BussinessObjects aktualisiert.

## Komponenten

In diesem Teilabschnitt werden die Komponenten zur Funktionsbereitstellung technisch
beschrieben und deren Modellierung erläutert. Es wurde darauf geachtet die Funktionalität,
die Daten und die Benutzeroberfläche voneinander zu trennen.

### Model \label{abschn:Model}

Das Modell für die Datenhaltung (\autoref{abb:KlassendiagrammDatenmodell}) ist dem des realen Systems nachempfunden, beschränkt aber sich auf die wesentlichen Elemente zur Generierung einer Folksonomie. Zur Visualisierung für die Präsentation wurde zusätzlich noch ein Bild hinzugefügt.

![\label{abb:KlassendiagrammDatenmodell} Klassendiagramm des Datenmodells](img/KlassendiagrammDatenmodell.jpg)

Das Bild wird base64-codiert als Text in dem Attribut `data` des Business Objects gespeichert.

Die \autoref{abb:EntityRelationshipDiagram} verdeutlicht die Bezieungen in der Datenbank.

![\label{abb:EntityRelationshipDiagram} Entity Relationship Diagram](img/EntityRelationshipDiagram.jpg)

### DataAccess

Die Klasse `SqliteDatabaseConnection` abstrahiert die systemeigene Schnittstelle und erstellt Abfragen verschiedener Rückgabegranularität (Nur Ausführen, Skalarer Wert, Alle Werte). Außerdem wird die Funktionalität um weitere Hilfsmethoden wie Tabellenexistenz prüfen erweitert. Die Klasse Repository stellt die Datenobjektzugriffsmethoden (\autoref{abb:KlassendiagrammDatenbankzugriff}) bereit und bietet so einen abstrakten und objektorientierten Zugriff auf die Persistenzschicht.

![\label{abb:KlassendiagrammDatenbankzugriff} Klassendiagramm von Datenbankzugriff](img/KlassendiagrammDatenbankzugriff.jpg)

### Service

In dieser Komponente (\autoref{abb:KlassendiagrammServices}) ist die gesamte Logik implementiert. 

![\label{abb:KlassendiagrammServices} Klassendiagramm von Services](img/KlassendiagrammServices.jpg)

`DatabaseService`
:	initialisiert und leert die Datenbank.

`OpenFileService`
:	sorgt für eine geordnete Auswahl einer Datei, indem er Eigenschaften anbietet, die die Dateien an Endungen filtert und prüft ob die Datei wirklich existiert und so entweder nichtexistierende Dateien verbietet, erlaubt oder erfordert.

`TerraConvertionService`
:	lädt die Terra Xml Datei und wandelt diese in eine SQLite Datenbank um.

`DataGenerationService`
:	lädt diese Datenbank wieder und wandelt deren Elemente und Beziehungen in BusinessObjects und Tags um und speichert diese in der Persistenzschicht. Die im Service enthaltene Entity Klasse enthält dabei die Eigenschaften eines Elementtyps, um die Daten aus der Datenbank zu extrahieren und zu transformieren.

`GraphExportService`
:	lädt alle Daten der Persistenzschicht und wandelt diese in Cypherkommandos um, die ein Neo4j Graphen Datenbankschema erzeugen. Das Ergebnis wird in eine zuvor ausgewählte Textdatei gepeichert. Dabei stellen die BusinessObjects und die Tags jeweils Knoten dar und deren Beziehungen die Verbindungen. Damit kann sich ein Überblick über das Netz in der Datenbank verschafft werden.

`TagLoadingService`
:	generiert und führt die SQL Abfrage für das Laden der in Beziehung stehenden Tags anhand der Suchanfrage aus, welche als Parameter übergeben wird. Dabei werden auch deren Gewichte anhand der Häufigkeit des Vorkommens an den im Suchergebnis gelisteten BusinessObjects berechnet.

`DataLoadingService`
:	generiert und führt die SQL Anfrage aus, welche anhand der Suchanfrage die entsprechenden BusinessObjects aus der Persistenzschicht lädt.

### Klassen

`TerraDbWordCloudAppearenceArguments` (WordCloud Klasse)
:	definiert die für die WordClouddarstellung benötigten Parameter.

`Logger`
:	dient zu Demonstrationszwecken und bieten dem Nutzer einen Einblick, wie die Berechnungsalgorithmen für die Folksonomien funktionieren.

### MVVM

Das Model-View-ViewModel (MVVM) Pattern ist zentraler Bestandteil der Windows Presentaion Foundation (WPF), dem aktuellen Applicationframework für die Windowsprogrammierung. Es dient der strikten Trennung der Oberfläche (View) von der Logik (ViewModel) und den Daten (Model).

`ViewModel`
:	enthalten, wie bereits erwähnt, die Logik der Benutzeroberfläche der Applikation. Das heißt sie stellt Daten zur Darstellung und Kommandos zur Interaktion bereit. Das `MainViewModel` ist für das Hauptfenster, das `BusinessObjectEditorViewModel` für das Popup, das angezeigt wird wenn ein gefundenes `BusinessObject` per Klick geöffnet wird und das `TagCollectionViewModel` für das Popup, das angezeigt wird, wenn Tags eines `BusinessObject` per `OldSchool` Methode bearbeitet werden zuständig. Diese wurden an die Jeweiligen Views als `DataContext` gebunden.

`RelayCommand`
:	ist eine Helferklasse, die das ICommand Inferface implementiert und die Methoden CanExecute und Execute als Delegat-Typen bereitstellt, sodass diese Logik direkt im ViewModel implementiert werden kann ohne dass eine Extra Klasse für Kommandos angelegt werden muss und gegebenenfalls Kontexte umständlich übergeben werden müssen.

### Converter

`Converter`
:	dienen als Übersetzer der Daten in ein angemessenes Format für die View. Sie werden an eine Datenbindung angehangen über konvertieren die Daten bei jeder Änderung. So kann diese Konvertierungslogik aus dem ViewModel entfernt werden und ist wiederverwendbar

`BooleanToVisibilityContainer`
:	überträgt einen Wahrheitswert in die VisibiltyEnumeration.

`TagCollectionToStringConverter`
:	serialisiert die TagCollection in eine Zeichenkette und parst diese nach Änderung wieder in eine TagCollection zurück. Somit ist eine sehr einfache Tageingabe möglich, da dieser an jede beliebige Texteingabe gebunden werden kann.

## Benutzeroberfläche

Die Benutzeroberfläche ist wie für einen Prototyp (\autoref{abb:InitialzustandPrototyp}) typisch schlicht gehalten. Zur besseren Benutzbarkeit sind die Grenzen rechts und unterhalb der gefundenen BusinessObjects frei verschiebbar.

![\label{abb:InitialzustandPrototyp} Initialzustand des Prototyps (Datenbank geladen)](img/InitialzustandPrototyp.jpg)

\newpage

# Konstruktion eines nachvollziehbaren Beispiels zur Präsentation

Da geographische Daten für die Präsentation für das Publikum einer Präsentation eher uninteressant und nicht unbedingt nachvollziehbar sind wurde beschlossen, unser erworbenes Verständnis einer guten Folksonomie anzuwenden und ein eingängigeres Beispiel zu erstellen, sodass der Zuhörer das Interesse während der Präsentation nicht verliert. Dabei wurde sich auf den Themenbereich Disney geeinigt, da davon ausgegangen wurde, dass jeder zumindest einen Teil dieser Figuren kennt und so die Beziehungen deutlicher und somit verständlicher werden. Durch die emotionale Wirkung der Marke Disney ist auch mit anhaltender Aufmerksamkeit zu rechnen.

**Beispielhafter Filter-/Suchprozess**

Um ein Verständnis für den Ablauf einer Such- bzw. Filteraktion durch den Nutzer und den Zusammenhang zwischen WordCloud, Ergebnisliste und Datenbankabfrage zu erlangen, wird der Prozess exemplarisch anhand der selbst erstellten Datenbank beschrieben.

## Ausgangslage

Ein Benutzer sucht nach einem Objekt, was er nicht genau kennt. Ihm sind lediglich einige Eigenschaften bekannt. Die zugehörige Datenbank wurde bereits geladen.

Tags | Auswahl (mit Ziel \enquote{Munkelt})
----:|:-------------------------------------
1    | stark
2    | mutig
3    | clever

## Schritt 1: Benutzer klickt auf das Tag \enquote{stark}

Dadurch wird im Hintergrund das SQL Query gem. \autoref{abb:sql1} generiert und ausgeführt.

\begin{figure}

\lstinputlisting[basicstyle=\ttfamily\footnotesize, numbers=none, caption={}, title={}, label={}, language=]{04_SQL1.sql}

\caption{\label{abb:sql1} 1. Abfrage}
\end{figure}

Pro angeklickten Tag wird jeweils ein zusätzlicher JOIN über die Tabelle der Businessobjekte und der Tags durchgeführt um die Filterung anhand des Tags zu ermöglichen.

Es werden nun alle Objekte mit dem entsprechenden Tag \enquote{stark} herausgefiltert und angezeigt (\autoref{abb:FilterergebnisStark}).

![\label{abb:FilterergebnisStark} Filterergebnis Tag \enquote{stark}](img/FilterergebnisStark.jpg)

Als Resultat wird ebenfalls die WordCloud entsprechend des neuen Filterergebnis neu erstellt. Im Vergleich zur Ausgangs-WordCloud wird sie kleiner, da die Filtermenge eingeschränkt wurde (\autoref{abb:WordCloudFilterung1}).

![\label{abb:WordCloudFilterung1} WordCloud nach 1. Filterung](img/WordCloudFilterung1.jpg)

\pagebreak

## Schritt 2: Benutzer klickt auf das Tag \enquote{mutig}

Dadurch wird im Hintergrund das SQL Query gem. \autoref{abb:sql2} ausgeführt.

\begin{figure}

\lstinputlisting[basicstyle=\ttfamily\footnotesize, numbers=none, caption={}, title={}, label={}, language=]{04_SQL2.sql}

\caption{\label{abb:sql2} 2. Abfrage}
\end{figure}

Es werden nun alle Objekte mit den entsprechenden Tags \enquote{stark} und \enquote{mutig} herausgefiltert und angezeigt (\autoref{abb:FilterergebnisStarkMutig}).

![\label{abb:FilterergebnisStarkMutig} Filterergebnis Tags \enquote{stark} & \enquote{mutig}](img/FilterergebnisStarkMutig.jpg)

Als Resultat wird die WordCloud analog zum Schritt 1 entsprechend des neuen Filterergebnis neu erstellt (\autoref{abb:WordCloudFilterung2}).

![\label{abb:WordCloudFilterung2} WordCloud nach 2. Filterung](img/WordCloudFilterung2.jpg)

\pagebreak

## Schritt 3: Benutzer klickt auf das Tag \enquote{clever}

Dadurch wird im Hintergrund das SQL Query gem \autoref{abb:sql3} ausgeführt.

\begin{figure}

\lstinputlisting[basicstyle=\ttfamily\footnotesize, numbers=none, caption={}, title={}, label={}, language=]{04_SQL3.sql}

\caption{\label{abb:sql3} 3. Abfrage}
\end{figure}

Es werden nun alle Objekte mit den entsprechenden Tags \enquote{stark}, \enquote{mutig} und \enquote{clever} herausgefiltert und angezeigt. Die Ergebnise in den resultierenden Objekten bleiben in diesem Fall allerdings im Vergleuch zu Schritt zwei gleich.

<!-- 
gleiches Bild wie zuvor!

\autoref{abb:FilterergebnisStarkMutigClever}

![\label{abb:FilterergebnisStarkMutigClever} Filterergebnis Tags \enquote{stark}, \enquote{mutig} & \enquote{clever}](img/FilterergebnisStarkMutigClever.jpg)
-->

Die WordCloud wird analog zum Schritt 1 entsprechend des neuen Filterergebnis neu erstellt (\autoref{abb:WordCloudFilterung3}).

![\label{abb:WordCloudFilterung3} WordCloud nach 3. Filterung](img/WordCloudFilterung3.jpg)

\pagebreak

## Schritt 4: Benutzer sucht nach dem Begriff \enquote{Munkelt}.

Dadurch wird im Hintergrund das SQL Query gem. \autoref{abb:sql4} ausgeführt.

\begin{figure}

\lstinputlisting[basicstyle=\ttfamily\footnotesize, numbers=none, caption={}, title={}, label={}, language=]{04_SQL4.sql}

\caption{\label{abb:sql4} 4. Abfrage}
\end{figure}

Durch eine zusätzliche `WHERE`-Klausel werden nun alle Objekte mit den entsprechenden Tags \enquote{stark}, \enquote{mutig} & \enquote{clever} sowie den Namen, welche \enquote{Munkelt} enthalten, herausgefiltert und angezeigt (\autoref{abb:FilterergebnisFinal}).

![\label{abb:FilterergebnisFinal} Einzelnes Objekt nach 4. Filterung](img/FilterergebnisFinal.jpg)

Als Resultat wird die WordCloud analog zum Schritt 1 entsprechend des neuen Filterergebnis neu erstellt (\autoref{abb:WordCloudFilterung4}).

![\label{abb:WordCloudFilterung4} WordCloud nach 4. Filterung](img/WordCloudFilterung4.jpg)

\pagebreak

## Ergebnis

Die Auswahl führte im 4. Schritt mit \autoref{abb:WordCloudFilterung4} zu einem eindeutigen Treffer. Eine weitere Selektion von Tags kann die Genauigkeit nicht mehr erhöhen.

<!--
![\label{abb:FilterergebnisFinalGesamt}Gesamtbild Endresultat](img/FilterergebnisFinal.jpg)
-->
