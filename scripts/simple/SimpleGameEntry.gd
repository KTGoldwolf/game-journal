class_name SimpleGameEntry
extends Container

var JournalEntry : JournalEntry

func initData(journalEntry : JournalEntry) -> void:
	JournalEntry = journalEntry
	setupUi()

func setupUi() -> void:
	var gameNameLabel : Label = $GameNameContainer/GameNameLabel
	gameNameLabel.text = JournalEntry.getGame().gameName
	var gameStudioLabel : Label = $GameNameContainer/GameStudioLabel
	gameStudioLabel.text = JournalEntry.getGame().studioName
	var noteText : TextEdit = $Notes
	noteText.text = JournalEntry.Notes

func saveToFile(file: File) -> void:
	#Store Game
	file.store_line(var2str(JournalEntry.getGame().gameId.to_lower()))
	file.store_line(var2str(JournalEntry.getGame().gameName))
	file.store_line(var2str(JournalEntry.getGame().studioName))
	#Store Notes
	file.store_line(var2str(JournalEntry.Notes))
