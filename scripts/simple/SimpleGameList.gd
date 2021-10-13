extends Control

export var GameEntryScene : PackedScene = preload("res://ui-component/simple/SimpleGameEntry.tscn")
onready var addGamePopup = $AddGameNotesPopup
onready var addGameStorePopup = $AddGameStorePopup
onready var playtimeEntryListContainer = $CenterContainer/ScrollContainer/PlaytimeEntryListContainer

func _ready() -> void:
	var journalEntryList = GameStoreText.getJournalEntryList()
	for entry in journalEntryList:
		addJournalEntryToUI(entry)
	addGamePopup.connect("AddPlaytimeEntry", self, "addNewPlaytimeEntry")
	addGameStorePopup.connect("AddGameToStore", self, "addNewGameToStore")

func addNewPlaytimeEntry(game : Game, noteText : String) -> void:
	var journalEntry = JournalEntry.new(game, noteText)
	GameStoreText.addJournalEntry(journalEntry)
	addJournalEntryToUI(journalEntry)

func addJournalEntryToUI(entry : JournalEntry):
	var gameEntryScene = GameEntryScene.instance()
	gameEntryScene.initData(entry)
	playtimeEntryListContainer.add_child(gameEntryScene)

func addNewGameToStore(newGame) -> void:
	GameStoreText.addGame(newGame)

func _on_AddGameButton_pressed() -> void:
	addGamePopup.popup_centered()

func _on_AddGameToGameStoreButton_pressed() -> void:
	addGameStorePopup.popup_centered()
