extends PopupDialog

signal AddPlaytimeEntry(game, noteText)

onready var newEntryButton = $VBoxContainer/AddEntryButton
onready var noteInput : TextEdit = $VBoxContainer/Notes
onready var gameOptions : OptionButton = $VBoxContainer/GameOptionsInput

func _ready() -> void:
	connect("about_to_show", self, "onShow")

# called immediately before the popup is rendered
# refresh the gamelist to the latest
func onShow() -> void:
	clearForm()
	var gameList = GameStoreText.getGameList()
	print(gameList)
	for game in gameList:
		var newIndex = gameOptions.get_item_count()
		print(newIndex)
		var newGameItem = game.gameName + " - " + game.studioName
		gameOptions.add_item(newGameItem, newIndex)
		gameOptions.set_item_metadata(newIndex, game)
		print(gameOptions.get_item_metadata(newIndex))

func _on_NewGameButton_pressed() -> void:
	var selectedId = gameOptions.get_selected_id()
	emit_signal("AddPlaytimeEntry", gameOptions.get_item_metadata(selectedId), noteInput.text)
	resetForm()

func _on_Cancel_pressed() -> void:
	resetForm()

func resetForm() -> void:
	clearForm()
	hide()

func clearForm() -> void:
	noteInput.text = ""
	gameOptions.clear()
