
# Ermittlung der Anforderungen

Während den ersten zwei Gruppenmeetings wurden der Entwurf von Anwendungsfällen für Folksonomien, Social
Tagging und Tag-Clouds im ERP-System ausgearbeitet. Dabei wurde sich an der Satzschablone von Chris Rupp (vgl. \cite{Sophist:Schablonen})
orientiert. Anhand dessen wurden folgende Prinzipsskizzen erstellt, wie auch Anforderungen schriftlich formuliert. Folgene Ergebnisse wurden dabei erzielt:

## Prinzipskizzen

Die Oberfläche von PPsn wurde im Groben nachempfunden (\autoref{abb:Prinzipskizze1}).

![\label{abb:Prinzipskizze1} 1. Prinzipskizze](img/01Prinzipienskizze.png)

Durch Auswahl von Kathegoien soll die TagCloud beeinflusst werden (\autoref{abb:Prinzipskizze2}) können.

![\label{abb:Prinzipskizze2} 2. Prinzipskizze](img/02Prinzipienskizze.png)

Durch die Auswahl von Tags soll die TagCloud neu berechnet werden (\autoref{abb:Prinzipskizze3}).

![\label{abb:Prinzipskizze3} 3. Prinzipskizze](img/03Prinzipienskizze.png)

## Anforderungen

Wir unterscheiden die folgenden Begriffe bei der Festlegung der Anforderungen.

<!-- hier ein Bsp. mit Definitionslisten -->

Systemtags
:	Tags, die bei Erstellung eines Objekts vom System generiert werden.

Usertags
:	Tags, die vom User selbst erstellt und an das Objekt angehangen werden. 

Tags
:	Menge aller System- und Usertags.

Klassifikation: 

	0 = Text
	1 = Datum
	2 = Nummer

**System**:

1. Das System muss in der Lage sein, eine Vielzahl von Tags anzuzeigen.
2. Das System muss in der Lage sein, nach bestimmten Tags zu filtern
3. Das System muss in der Lage sein, eine Liste von Objekten (Bestellnummer, Artikel, Artikelnummer, Kundennummer) z
verkleinern, nachdem nach einem bestimmten Tag gefiltert wurde.
4. Das System muss in der Lage sein, einem Objekt Systemtags anzuhängen.
5. Das System muss in der Lage sein, aus den in der Liste angezeigten Tags, eine WordCloud zu generieren und anzuzeigen.
6. Das System muss in der Lage sein, Systemtags zu klassifizieren. 
7. Das System muss in der Lage sein, zu einem einzelnen Objekt eine WordCloud zu generieren.
8. Das System muss in der Lage sein, in der Eingabemaske eine alphabetische Sortierung vorzunehemen.
9. Das System muss in der Lage sein, eine Filterliste in der Suchleiste zu generieren.
10. Das System muss in der Lage sein einen Suchverlauf anzuzeigen.

**Nutzer**:

1. Der Nutzer muss in der Lage sein, nach Schlagworten in einer Eingabemaske zu suchen.
2. Der Nutzer muss in der Lage sein, eigene Tags an ein Objekt hinzuzufügen.
3. Der Nutzer muss in der Lage sein, Tags in der WordCloud ausblenden zu können.
4. Der Nutzer muss in der Lage sein, eigene Usertags zu ändern/löschen.
5. Der Nutzer muss in der Lage sein, Usertags zu klassifizieren.
6. Der Nutzer muss in der Lage sein, durch eine Interaktion einen Tag als Filter zu setzen.
7. Der Nutzer muss in der Lage sein, einen Tag auszuwählen.
8. Der Nutzer muss in der Lage sein, durch eine Interaktion einen Tag auszublenden.

**Administrator**:

1. Der Administrator muss in der Lage sein, Tags zu ändern / löschen.

# Entwurf der GUIs zur Eingabe von Tags

Um eine Vorstellung von der zukünftigen Eingabe von Tags im ERP-System zu bekommen, wurden von den Studenten grafisch fünf GUIs
entworfen. Diese sollten der Eingabe von Tags für sogenannte Datenobjekte dienen.
Die Aufgabe der Studenten bestand darin, sich eine Form der Eingabemöglichkeit für Tags zu überlegen, wobei auch neue
Dialoge entstehen können. Die Ergebnisse wurden im Gruppenmeeting präsentiert und deren Verwendung, im Austausch mit Herrn
Stein  diskutiert. 

\autoref{abb:Inline-vs-PopupEditor}

