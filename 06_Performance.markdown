
Die Tag-Cloud ist ein Teil des Filtersystems des ERP-Systems. Daher spielt bei der Erstellung der Tag-Cloud die Erstellungszeit eine wichtige Rolle. Um diese Erstellungszeit optimieren zu können, mussten die Studenten als erstes ein besonders gutes Tag-Cloud-Aussehen herstellen um einen Vergleich zu wagen. 

# Veränderte Parameter der spiralförmigen Tag-Cloud-Erstellung

Bei der Erstellung einer Spirale sind zwei Parameter sehr wichtig, Wachstumsfaktor der Spirale und die Größe des Einfügesektors. Die folgende Abbildung zeigt die Parameter in Zusammenhang mit einer Spirale:

![\label{abb:Spirale} Spirale, a: Wachstumsfaktor, b: Größe des Einfügesektors](img/Spirale.png)

Aussehen einer optimalen Tag-Cloud

Ein optimales Aussehen der Tag-Cloud zeichnet sich durch eine gute Platzausnutzung bei möglichst wenig Löchern aus. Der Abstand zwischen den einzelnen Tags sollte minimal, jedoch noch deutlich erkennbar sein. Ein gutes Beispiel zeigt die folgende Abbildung.

![\label{abb:AussehenEinerOptCloud Aussehen einer optimalen Tag-Cloud](img/AussehenEinerOptCloud.png)

In der oben gezeigten Abbildung sind der Wachstumsfaktor mit 0,1 und die Größe der Einfügesektoren mit 120 Grad angegeben. Bei den Tests des zeitlichen wir die Tag-Cloud mit den genannten Werten in 944 Millisekunden im Durchschnitt erstellt. Um das Bild darzustellen werden zudem 99.770 Positionierungsversuche im Durchschnitt unternommen. Eine Tag-Cloud-Erstellung mit diesen Durchschnittswerten ist nicht für den Einsatz in einem Filtersystem gedacht. 

Umsetzung im Algorithmus
Damit die folgenden Anweisungen funktionieren müssen die Namespaces System.Diagnostics und System.IO in den Algorithmus eingebunden werden. 
Als Erstes wird die Stoppuhr für die Zeitmessung deklariert: 

```
public System.Diagnostics.Stopwatch Zeit(){
	var watch = System.Diagnostics.Stopwatch.StartNew();
	return watch;
}
```

Eine Funktion Stopp mit den Aufrufparametern für die Stoppuhr \enquote{watch}, den zu messenden Wert \enquote{messwert} und eine Zählvariable \enquote{lauf} ist ebenfalls wichtig. In dieser Methode wird die Stoppuhr gestoppt. Die Übergabe der Zeit, der Anzahl der Durchläufe und des Messwertes an die Methode Append sind weitere Inhalte dieser Methode.

```
public long Stopp(System.Diagnostics.Stopwatch watch, string messwert, int lauf){
	watch.Stop();
	var elapsedMs = watch.ElapsedMilliseconds;
	string dateiname = speicherort;
	string neueZeile = messwert + ": " + elapsedMs + ", " + lauf + "\r\n";
	Append(dateiname, neueZeile);
	return elapsedMs;
}
```

Mit der Methode Append werden die übergebenen Daten in eine Textdatei für die Auswertung exportiert. 

```
public void Append(string sFilename, string sLines) {
	StreamWriter myFile = new StreamWriter(sFilename, true);
	myFile.Write(sLines);
	myFile.Close();
}
```

Innerhalb der Methode `CalculateWordAppearence` muss als erste Anweisung die Stoppuhr gestartet werden. Danach wird die Zählvariable \enquote{dlauf} deklariert und mit dem Wert null initiiert.

```
var stoppzeit = Zeit();
var dlauf = 0;
```

In der Do-While-Schleife in der das Tag positioniert wird, muss die Zählvariable bei jedem Durchlauf um eins erhöht werden. Am Ende der \enquote{CalculateWordAppearence}- Methode muss noch die \enquote{Stopp}- Methode aufgerufen werden, damit die Stoppuhr gestoppt wird.
Stopp(stoppzeit, \enquote{CalcWordAppear}, dlauf);

## Erweiterung des Spiralform-Verfahrens mit dem Halbierungsverfahren
Für dieses Verfahren wurde ein Performance-Test durchgeführt. 
Mit den Ausgangswerten 0,1 für den Wachstumsfaktor und 120 Grad für die Größe der Einfügesektoren ist eine Erstellungszeit von 998 Millisekunden bei 71.321 Positionierungsversuchen im Durchschnitt herausgekommen. Diese Werte sind für eine Tag-Cloud-Erstellung in einem ERP-System ungeeignet. 

![\label{abb:OptTagCloudAussenen} Tag-Cloud-Aussehen mit Startwerten unter zusätzlicher Nutzung des Halbierungsverfahrens](img/OptTagCloudAussenen.png)

Der Wachstumsfaktor von 0,9 und die Einfügesektor -Größe von 120 Grad liefern sowohl ein ansprechendes Tag-Cloud-Aussehen als auch die Performance -Werte von 75 Millisekunden bei 11.516 Positionierungsversuchen im Durchschnitt. 

![\label{abb:TagCloudAussehenMitOptWerten} Abbildung: Tag-Cloud-Aussehen mit optimierten Werten mit Halbierungsverfahrens](img/TagCloudAussehenMitOptWerten.png)

# Performance-Tests und Auswertung

Beim Testen verschiedener Werte des Wachstumsfaktors fällt auf, dass sich die Erstellungszeit mit größer werdendem Wachstumsfaktor bei gleicher Größe der Einfügesektoren verringert. Es liegt allerdings kein lineares Verhalten vor. Ein ähnlicher Verlauf bei den Einfügesektoren und gleichbleibendem Wachstumsfaktor ist nicht zu erkennen. Das Minimum der Positionierungsversuche schwankt sehr stark und es ist kein einfaches mathematisch erklärbares Verhalten ableitbar. 
Die besten Parameterwerte die zu einem guten Tag-Cloud-Aussehen führen sind mit 122 Millisekunden bei 2.988 Positionierungsversuchen im Durchschnitt erreicht. 

![\label{abb:OptTagCloudAussenen} Abbildung: optimales Tag-Cloud-Aussehen](img/OptTagCloudAussenen.png)

Hierbei beträgt die Einfügesektor-Größe 30 Grad und der Wachstumsfaktor 0,9. Bei anderen Parameterwerten für Einfügesektor-Größe und Wachstumsfaktor gibt es bessere Performance-Werte, jedoch ist entweder die Platzausnutzung innerhalb des Positionierungsfensters nicht gegeben oder es gibt eine Menge großer Lücken innerhalb der Tag-Cloud.

# Entscheidung

Für die Erstellung einer Tag-Cloud mit Hilfe des Spiralform-Verfahrens sehen wir als optimale Parameter für die Einfügesektor-Größe 30 Grad und für den Wachstumsfaktor 0,9 ohne Nutzung des Halbierungsverfahrens. Obwohl das Halbierungsverfahren bessere Durchschnittserstellungszeiten liefert, haben wir uns dagegen entschieden. Das liegt zum einen an der noch nicht fertiggestellten Umsetzung des Halbierungsverfahrens. Zum anderen benötigt das normale Spiralform-Verfahren wesentlich weniger Positionierungsversuche, auf die wir ein größeres Gewicht gelegt haben. Unserer Ansicht nach sind die ungefähren 50 Millisekunden Unterschied in der Erstellungszeit vernachlässigbar. 122 Millisekunden sind für die Erstellung einer Tag-Cloud annehmbar.
