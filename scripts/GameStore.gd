extends Node

var _gameList = []

#Save to appdata/roaming/godot/project-name
const SAVE_DATA_PATH = "user://game_list.json"

func _ready() -> void:
	readGameListFromFile()
	
func addGame(newGame : Game):
	# don't add game if an exact match is already in the list
	for game in _gameList:
		if newGame.gameName == game.gameName:
			return
	var newGameDict = {
		"gameName": newGame.gameName,
		"studioName": newGame.studioName
		}
	_gameList.append(newGameDict)
	saveGameListToFile()

func getGameList():
	return _gameList

# File Functions
func saveGameListToFile() -> void:
  #var json_string = to_json(_gameList)
	var json_string : String = "["
	var first = true
	for game in _gameList:
		if not first:
			json_string += ","
		json_string += JSON.print(game)
		#json_string += game.toJson()
		first = false
	json_string += "]"
	var save_file = File.new()
	save_file.open(SAVE_DATA_PATH, File.WRITE)
	save_file.store_line(json_string)
	save_file.close()

func readGameListFromFile() -> void:
	var save_file = File.new()
	if not save_file.file_exists(SAVE_DATA_PATH):
		return
	save_file.open(SAVE_DATA_PATH, File.READ)
	var savedGameListData = JSON.parse(save_file.get_as_text())
	_gameList = savedGameListData.result