![\label{abb:Inline-vs-PopupEditor} Inline vs. Popup-Editor](img/InlVSPopup.png)

\autoref{abb:BeispielmaskeOhneTagEingabe}

![\label{abb:BeispielmaskeOhneTagEingabe} Beispielmaske (ohne Tag Eingabe)](img/BeispielMaskeOhneTE.png)

\autoref{abb:BeispielmaskeMitTagEingabe}

![\label{abb:BeispielmaskeMitTagEingabe} Beispielmaske (mit Inline-Tag Eingabe)](img/SAPmitInline.png)

\autoref{abb:BeispielmaskeMitPopupTagEingabe}

![\label{abb:BeispielmaskeMitPopupTagEingabe} Beispielmaske (mit Popup – Tag Eingabe)](img/SAPmitPopUpPNG.png)

\autoref{abb:Twitter-likeTextbox}

![\label{abb:Twitter-likeTextbox} Twitter-like Textbox (Inline)](img/TwitterLIke.png)

\autoref{abb:IDE-likeEditor}

![\label{abb:IDE-likeEditor} IDE-like Editor (Inline)](img/IDELike.png)

\autoref{abb:Evernote-likeTagbox}

![\label{abb:Evernote-likeTagbox} Evernote-like Tagbox (Inline)](img/EvernoteLike.png)

\autoref{abb:ClassicListbox}

![\label{abb:ClassicListbox} Classic Listbox (Popup)](img/ClassikListBox.png)

# Algorithmus Pseudocode

Zur visuellen Anordnung der unterschiedlich großen Tags/Worte in Tag-Clouds, recherchierten die Studenten nach verschiedenen
Algorithmen. Ein Algorithmus wurde anhand eines \nameref{abb:Pseudocode}s präsentiert. Anhand eines kleinen
Beispiels wurde die Arbeitsweise des Algorithmus erläutert. 

![\label{abb:Pseudocode} Pseudocode](img/16002232756924747189.jpg)

#Fallbeispiel

Auf der \autoref{abb:FB_Szenario}

![\label{abb:FB_Szenario} Fallbeispiel Szenario](img/FB_Szenario.png)

ist folgendes Szenario dargestellt:
Drei verschiedene Personen, namens Karl, Max und Sabine geben für drei unterschiedliche Obstsorten Tags ihrer Wahl ein.  

Für die Apfelsorte: ``#Rot, #Süß, #Apfel``.

Für die Birnensorte: ``#Birne, #Süß``.

Für die Kirschsorte: ``#Kirsche, #Apfel``.

Diese eingegebenen Tags werden in einer Datentabelle erfasst.

\autoref{abb:FB_Daten}

![\label{abb:FB_Daten} Fallbeispiel Szenario](img/FB_Daten.png)

In einer weiteren Tabelle, werden die eingegebenen Tags sowohl aufgelistet als auch festgehalten, wie oft ein Tag eingegeben
wurde. An der in \autoref{abb:FB_Rahmenbedingungen} abgebilteten Formel, wird außerdem seine Größe, mit der
er letztendlich in der Tag-Cloud abgebildet werden soll bestimmt.


![\label{abb:FB_Rahmenbedingungen} Fallbeispiel Szenario](img/FB_Rahmenbedingungen.png)

In \autoref{abb:FB_Ergebnis} 

wurde der Tag `#Süß` am häufigsten eingegeben, weshalb er auch größer dargestellt wird.

![\label{abb:FB_Ergebnis} Fallbeispiel Szenario](img/FB_Ergebnis.png)

#Folksonomie, Social Tagging und Tag-Clouds 

##Begriffsklärung
Bevor auf die Thematik der Folksonomie (\cite{onl:socialtaggingandfolksonomies}) näher eingegangen wird, sollten ein paar
Begriffe zum besseren Verständnis geklärt werden.

###Social Network
Ein Social Network (\cite{onl:socialnetwork})oder zu deutsch ein soziales Netzwerk wird in diesem Zusammenhang als eine
Zusammenkunft verschiedener Nutzer im Internet bezeichnet.
Diese Nutzer können miteinander interagieren und die Aktionen der anderen Nutzer nachvollziehen. Diese Community (eng.
Gemeinschaft, Vereinigung) gibt es zum Teil mit sehr allgemeinen Interessen (z.B. Facebook)
oder aber auch mit einem speziellen Ziel (z.B. XING zu Jobsuche und zum herstellen von Geschäftskontakten).

