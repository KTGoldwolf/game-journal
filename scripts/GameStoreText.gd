extends Node

# Games Only! Godot 3, honor system.
var _gameList = []
const SAVE_DATA_PATH = "user://game_list.sav"
# A hack until I figure out how to do better
const _PROPERTIES_IN_GAME_OBJECT = 3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	readGameListFromFile()

func getGameList():
	return _gameList

func addGame(newGame : Game):
	_gameList.append(newGame)
	saveGameListToFile()

func saveGameListToFile() -> void:
	var save_file = File.new()
	save_file.open(SAVE_DATA_PATH, File.WRITE)
	for game in _gameList:
		game.saveToFile(save_file)
	save_file.close()

func readGameListFromFile() -> void:
	var save_file = File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):
		return
	var lines = getSaveFileLength()
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
		lines -= 3
	save_file.close()

func getSaveFileLength() -> int:
	var save_file = File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):
		return 0
	save_file.open(SAVE_DATA_PATH, File.READ)
	var lines = 0
	while !save_file.eof_reached():
		lines += 1
		save_file.get_line()
	# Remove one extra empty line that is written
	return lines - 1
