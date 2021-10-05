extends Control

export var SimpleGameName : PackedScene = preload("res://ui-component/simple/SimpleGameName.tscn")
onready var addGamePopup = $AddGamePopup
onready var gameNameListContainer = $CenterContainer/ScrollContainer/GameNameListContainer

func _ready() -> void:
	addGamePopup.connect("AddGameEntry", self, "addNewGame")

func addNewGame(newGameName) -> void:
	var newGame = SimpleGameName.instance()
	newGame.initData(newGameName)
	gameNameListContainer.add_child(newGame)

func _on_AddGameButton_pressed() -> void:
	addGamePopup.popup_centered()
