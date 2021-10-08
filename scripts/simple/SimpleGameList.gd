extends Control

export var SimpleGameName : PackedScene = preload("res://ui-component/simple/SimpleGameName.tscn")
onready var addGamePopup = $AddGamePopup
onready var addGameStorePopup = $AddGameStorePopup
onready var gameNameListContainer = $CenterContainer/ScrollContainer/GameNameListContainer

func _ready() -> void:
	addGamePopup.connect("AddGameEntry", self, "addNewGame")
	addGameStorePopup.connect("AddGameToStore", self, "addNewGameToStore")

func addNewGame(newGameName) -> void:
	var newGame = SimpleGameName.instance()
	newGame.initData(newGameName)
	gameNameListContainer.add_child(newGame)
	
func addNewGameToStore(newGame) -> void:
	GameStoreText.addGame(newGame)

func _on_AddGameButton_pressed() -> void:
	addGamePopup.popup_centered()

func _on_AddGameToGameStoreButton_pressed() -> void:
	addGameStorePopup.popup_centered()
