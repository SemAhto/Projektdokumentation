# Anforderungsanalyse

Während den ersten zwei Gruppenmeetings wurden die Anwendungsfälle für Folksonomien, Social
Tagging und Tag-Clouds im ERP-System von TecWare ausgearbeitet. Dabei wurde sich an der Satzschablone von Chris Rupp orientiert. Anhand dessen wurden folgende Prinzipsskizzen erstellt, wie auch Anforderungen schriftlich formuliert. Folgene Ergebnisse wurden dabei erzielt:

## Prinzipskizzen:

1. Prinzipskizze 

![01](img/01Prinzipienskizze.png)

2. Prinzipskizze 

![01](img/02Prinzipienskizze.png)

3. Prinzipskizze 

![03](img/03Prinzipienskizze.png)

## Anforderungen:

**Glossar**:

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
3. Das System muss in der Lage sein, eine Liste von Objekten (Bestellnummer, Artikel, Artikelnummer, Kundennummer) zu verkleinern, nachdem nach einem bestimmten Tag gefiltert wurde.
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

## Entwurf der GUIs zur Eingabe von Tags:

Um eine Vorstellung von der zukünftigen Oberfläche des ERP-Systems zu bekommen, wurden von den Studenten grafisch fünf GUIs entworfen. Diese sollten der Eingabe von Tags für sogenannte Datenobjekte dienen.
Die Aufgabe der Studenten bestand darin, sich eine Form der Eingabemöglichkeit für Tags zu überlegen wobei auch neue
Dialoge entstehen können. Die Ergebnisse wurden im Gruppenmeeting präsentiert und deren Verwendung, im Austausch mit Herrn Stein  diskutiert. 

1. Inline vs. Popup-Editor

![InlVSPopup](img/InlVSPopup.png)

2. Beispielmaske (ohne Tag Eingabe)

![BeispielMaskeOhneTE](img/BeispielMaskeOhneTE.png)

3. Beispielmaske (mit Inline-Tag Eingabe)

![SAPmitInline](img/SAPmitInline.png)

4. Beispielmaske (mit Popup – Tag Eingabe)

![SAPmitPopUpPNG](img/SAPmitPopUpPNG.png)

5. Twitter-like Textbox (Inline)

![TwitterLIke](img/TwitterLIke.png)

6. IDE-like Editor (Inline)

![IDELike](img/IDELike.png)

7. Evernote-like Tagbox (Inline)

![EvernoteLike](img/EvernoteLike.png)

8. Classic Listbox (Popup)

![ClassikListBox](img/ClassikListBox.png)

## Algorithmus Pseudocode


![Pseudocode](img/16002232756924747189.jpg)



