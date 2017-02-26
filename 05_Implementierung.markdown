# Implementierung
## WordCloud-Komponente
### Beschreibung
Ein Ziel des Projektes war es, die berechneten Folksonomien mit Hilfe einer WordCloud zu visualisieren. Dieser Mechanismus sollte anschließend in das bestehende PPSn Softwaresystem der Firma Tecware integriert werden. Um eine hohe Flexibiltät und Wiederverwendbarkeit zu erreichen wurde die Berechnung und Visualierung der WordCloud in einem Paket gekapselt.   
### Aufbau
#### Contract
In diesem Teil wird die Schnittstelle für die Verwendung in anderen Projekten definiert. Das `IWord`-Interface stellt die kleinste Einheit der WordCloud dar. Die implementierende Klasse muss eine Text-Property anbieten die das anzuzeigende Wort als String beinhaltet. Das `IWeightedWord`-Interface erweitert `IWord` um einen beliebig Gewichtswert. Es stellt eine Schnittstelle für die Eingabedaten dar. Die `VisualizedWord`-Klasse implementiert `IWord` und stellt das Ergebnis, welches aus der Berechnung der Visualierung entsteht, dar. Es enthält alle wichtigen Parameter, die für eine Darstellung in dem Panel wichtig sind. Die `Range` Klasse stellt einen Zahlenbereich dar und kann relative Werte zu einem anderen Zahlenbereich berechnen. 

#### WordCloudCalculator
Der WordCloudCalculator wandelt die übergebenen, gewichteten Wörter des Typs `IWeightedWord` in anzeigbare Wörter des Typs `VisualizedWord` anhand von Rahmenbedingungen, die durch die Bereiche der Freiheitsgrade (Schriftgröße und Transparenz), der Größe des Anzeigefensters und einer Methode zur Berechnung der Anzeigegröße eines Wortes, dargestellt werden.
Die Schnittstelle für die Rahmenbedingungen ist in `IWordCloudAppearenceArguments` festgelegt. Die Schnittstelle für die Implementierung eines WordCloudCalculators ist in `IWordCloudCalculator` festgelegt.

\autoref{abb:WordCloudContractClasses}

![\label{abb:WordCloudContractClasses} Klassen im Contract der WordCloud](img/WordCloud_Contract_Classes.jpg)


Eine Möglichkeit wurde in `ExtractingWordCloudCalculator` implementiet.
Dieser besitzt eine weitere Methode vom Typ `IWordAppearenceCalculationMethod`, die ein gewichtetes Wort als Eingabe bekommt und dieses in eine visualisiertes Wort umwandelt. Der Calculator an sich sortiert die Gewichte der übergeben gewichteten Wörter zuerst absteigend und übergibt dann jedes einzelne Wort solange der Umwandlungsmethode bis diese signalisiert, dass kein Wort mehr auf den anzeigbaren Bereich passt. Zum Schluss werden die anzeigbaren visualisierten Wörter zurückgegeben.

Mit Hilfe dieser Klasse war es Möglich verschiede Methoden der Anordnung auszuprobieren. Die `SimpleAppearenceCalculationMethod` ordenet die ersten 5 Wörter diagonal untereinander an und dient als Einstieg für die Erforschung neuer Methoden. Die `SpiralAppearenceCalculationMethod` ordnet die Wörter in der bereits beschriebenen Spiralform an. 

#### WordCloudControl
Das WordCloudControl hat die Aufgabe, die von dem WordCloudCalculator berechneten Wortvisualisierungen in einem Benutzersteuerelement auf dem Bildschirm darzustellen. Die `WordCloud`-Klasse ist dabei das zentrale Element der Komponete. Sie wird im Layout der Software an der gewünschten Stelle platziert. Die Klasse enthält Definitionen für die Übergabe der gewichteten Wortliste, die Rahmenbedingungen für die Visualisierung, eines Kommandos, das Ausgeführt wird wenn ein Wort ausgewählt wird und den Positionierungsmethodentyp für den ExtractingWordCloudCalculator. In der `WordCloudGui.xaml` befindet sich die Viewdefinition der WordCloud. Die WordCloud besteht aus einem ItemsControl, welches die Möglichkeit bietet eine Liste mit Datenobjekten zu binden und anzuzeigen. Dabei wurde ein sogenanntes MultiBinding eingesetzt, um auch bei Veränderung der Größe der Anzeigefläche die WordCloud neu zu berechnen. Durch das Überschreiben des ItemTemplates wurde die visuelle Darstellung eines Wortes als Button-Steuerelement definiert, woran die berechneten Freiheitsgradparameter und das Klickkommando angebunden wurden. Desweiteren wurde das ItemsPanel mit dem neu erstellten WordCloudPanel überschrieben, welches die Größe und Position der einzelnen Wörter auf der Anzeigefläche festlegt.

