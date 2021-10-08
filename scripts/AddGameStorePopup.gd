extends PopupDialog

signal AddGameToStore(newGame)

onready var newGameNameInput : LineEdit = $VBoxContainer/GameStoreNameInput
onready var newGameStudioInput : LineEdit = $VBoxContainer/GameStoreStudioInput

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_NewGameButton_pressed() -> void:
	if newGameNameInput.text != "":
		if newGameStudioInput.text != "":
			var newGame = Game.new(newGameNameInput.text, newGameStudioInput.text)
			emit_signal("AddGameToStore", newGame)
			clear()

func _on_CancelButton_pressed() -> void:
	clear()

func clear() -> void:
	newGameNameInput.text = ""
	newGameStudioInput.text = ""
	hide()
