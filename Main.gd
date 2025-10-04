extends Node

@export var mob_scene: PackedScene
var score
var health = 5

var level = 1 	#7 total levels, so scale accordingly
var seconds_elapsed = 0
var level_duration := 30      #seconds per level
var mob_speed_multiplier := 1.0
var min_mob_timer = 0.25      # do not let mob timer go under this

func _ready():
	$Player.hit.connect(_on_player_hit)

func camera_shake():
	var camera = $Camera2D
	var tween = create_tween()
	for i in range(5): # number of shakes
		var offset = Vector2(randi_range(-5, 5), randi_range(-5, 5))
		tween.tween_property(camera, "offset", offset, 0.05)
		tween.tween_property(camera, "offset", Vector2.ZERO, 0.05)

func game_over() -> void:
	$MobTimer.stop()
	$ScoreTimer.stop()
	$ScoreTimer.stop()
	$gameOverSFX.play()
	clear_mobs()
	$Player.hide()
	$GameMusic.stop()
	$HUD/ScoreLabel.hide()
	$HUD/Heart.hide()
	$HUD/LevelLabel.hide()
	$HUD/HP.hide()
	print("Game Over!")
	$HUD.show_game_over()
	

func new_game():
	score = 0
	health = 5
	level = 1
	update_hp_label()
	$HUD.update_level(level)
	$HUD.update_score(score)
	$HUD.show_message("")
	$Player.start($StartPosition.position)
	$GameMusic.play()
	$StartTimer.start()
	$HUD/ScoreLabel.show()
	$HUD/Heart.show()
	$HUD/HP.show()
	$HUD/LevelLabel.show()


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
	if(level == 1):
		$MobTimer.wait_time = 1.2
		var velocity = Vector2(randf_range(100.0, 150.0), 0.0)
		mob.linear_velocity = velocity.rotated(direction)
	if(level == 2):
		$MobTimer.wait_time = 0.9
		var velocity = Vector2(randf_range(100.0, 200.0), 0.0)
		mob.linear_velocity = velocity.rotated(direction)
	if(level == 3):
		$MobTimer.wait_time = 0.8
		var velocity = Vector2(randf_range(100.0, 250.0), 0.0)
		mob.linear_velocity = velocity.rotated(direction)
	if(level == 4):
		$MobTimer.wait_time = 0.7
		var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
		mob.linear_velocity = velocity.rotated(direction)
	if(level == 5):
		$MobTimer.wait_time = 0.6
		var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
		mob.linear_velocity = velocity.rotated(direction)
	if(level == 6):
		$MobTimer.wait_time = 0.5
		var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
		mob.linear_velocity = velocity.rotated(direction)
	if(level == 7):
		$MobTimer.wait_time = 0.4
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
	if(score%30 == 0):
		level +=1
		$HUD.update_level(level)
		
		$LevelUpSFX.play()
	if(score%50 == 0):
		health +=1
		$HealSFX.play()
		$HUD.update_health(health)
		


func _on_start_timer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()



func _on_player_hit():
	camera_shake()
	health -= 1
	update_hp_label()
	if(health <= 0):
		game_over()
	
func update_hp_label():
	$HUD/HP.text = str(health)
	
