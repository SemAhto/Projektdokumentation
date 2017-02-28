
Die Tag-Cloud ist ein Teil des Filtersystems des ERP-Systems. Daher spielt bei der Erstellung der Tag-Cloud die Erstellungszeit eine wichtige Rolle. Um diese Erstellungszeit optimieren zu können, musste als erstes ein besonders gutes Tag-Cloud-Aussehen hergestellt werden, um einen Vergleich zu ermöglichen. 

# Veränderte Parameter der spiralförmigen Tag-Cloud-Erstellung

Bei der Erstellung einer Spirale sind zwei Parameter sehr wichtig, Wachstumsfaktor der Spirale und die Größe des Einfügesektors. Die \autoref{abb:Spirale} zeigt die Parameter in Zusammenhang mit einer Spirale.

![\label{abb:Spirale} Spirale, a: Wachstumsfaktor, b: Größe des Einfügesektors](img/Spirale.png)

# Aussehen einer optimalen Tag-Cloud \label{sec:AussehenTagCloud}

Ein optimales Aussehen der Tag-Cloud (\autoref{abb:AussehenEinerOptCloud}) zeichnet sich durch eine gute Platzausnutzung bei möglichst wenig Löchern aus. Der Abstand zwischen den einzelnen Tags sollte minimal, jedoch noch deutlich erkennbar sein. Ein gutes Beispiel zeigt die folgende Abbildung.

![\label{abb:AussehenEinerOptCloud} Aussehen einer OptimalenTag-Cloud](img/AussehenEinerOptCloud.png)

In der oben gezeigten Abbildung sind der Wachstumsfaktor mit 0,1 und die Größe der Einfügesektoren mit 120 Grad angegeben. Bei den Tests des zeitlichen wir die Tag-Cloud mit den genannten Werten in 944 Millisekunden im Durchschnitt erstellt. Um das Bild darzustellen werden zudem 99.770 Positionierungsversuche im Durchschnitt unternommen. Eine Tag-Cloud-Erstellung mit diesen Durchschnittswerten ist nicht für den Einsatz in einem Filtersystem gedacht. 

# Umsetzung im Algorithmus

Damit die Anweisungen funktionieren müssen die Namespaces `System.Diagnostics` und `System.IO` in den Algorithmus eingebunden werden. 
Als Erstes wird die Stoppuhr (\autoref{code:ZeitMethode}) für die Zeitmessung deklariert.

\begin{figure}

\lstinputlisting[basicstyle=\ttfamily, numbers=none, caption={}, title={}, label={}, language=]{06_ZeitMethode.cs}

\caption{\label{code:ZeitMethode} Funktion Zeit}
\end{figure}

Eine Funktion `Stopp` (\autoref{code:StoppMethode}) mit den Aufrufparametern für die Stoppuhr `watch`, den zu messenden Wert `messwert` und eine Zählvariable `lauf` ist ebenfalls wichtig. In dieser Methode wird die Stoppuhr gestoppt. Die Übergabe der Zeit, der Anzahl der Durchläufe und des Messwertes an die Methode Append sind weitere Inhalte dieser Methode.

\begin{figure}

\lstinputlisting[basicstyle=\ttfamily, numbers=none, caption={}, title={}, label={}, language=]{06_StoppMethode.cs}

\caption{\label{code:StoppMethode} Funktion Stopp}
\end{figure}

Mit der Funktion `Append` (\autoref{code:AppendMethode}) werden die übergebenen Daten in eine Textdatei für die Auswertung exportiert. 

\begin{figure}

\lstinputlisting[basicstyle=\ttfamily, numbers=none, caption={}, title={}, label={}, language=]{06_AppendMethode.cs}

\caption{\label{code:AppendMethode} Funktion Append}
\end{figure}

Innerhalb der Methode `CalculateWordAppearence` muss als erste Anweisung die Stoppuhr gestartet werden. Danach wird die Zählvariable `dlauf` deklariert und mit dem Wert `0` initiiert (\autoref{code:Initiierung}).

\begin{figure}

\lstinputlisting[basicstyle=\ttfamily, numbers=none, caption={}, title={}, label={}, language=]{06_Initiierung.cs}

\caption{\label{code:Initiierung} Deklaration für Messung}
\end{figure}

In der Do-While-Schleife in der das Tag positioniert wird, muss die Zählvariable bei jedem Durchlauf um eins erhöht werden. Am Ende der `CalculateWordAppearence`-Methode muss noch die Methode `Stopp` mit `Stopp(stoppzeit, "CalcWordAppear", dlauf);` aufgerufen werden, damit die Stoppuhr angehalten wird.

