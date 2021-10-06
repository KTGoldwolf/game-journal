class_name Game
var gameName: String
var studioName: String

func _init(newGameName:String, newStudioName:String) -> void:
	gameName = newGameName
	studioName = newStudioName

func toJson():
	var jsonDict = "{\"gameName\": \""
	jsonDict += gameName
	jsonDict +="\",\"studioName\": \""
	jsonDict += studioName
	jsonDict += "\"}"
	return jsonDict