###User
Ein User oder auch Nutzer ist ein Mitglied eines sozialen Netzwerkes. Dieser kann mit anderen Nutzern in dem social Network
interagieren und verschiedene Aktionen ausführen. Nutzer können in verschiedene Nutzergruppen mit
unterschiedlichen Berechtigungen unterteilt werden. So kann es zum Bespiel die normale Nutzer geben, Moderatoren und
Administratoren. Dabei wären die Moderatoren verantwortlich die Inhalte der Nutzer auf ihre Kon­for­mi­tät mit den
Regeln des Netzwerks zu prüfen und zum Beispiel Spam zu verhindern. Der Administrator hat in einem solchen Netzwerk meist eine
eher technische Aufgabe.
Ein User verfügt immer über ein bestimmtes Vokabular, welches durch sein Umfeld, sein intellektuelles Niveau und seine Kultur,
etc. geprägt ist.

###Ressource
In Social Networks werden verschiedene Objekte / Ressourcen miteinander geteilt und gemeinsam bearbeitet oder verwendet. Solche
Ressourcen können zum Beispiel Bilder, Musikdateien, aber auch Baupläne oder Lebensläufe sein. Meist sind die Inhalte auf
bestimmte Ressourcen, welche mit dem Ziel des Social Networks zusammenhängt, beschränkt.

###Tag
Ein Tag oder auch Schlagwort, Deskriptor oder Etikett ist in diesem Zusammenhang eine Form der unscharfen Klassifizierung
beziehungsweise der Beschreibung von Ressourcen. Diese Tags sind meist willkürlich und unterliegen keinen
strengen oder kontrollierten Regeln. Zum Beispiel bei der Plattform / dem Social Network *Instagram* werden Bilder von Nutzern
geteilt und mit *Hashtags* beschrieben. Über diese *Hashtags* können andere Bilder mit den gleichen
Bezeichnungen gefunden werden.

###Unscharfe Suche
Eine unscharfe Suche ist die Möglichkeit eine bestimmte Ressource innerhalb eines Social Networks zu suchen, von welcher noch
keine genaue Vorstellung besteht. Dabei werden die Suchergebnisse nur immer weiter eingegrenzt und es wird sich Stück für Stück
an das gewünschte Ergebnis heran gearbeitet.

##Social Tagging (\cite{wiki:socialtagging})
Als Tagging oder auch taggen wird der Prozess des Tag an eine Ressource anhängen beschrieben (Indexieren). Beim Social Tagging
geschieht dies innerhalb eines Social Networks durch die User. Dabei werden an verschiedene Ressourcen
durch verschieden User verschiedene Tags angehängt. Dadurch können User wiederum andere Ressourcen finden und die Ressourcen
mit weiteren Tags versehen.
Dadurch ist die Grundlage für eine unscharfe Suche geschaffen.

\autoref{abb:socialtagging}

![\label{abb:socialtagging} Social Tagging](img/socialtagging.png)


Beispiele für Social Networks welche das Social Tagging unterstützen gibt es viele, wie z.B. *Instagram*, *Youtube*,
*del.icio.us*, etc..

## Folksonomie
Das Kofferwort Folksonomie (\cite{onl:folksonomy})ist aus folgenden Bestandteilen zusammengesetzt: Folk - das Volk oder auch
die Laien; Taxis - die Klassifikation; Nomos - das Managment.
Es bedeutet also soviel wie das Klassifikationsmanagment durch oder vom Volk aus. Der Begriff wurde erstmalig 2003 durch Van
der Wal in einem Artikel erwähnt und maßgeblich durch Ihn geprägt. Fast alle Artikel oder Quellen beziehen
sich auf seine Theorie.
Bei der Folksonomie (\cite{onl:folksonomiesccc}) handelt es sich also, um die Beziehung von Tags, Ressourcen und Nutzern. Diese
Verbindungen werden innerhalb eines Social Networks oder mittels einer sozialen Software erstellt und
unterliegen keinen Regeln. Folksonomien entstehen durch den Prozess des Social Taggings und werden in immer mehr Systemen
verwendet um den Nutzern eine zusätzliche Möglichkeit der Inhaltserschließung zu ermöglichen.

\autoref{abb:folksonomy}

![\label{abb:folksonomy} Zusammenhang zw. User, Tags & Ressourcen](img/folksonomy.png)

Die einzelnen Beziehungen zwischen Objekten, Nutzern und Tags können auf verschiedene Arten entstehen. Dabei unterscheidet man
zwischen den Formen der Engen (Narrow) und der Breiten (Broad) Folksonomie.

