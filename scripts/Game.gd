class_name Game

var id: String
var gameName: String
var studioName: String

func _init(newGameName:String, newStudioName:String) -> void:
	gameName = newGameName
	studioName = newStudioName

# psychonauts-2-double-fine
# Psychonanuts 2
# Double Fine
func saveToFile(file: File) -> void:
	var gameId = gameName.replace(" ", "-")
	gameId += studioName.replace(" ", "-")
	file.store_line(var2str(gameId.to_lower()))
	file.store_line(var2str(gameName))
	file.store_line(var2str(studioName))
