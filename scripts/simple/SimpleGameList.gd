extends Control

export var GameEntryScene : PackedScene = preload("res://ui-component/simple/SimpleGameEntry.tscn")
onready var addGamePopup = $AddGameNotesPopup
onready var addGameStorePopup = $AddGameStorePopup
onready var playtimeEntryListContainer = $CenterContainer/ScrollContainer/PlaytimeEntryListContainer

func _ready() -> void:
	addGamePopup.connect("AddPlaytimeEntry", self, "addNewPlaytimeEntry")
	addGameStorePopup.connect("AddGameToStore", self, "addNewGameToStore")

func addNewPlaytimeEntry(game, noteText) -> void:
	var gameEntryScene = GameEntryScene.instance()
	gameEntryScene.initData(game, noteText)
	playtimeEntryListContainer.add_child(gameEntryScene)
	
func addNewGameToStore(newGame) -> void:
	GameStoreText.addGame(newGame)

func _on_AddGameButton_pressed() -> void:
	addGamePopup.popup_centered()

func _on_AddGameToGameStoreButton_pressed() -> void:
	addGameStorePopup.popup_centered()