###Narrow Folkyonomy / Enge Folksonomie
Die enge Folksonomie (\cite{onl:unibielefeldfolksonomie}) wird heute am häufigsten verwendet, zum Beispiel bei Social Networks
wie *Twitter* und *Instagram*. Hier wird ein Objekt von einem Nutzer erstellt und in das Netzwerk
gestellt. Er versieht das Objekt mit initialen Tags über welche es von anderen Nutzern mit verschiedenen Vokabularen gefunden
werden kann. Diese können nun weitere Tags an das Objekt anhängen und ermöglichen es nun eventuell
weiteren Nutzern dieses Objekt zufinden und zu *betaggen*. Dabei ist das besondere, dass Tags nur einmalig an ein Objekt
vergeben werden können. In der nachfolgenden Abbildung wird dies noch einmal verdeutlicht.

\autoref{abb:narrowfolksonomy}

![\label{abb:narrowfolksonomy} Narrow Folksonomy](img/narrowfolksonomy.jpg)

###Broad Folksonomy / Breite Folksonomie
Anders als bei der engen Folksonomie besteht bei der breiten Folksonomie die Möglichkeit, dass die User Tags mehrfach an ein
Objekt anhängen. Dadurch besteht die Möglichkeit die Popularität (die *Beliebtheit*) eines Tags auf einem
Objekt zu bestimmten und auszuwerten. Ein Beispiel für die breite Folksonomie ist die Website del.icio.us. In der nachstehenden
Abbildung wird auch die Breite Folksonomie noch einmal verdeutlicht.

\autoref{abb:broadfolksonomy}

![\label{abb:broadfolksonomy} Broad Folksonomy](img/broadfolksonomy.jpg)

\pagebreak

### Vorteile und Nachteile von Folksonomien
| Vorteile der Folksonomie    | Nachteile der Folksonomie   							 | 
| :--------------------------|:--------------------------------------------------------------------------------  | 
| Stöbern / unscharfe Suche wird ermöglicht   		   | Fehlende Kontrolle / Regeln                         | 
| Authentisch  		     | Spam / Troll-Tags								 |
| Masseninformation können gesammelt werden	           | Keine Eindeutigkeit /  fehlendes Vokabular		 | 
|Sensibilisieren Nutzer für Inhaltserschließung |								 |

Das Suchen von Objekten und Ressourcen ist kein triviales Phänomen in der Informatik oder in Social Networks. Das Problem dabei
ist, dass der Suchende meist nicht ganz exakt weis wonach er eigentlich sucht.
Entweder fehlt dem Suchenden die genaue Bezeichnung oder er hat nur eine wage Richtung in welcher die Ressource vermutet wird.
Deshalb gibt es in vielen Systemen Klassifikationen oder ähnliches um den Nutzer bei seiner Suche zu unterstützen. Mittels
Folksonomien und dem Social Tagging ist es möglich dem Nutzer eine unscharfe Suche zu ermöglichen. Dies
bietet den Vorteil das der Nutzer sich *stöbernd* durch die Objekte bewegen kann und seine Auswahl immer mehr eingrenzt, bis er
nur 

\pagebreak

noch eine überschaubare Menge an Ressourcen übrig hat und in dieser sich sein gesuchtes Objekt
befindet. 


Dabei wird er auch sensibilisiert auf den Inhalt oder die thematischen Verbindungen der Ressource, da er die Tags
liest und mit dem Objekt verbindet.
Je mehr User die Tags *betaggen*, desto authentischer wird die
Folksonomie.Doch dadurch entstehen auch die Probleme mit Folksonomien
denn durch die fehlende Kontrolle und durch fehlende Regeln können
schlechte oder irritierende  Tags das Ergebnis verfälschen. Zum Beispiel
können Tags mit der gleichen Bedeutung in verschiedenen Zeitformen oder
Wortbeugungen an die Ressource angehangen werden oder es können Spam-
oder auch *Troll-* Tags angehangen werden. Und das natürlich auch in
allen erdenklichen Sprachen.
Das alles ist auf ein fehlendes Vokabular und die fehlenden Standards
zurückzuführen.
Möglichkeiten zur Ausbesserung dieser Nachteile wäre zum Beispiel eine
automatische Suchvervollständigung, welche schon vorhandene Tags
vorschlägt. Eine weitere Verbesserung wäre die Wortstammfindung, welche
in Kapitel \label{Lemmatisierung}  näher beschrieben wird.



##Tag-Clouds

\autoref{abb:tagCloud}

![\label{abb:tagCloud} Tag-Cloud](img/tagCloud.png)


