extends PopupDialog

signal AddGameEntry(gameName)

onready var newGameNameButton = $VBoxContainer/HBoxContainer/NewGameButton
onready var newGameNameInput : LineEdit = $VBoxContainer/HBoxContainer/NewGameNameInput

func _ready() -> void:
	pass # Replace with function body.


func _on_NewGameButton_pressed() -> void:
	if newGameNameInput.text != "":
		print("Add new game: " + newGameNameInput.text)
		emit_signal("AddGameEntry", newGameNameInput.text)
		newGameNameInput.text = ""
		hide()
