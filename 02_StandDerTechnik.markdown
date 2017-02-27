
# Die Filter im ERP-System

Das noch in Entwicklung befindliche ERP-System\footnote{\href{https://github.com/twdes/}{https://github.com/twdes/}}, der Firma TecWare, besitzt aktuell drei Filter:

1. *Kategoriefilter*:     Dieser Filter ist verantwortlich für die Auswahl nach sogenannten Kategorien, wie z.B. Auftrag und Artikel.
2. *Subfilter*: Mit Hilfe dieses Filters, können innerhalb der Kategorien sogenannte Unterkategorien ausgewählt werden. Ein Beispiel hierfür wäre das Filtern nach der Unterkategorie Kunde oder Lieferant, innerhalb der Kategorie Kontakt.
3. *Volltextfilter*: Anhand dessen kann der Nutzer ein Textfragment eingeben.


# Entwicklungsvoraussetzungen

Um an dem ERP-System arbeiten zu können, sind folgende Voraussetzungen für die Entwicklungsumgebung gegeben:

* Microsoft Windows 8.1 oder neuer
* Microsoft Visual Studio 2015
* Microsoft SQL Server 2016 -- LocalDB
* Microsoft SQL Server Managementstudio 2016
* TortoiseGit (oder ein Git-Client der Wahl, muss Externals/Submodules unterstützen)
* SQLite Datenbank Viewer (z.B. [DB Browser for SQLite](http://sqlitebrowser.org/))  

# Arbeitsmittel

Zur Verwaltung des Quellcodes wird aufgrund des bestehenden Projektes der Firma TecWare *Git* und als Hoster für die Repositories *GitHub*\footnote{Projekt-Repository: \href{https://github.com/SemAhto/Projektdokumentation}{https://github.com/SemAhto/Projektdokumentation}} verwendet.

Zur Verwaltung der Aufgaben wurde am ersten Termin *Trello*\footnote{\href{https://trello.com/}{https://trello.com/}} festgelegt. Damit sind Notizen für alle Teilnehmer auch mobil erreichbar und auch für Ungeübte im Umgang mit Git zugänglich.

Im Raum A111 stand uns ein Rechner mit Möglichkeit zur Installation des ERP neben der Entwicklungsumgebung bereit. Dieser wurde insb. durch die Aufgaben zum Textmining auch via Remote Desktop (RDP) genutzt, die Entwicklung in C# auf lokalen Maschinen u.a. im Laborbereich oder dem eigenen Notebook leichter zu handhaben ist.

<!--

Entsprechend GitHub wurde Markdown\footnote{Einfache Markupsprache von John Gruber: \href{daringfireball.net/projects/markdown/}{daringfireball.net/projects/markdown/}} für die Dokumentation ausgewählt.
Bei zeitnaher Dokumentation der einzelnen Vorgänge lassen sich so die abzugebenden Dokumente vergleichbar ad-hoc über Pandoc in LaTeX umwandeln und abgabebereit aufbereiten.

-->
