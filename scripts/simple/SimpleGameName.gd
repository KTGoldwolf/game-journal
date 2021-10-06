extends Container

func initData(gameName: String) -> void:
	var gameNameLabel : Label = $GameNameContainer/GameNameLabel
	gameNameLabel.text = gameName