# Erweiterung des Spiralform-Verfahrens mit dem Halbierungsverfahren

Für dieses Verfahren wurde ein Performance-Test durchgeführt. Es wurde ein ca. 3 Jahre alter, handelsüblicher Desktop PC im Labor der HTW eingesetzt um Vergleichbarkeit zu einem Bürorechner herzustellen.

Mit den Ausgangswerten 0,1 für den Wachstumsfaktor und 120 Grad für die Größe der Einfügesektoren (Optisches Ergebnis s. \autoref{abb:OptTagCloudAussenen1}) ist bei Messung auf einem Notebook eine Erstellungszeit von 998 Millisekunden bei 71.321 Positionierungsversuchen im Durchschnitt herausgekommen. Diese Werte sind für eine Tag-Cloud-Erstellung in einem ERP-System ungeeignet. 

![\label{abb:OptTagCloudAussenen1} Tag-Cloud-Aussehen mit Startwerten unter zusätzlicher Nutzung des Halbierungsverfahrens](img/OptTagCloudAussenen.png)

Der Wachstumsfaktor von 0,9 und Einfügesektor von 120 Grad liefern sowohl ein ansprechendes Tag-Cloud-Aussehen (\autoref{abb:TagCloudAussehenMitOptWerten}) als auch im Durchschnitt Performancewerte von 75 Millisekunden bei 11.516 Positionierungsversuchen. 

![\label{abb:TagCloudAussehenMitOptWerten} Abbildung: Tag-Cloud-Aussehen mit optimierten Werten mit Halbierungsverfahrens](img/TagCloudAussehenMitOptWerten.png)

# Performance-Tests und Auswertung

Beim Testen verschiedener Werte des Wachstumsfaktors fällt auf, dass sich die Erstellungszeit mit größer werdendem Wachstumsfaktor bei gleicher Größe der Einfügesektoren verringert. Es liegt allerdings kein lineares Verhalten vor. Ein ähnlicher Verlauf bei den Einfügesektoren und gleichbleibendem Wachstumsfaktor ist nicht zu erkennen. Das Minimum der Positionierungsversuche schwankt sehr stark und es ist kein einfaches mathematisch erklärbares Verhalten ableitbar. 
<!-- todo: O(n) aus Algorithmus ermitteln -->

Die besten Parameterwerte die zu einem guten Tag-Cloud-Aussehen (\autoref{abb:OptTagCloudAussenen}) führen sind mit 122 Millisekunden bei 2.988 Positionierungsversuchen im Durchschnitt erreicht. 

![\label{abb:OptTagCloudAussenen} Abbildung: optimales Tag-Cloud-Aussehen](img/OptTagCloudAussenen.png)

Hierbei beträgt die Einfügesektor-Größe 30 Grad und der Wachstumsfaktor 0,9. Bei anderen Parameterwerten für Größe des Einfügesektors und Wachstumsfaktor gibt es bessere Performance-Werte, jedoch ist entweder die Platzausnutzung innerhalb des Positionierungsfensters nicht gegeben oder es gibt viele großer Lücken innerhalb der Tag-Cloud.

<!-- todo: kommt ins Fazit, am Ende der Arbeit -->
# Entscheidung zur Performance

Für die Erstellung einer Tag-Cloud mit Hilfe des Spiralform-Verfahrens wurde anhand der optischen Erscheinung und festgestellten Performance als optimale Parameter für die Einfügesektor-Größe 30 Grad und für den Wachstumsfaktor 0,9 ohne Nutzung des Halbierungsverfahrens ausgewählt.
Das liegt zum einen an der noch nicht fertiggestellten Umsetzung des Halbierungsverfahrens. Dieses sollte zum einen bei einer sauberen Implementierung bessere Durchschnittserstellungszeiten liefern. Zum anderen benötigt das normale Spiralform-Verfahren wesentlich weniger Positionierungsversuche, auf die wir ein größeres Gewicht gelegt haben. Unserer Ansicht nach sind die ungefähren 50 Millisekunden Unterschied in der Erstellungszeit vernachlässigbar. 122 Millisekunden sind für die Erstellung einer Tag-Cloud annehmbar.

<!-- todo: Wiederspruch?!, klingt nicht logisch; weniger Berechenung (ohne Halbierungsverfahren) dauert länger? -->
