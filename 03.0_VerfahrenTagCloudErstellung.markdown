# Herangehensweisen der Tag-Cloud-Erstellung

## Anforderungen / Grundlagen vor der Tag-Cloud-Erstellung

In Vorbereitung auf die Tag-Cloud-Erstellung sollte eine bereits gefilterte Liste mit Angaben zu den jeweiligen Worthäufigkeiten vorliegen. Das Teilprojekt \enquote{Wortstammfindung} sollte als Grundlage diese gefilterte Liste erstellen. Da das Wortstammfindungs-Projekt parallel zur Implementierung startete, mussten die Studenten sich für Testzwecke eine eigene Liste schreiben. Um der Realität einer echten Tag-Cloud näherzukommen, wurde folgender Quellcode zufällige Wortausgaben generiert.
Das Tag, beziehungsweise das Wort mit der größten Häufigkeit, ist zuerst zu platzieren. Eine absteigende Sortierung nach Häufigkeit der Tags muss somit zwingend erfolgen. 
Die virtuelle Erstellung der vorgegebenen Positionierungsfläche für die Tag-Cloud folgt als nächster Schritt. Die anschließenden Schritte unterscheiden sich bei Spiralform-verfahren und \enquote{Hierarchical Bounding Boxes}-Verfahren. 

## Spiralform-Verfahren

Das erste Wort wird aus der Liste entnommen und in ein Rechteck umgewandelt. Für die Berechnung der Rechteckgröße spielen Wortlänge, Häufigkeit und maximale Schriftgröße eine zentrale Rolle. 
Passt bereits das erste Wort nicht in die Liste wird es bzw. das Rechteck solange verkleinert, bis es in das Fenster passt. Die Position des ersten Wortes ist zwingend im Zentrum des Positionierungsfensters. Jedes weitere Wort wird dann auf einer gedachten Spirale vom Zentrum des Positionierungsfensters aus abgelegt und auf Kollision geprüft. Liegt eine Kollision mit einem anderen gedachten Rechteck vor, so muss das Wort ein Stück weiter auf der gedachten Spirale verschoben werden. Ist die neue Position des Rechtecks nicht belegt, so bekommt das Rechteck diesen Platz zugewiesen. Als nächster Schritt kommt das nächste neue Wort bzw. umgewandelte Rechteck auf den nächsten neuen Punkt der Spirale. Der Positionierungsvorgang startet wieder. Dieser Schritt wird so oft wiederholt, wie Platz im Positionierungsfenster vorhanden oder eine maximale Wortanzahl vorhanden ist. 
Die Studenten haben sich für dieses Verfahren entschieden, da es einfacher zu programmieren ist als das \enquote{Hierarchical-Bounding-Boxes-Verfahren} und es gab ein Beispiel-Code - der allerdings auf Pixel und Bildern basierte - an dem sie sich orientieren konnten. 


## Hierarchical-Bounding-Boxes -Verfahren

Das erste Wort ist in diesem Verfahren nicht unbedingt mittig im Zentrum des Positionierungsfensters zu platzieren. Nachdem das erste Wort abgelegt ist, wird das Positionierungsfenster in immer kleiner werdende Rechtecke unterteilt. 

![\label{abb: HierarchicalBoundingBoxesVerfahren} Hierarchical-Bounding-Boxes-Verfahren, Aufteilung des Positionierungsfensters in Rechtecke](img/HierarchicalBoundingBoxesVerfahren.jpg)

Abbildung: 
Dazu werden Linienzüge (rote Linien in Abbildung) für die Umrandung der Rechtecke als Vektoren berechnet. Im Hintergrund entsteht dadurch eine Baumstruktur. Das nächste Wort wird in das kleinstmöglich passende und vorhandene Rechteck abgelegt. Die Berechnung der neuen Linienzüge muss erneut vor dem Einfügen des nächsten Wortes stattfinden. Ein neues Wort kann eingefügt werden. Für jedes weitere Wort wiederholen sich die letzten zwei Schritte bis entweder eine maximale Wortanzahl erreicht ist, oder kein Platz mehr im Rechteck vorhanden ist. 
Die Berechnung der Linienzüge erfordert sehr viel Rechenaufwand und die Laufzeit des Verfahrens steigt quadratisch mit der Wortanzahl an. Aus dem erst genannten Grund fällt dieses Verfahren für die Tag-Cloud-Erstellung aus. 
