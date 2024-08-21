extends CanvasLayer

signal start_game


func update_score(value: int):
	$MarginContainer/Score.text = str(value)


func update_timer(value: int):
	$MarginContainer/Time.text = str(value)


func show_message(text: String):
	$Message.text = text
	$Message.show()	
	$Timer.start()


func show_game_over():
	show_message("Game over")
	await $Timer.timeout
	$StartButton.show()
	$Message.text = "Coin dash!"
	$Message.show()


func _on_timer_timeout():
	$Message.hide()


func _on_start_button_pressed():
	$StartButton.hide()
	$Message.hide()
	start_game.emit()