Zur Unterstützung wurden die Helferklasse `CommandProxy` implementiert, welche die Übergabe einer Kommandoinstanz von den Datenkontext des Muttercontrols an den Datenkontext eines Kindcontrols ermöglicht.

Desweiteren wurde in der `WordSizeCalculatorFactory` eine statische Methode entwicklet, welche anhand von Parametern (Schriftart, Rahmenbreite, Außenabstand, Innenabstand) eine Methode erzeugt, die anhand eines Strings und der Schriftgröße dessen benötigte Anzeigefläche berechnet. Diese Helferklasse ist für die Definiton der Darstellungsrahmenbedingungen gedacht.

### Verteilung
#### Nuget
Da diese Komponente wie bereuts ewähnt wiederverwendbar ist, wurde für den für C# entwickelten Paketmanager ein Paket erstellt und auf nuget https://www.nuget.org/packages/WordCloudCalculator veröffentlicht.

#### Verwendung
Um diese Komponente in einem neuen Projekt zu verwenden, musst das Paket per nuget hinzugefügt werden. Um das mit der Package Manager Console zu erledigen muss folgendes eingegeben werden:
```
Install-Package WordCloudCalculator
```
Wenn das Paket dann erfolgreich installiert wurde, muss das Interface `IWordCloudAppearenceArguments` implementiert, um die Rahmenbedingungen für die Darstellung festzulegen und als Statische Ressource instanziert werden.
```
<Window.Resources>
      <wordCloud:SomeWordCloudAppearenceArguments x:Key="AppearenceArguments" />
</Window.Resources>
```
Außerdem muss in der `App.xaml` folgendes `RessourceDictionary` zu `Application.Resources` hinzugefügt werden, um die Styles der WordCloud der neuen Applikation bekannt zu machen:
```
<ResourceDictionary Source="/WordCloudCalculator;component/WPF/WordCloudGui.xaml"/>
```
Nun kann das WordCloudControl in das Layout eingefügt werden
```
<wpf:WordCloud 
          AppearenceArguments="{StaticResource AppearenceArguments}"
          Words="{Binding Tags}"
          WordAppearenceCalculationMethodType="extractingWordCloudCalculator:SpiralAppearenceCalculationMethod"
          WordSelectedCommand="{Binding SelectTag}" 
          />
```


## Implementierung im PPSn System
### Beschreibung
Das PPSn System der Firma TechWare ist eine Client-Server ERP-Lösung für kleine und mittelständige Unternehmen. Es ist eine OpenSource Neuentwicklung der schon bestehenden ERP Lösung.

Im Hintergrund arbeitet eine Lua Interpreter Engine, mit der sich, alternativ zu C#, das System erweitern lässt.

Eine Neuerung im System ist die Nutzung einer TagCloud zur unscharfen Suche in der Datenbank. 

\autoref{abb:PpsnScreenshot}

![\label{abb:PpsnScreenshot} PPSn Softwaresystem](img/ppsn_screenshot.jpg)



### Layout

Die Benutzeroberfläche besteht aus einer Objektliste, in der alle Datensätze der Datenbank angezeigt werden. Diese können mit Filtern, welche um dieser List platziert sind verkleinert werden. Anhand dieser Liste wird die TagCloud berechnet. Durch die Auswahl eines Tags wird eine neue Filterbedingung hinzugefügt und sodass die Objektliste aktualisiert wird und so die TagCloud neu berechnet. Durch diesen iterativen Prozess ist eine Suche anhand von Schlagworten möglich.

\autoref{abb:PpsnLayout}

![\label{abb:PpsnLayout} Layout von PPsn: Beeinflussungsübersicht. Dunkelgrau: Filterelemente; Hellgrau: Datenpräsentation](img/ppsn_layout.jpg)
### Integration der WordCloud Komponente
Um die WordCloud mit den Tags zu befüllen musste das PPSn System erweitert werden.

Aufgrund der sehr komplexen Systemarchitektur, wird im Folgenden nur auf die Teile des Systems eingegangen in denen Änderungen vorgenommen wurden.
#### Komponenten

