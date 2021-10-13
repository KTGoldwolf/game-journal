extends Node

# Games Only! Godot 3, honor system.
var _gameList = []
const SAVE_DATA_PATH = "user://game_list.sav"

# A hack until I figure out how to do better
const _PROPERTIES_IN_GAME_OBJECT = 3

var _journalEntryList = []
const ENTRY_SAVE_DATA_PATH = "user://game_journal_entries.sav"

# A hack until I figure out how to do better
const _PROPERTIES_IN_JOURNAL_OBJECT = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	readGameListFromFile()
	readJournalFromFile()

func getGameList():
	return _gameList

func getJournalEntryList():
	return _journalEntryList

func addGame(newGame : Game) -> void:
	_gameList.append(newGame)
	saveGameListToFile()

func addJournalEntry(journalEntry : JournalEntry) -> void:
	_journalEntryList.append(journalEntry)
	saveJournalEntriesToFile()

func saveGameListToFile() -> void:
	var save_file = File.new()
	save_file.open(SAVE_DATA_PATH, File.WRITE)
	for game in _gameList:
		game.saveToFile(save_file)
	save_file.close()

func saveJournalEntriesToFile() -> void:
	var save_file = File.new()
	save_file.open(ENTRY_SAVE_DATA_PATH, File.WRITE)
	for entry in _journalEntryList:
		entry.saveToFile(save_file)
	save_file.close()

func readGameListFromFile() -> void:
	var save_file = File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):
		return
	var lines = getSaveFileLength(SAVE_DATA_PATH)
	if lines <= 0:
		return
	if lines%_PROPERTIES_IN_GAME_OBJECT != 0:
		print("WRONG NUMBER OF SAVE FILE LINES FOUND")
		return
	save_file.open(SAVE_DATA_PATH, File.READ)
	while lines > 0:
		var newId = str2var(save_file.get_line())
		var newGameName = str2var(save_file.get_line())
		var newStudioName = str2var(save_file.get_line())
		var newGameObject = Game.new(newGameName, newStudioName)
		_gameList.append(newGameObject)
		lines -= _PROPERTIES_IN_GAME_OBJECT
	save_file.close()
	
	
func readJournalFromFile() -> void:
	var save_file = File.new()
	if not save_file.file_exists(ENTRY_SAVE_DATA_PATH):
		return
	var lines = getSaveFileLength(ENTRY_SAVE_DATA_PATH)
	if lines <= 0:
		return
	if lines%_PROPERTIES_IN_JOURNAL_OBJECT != 0:
		print("WRONG NUMBER OF SAVE FILE LINES FOUND")
		return
	save_file.open(ENTRY_SAVE_DATA_PATH, File.READ)
	while lines > 0:
		var newId = str2var(save_file.get_line())
		var newGameName = str2var(save_file.get_line())
		var newStudioName = str2var(save_file.get_line())
		var newNotes = str2var(save_file.get_line())
		var newGameObject = JournalEntry.new(Game.new(newGameName, newStudioName), newNotes)
		_journalEntryList.append(newGameObject)
		lines -= _PROPERTIES_IN_JOURNAL_OBJECT
	save_file.close()

func getSaveFileLength(filePath : String) -> int:
	var save_file = File.new()
	if not save_file.file_exists(filePath):
		return 0
	save_file.open(filePath, File.READ)
	var lines = 0
	while !save_file.eof_reached():
		lines += 1
		save_file.get_line()
	# Remove one extra empty line that is written
	return lines - 1
