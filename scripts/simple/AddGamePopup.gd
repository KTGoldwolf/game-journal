extends PopupDialog

signal AddGameEntry(gameName)

onready var newGameNameButton = $VBoxContainer/HBoxContainer/NewGameButton
onready var newGameNameInput : LineEdit = $VBoxContainer/HBoxContainer/NewGameNameInput
onready var gameOptions : OptionButton = $VBoxContainer/GameOptionsInput

func _ready() -> void:
	connect("about_to_show", self, "onShow")

# called immediately before the popup is rendered
# refresh the gamelist to the latest
func onShow() -> void:
	var gameList = GameStore.getGameList()
	print(gameList)
	for game in gameList:
		gameOptions.add_item(game.gameName + "-" + game.studioName)

func _on_NewGameButton_pressed() -> void:
	if newGameNameInput.text != "":
		print("Add new game: " + newGameNameInput.text)
		emit_signal("AddGameEntry", newGameNameInput.text)
		newGameNameInput.text = ""
		hide()
