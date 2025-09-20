extends CanvasLayer


signal start_game
var score
var health

func _ready():
	$ScoreLabel.hide()
	$Heart.hide()
	$HP.hide()

func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()
	
func show_game_over():
	show_message(("Game Over"))
	await $MessageTimer.timeout
	
	$Message.text = "Dodge the Creeps!"
	$Message.show()
	
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()
	
func update_score(score):
	$ScoreLabel.text = str(score)

func update_level(level):
	$LevelLabel.text = "Level: " + str(level)
	
func update_health(health):
	$HP.text = str(health)

func _on_start_button_pressed() -> void:
	$StartButton.hide()
	start_game.emit()



func _on_message_timer_timeout() -> void:
	$Message.hide()
