extends PopupDialog

signal AddGameEntry(gameName)

onready var newEntryButton = $VBoxContainer/AddEntryButton
onready var noteInput : TextEdit = $VBoxContainer/Notes
onready var gameOptions : OptionButton = $VBoxContainer/GameOptionsInput

func _ready() -> void:
	connect("about_to_show", self, "onShow")

# called immediately before the popup is rendered
# refresh the gamelist to the latest
func onShow() -> void:
	var gameList = GameStoreText.getGameList()
	print(gameList)
	for game in gameList:
		gameOptions.add_item(game.gameName + "-" + game.studioName)

func _on_NewGameButton_pressed() -> void:
	# todo: Implement saving notes
	emit_signal("AddGameEntry", noteInput.text)
	clear()

func _on_Cancel_pressed() -> void:
	clear()

func clear() -> void:
	noteInput.text = ""
	hide()