Das `PPsEnvironment` enthält den `PpsObjectGenerator`, welcher in der Lage ist SQL zu erzeugen und das Ergebnis als `IEnumerable` bereitzustellen, sodass es mit LINQ weiter verarbeitet werden kann. Da allerdings der bestehende Generator nicht in der Lage war Tags abzufragen und deren Gewichte zu berechnen, musste ein weiterer entwickelt werden. Um die Basisfunktionalität aber beizubehalten, wurde dieser zu `AbstractPpsObjectGenerator` abstrahiert und ohne Änderung wieder von `PpsObjectGenerator` abgeleitet um das Interface zu äbhängigen Komponenten nicht zu ändern. Die `AbstractPpsObjectGenerator` Klasse wurde um zwei virtuelle Methoden erweitert. `ExtendCommand` dient dazu, dass abgeleitete Klassen das Kommando über die Factory erweitern können. Durch Implementierung von `GenerateCommandSql` hingegen muss das gesamte Kommando als String neu implementiert werden.
Für die TagCloud wurde dann der neue `WordCloudObjectGenerator` eingeführt, welcher die in Relastion stehenden Tags und deren Gewichte wie im Prototypen berechnet und abfragt.

\autoref{abb:PpsObjectGenerator}

![\label{abb:PpsObjectGenerator} PpsObjectGenerator](img/PpsObjectGenerator.jpg)

Um das generieren des SQL Strings zu vereinfachen und ein nachträgliches Erweitern zu ermöglichen wurde die `SelectStatementFactory` entwickelt. Sie enthält Methoden, die die einzelnen Teile einer Select Abfrage unabhängig von einander aufnimmt und zum Schluss zusammenführt. 

\autoref{abb:SelectStatementFactory}

![\label{abb:SelectStatementFactory} SelectStatementFactory](img/SelectStatementFactory.jpg)

Das ViewModel ist das `PpsNavigatorModel`. Es sind folgende Komponenten hinzugekommen

|Name              |Funktion                                                                                                                                     |
|------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
|Tags              |Beinhaltet alle in Relation stehenden Tags                                                                                                   |
|SelectedTags      |Beinhaltet alle Tags nach denen gefiltert werden soll                                                                                        |
|SelectTagCommand  |Wird ausgeführt, wenn in der TagCloud auf ein Tag geklickt wird. Fügt dieses der SelectTags Liste hinzu.                                     |
|UnselectTagCommand|Wird ausgeführt, wenn auf ein Tag in der Liste der ausgewählten Tags geklickt wird. Entfernt dieses aus der SelectedTags Liste               |
|TagFilter         |Generiert ein ExpressionObjekt, welches vom System in einen logischen Ausdruck umgewandelt wird und so zur Filterung der Objektliste beiträgt|

\autoref{abb:PpsNavigatorModel}

![\label{abb:PpsNavigatorModel} PpsNavigatorModel](img/PpsNavigatorModel.jpg)

#### Abläufe

Im Folgenden wird beschrieben wie die Daten für die WordCloud geladen werden.

\autoref{abb:AblaufPpsEnvironment}

![\label{abb:AblaufPpsEnvironment} Daten laden](img/AblaufPpsEnvironment.jpg)


Durch den Aufruf der zentralen Datenladefunktion `RefreshDataAsync` werden die Daten in die Objektliste geladen. Dabei wird der Tagfilter anhand der ausgewählten Tags generiert (3) und mit den bereits existierenden Filter mit `und` verknüpft. Die daraus entstehenden `DataSource` wird genutzt, um die in Relation stehenden Tags zu laden. Dafür wird im `PpsEnvironment` die `CreateTagCloudFilter` Methode gerufen, welche ein `WordCloudObjectGenerator`-Objekt erstellt und das daraus resultierende `IEnumerable` zurückgibt (5-8). Anschließend werden mit LINQ die benötigten Tagdaten aus dem `IEnumerable` Ergebnis extrahiert und der `Tags`-Property zugewiesen (9). Dadurch wird die WordCloud neu erstellt.

Zusätzlich zu den bereits vorhandenen Aufrufen von `RefreshDataAsync`, wird diese Method nun auch ausgeführt, wenn ein Tag dem Filter hinzugefügt oder vom Filter entfernt wird. 

\autoref{abb:Pps_SelectTag}

![\label{abb:Pps_SelectTag} Ablauf: Tag auswählen](img/image18.jpg)

\autoref{abb:Pps_UnselectTag}

![\label{abb:Pps_UnselectTag}Ablauf: Tag aus Auswahl entfernen](img/AblaufPpsNavigatorModel.jpg)


<!-- 

![\label{abb:} ](img/.jpg)

![\label{abb:} ](img/.jpg)

-->
