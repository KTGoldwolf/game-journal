class_name JournalEntry

var Game : Game
var Notes : String

func _init(game: Game, notes: String) -> void:
	Game = game
	Notes = notes

func getGame() -> Game:
	return Game

func getNotes() -> String:
	return Notes

func saveToFile(file: File) -> void:
	#Store Game
	var gameId = Game.gameName.replace(" ", "-")
	gameId += Game.studioName.replace(" ", "-")
	file.store_line(var2str(gameId.to_lower()))
	file.store_line(var2str(Game.gameName))
	file.store_line(var2str(Game.studioName))
	#Store Notes
	file.store_line(var2str(Notes))
