extends Container

func initData(game: Game, notes: String) -> void:
	var gameNameLabel : Label = $GameNameContainer/GameNameLabel
	gameNameLabel.text = game.gameName
	var gameStudioLabel : Label = $GameNameContainer/GameStudioLabel
	gameStudioLabel.text = game.studioName
	var noteText : TextEdit = $Notes
	noteText.text = notes
