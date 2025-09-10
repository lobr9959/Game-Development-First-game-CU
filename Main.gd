extends Node

@export var mob_scene: PackedScene
var score
var health = 5

func _ready():
	$Player.hit.connect(_on_player_hit)

func game_over() -> void:
	$MobTimer.stop()
	clear_mobs()
	$Player.hide()
	$GameMusic.stop()
	$HUD/ScoreLabel.hide()
	$HUD/Heart.hide()
	$HUD/HP.hide()
	print("Game Over!")
	$HUD.show_game_over()
	

func new_game():
	score = 0
	health = 5
	update_hp_label()
	$HUD.update_score(score)
	$HUD.show_message("")
	$Player.start($StartPosition.position)
	$GameMusic.play()
	$StartTimer.start()
	$HUD/ScoreLabel.show()
	$HUD/Heart.show()
	$HUD/HP.show()


func _on_mob_timer_timeout():
	# Create a new instance of the Mob scene.
	var mob = mob_scene.instantiate()

	# Choose a random location on Path2D.
	var mob_spawn_location = $MobPath/MobSpawnLocation
	mob_spawn_location.progress_ratio = randf()

	# Set the mob's position to the random location.
	mob.position = mob_spawn_location.position

	# Set the mob's direction perpendicular to the path direction.
	var direction = mob_spawn_location.rotation + PI / 2

	# Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction

	# Choose the velocity for the mob.
	var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = velocity.rotated(direction)

	# Spawn the mob by adding it to the Main scene.
	add_child(mob)
	mob.add_to_group("mobs")

func clear_mobs():
	for mob in get_tree().get_nodes_in_group("mobs"):
		mob.queue_free()

func _on_score_timer_timeout() -> void:
	score += 1
	$HUD.update_score(score)


func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()



func _on_player_hit():
	health -= 1
	update_hp_label()
	if(health <= 0):
		game_over()
	
func update_hp_label():
	$HUD/HP.text = str(health)
	
