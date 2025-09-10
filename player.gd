extends Area2D
signal hit

@export var speed = 400
var screen_size
var can_be_hit = true


func _ready():
	screen_size = get_viewport_rect().size
	hide()
	
func _process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "Walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$AnimatedSprite2D.animation = "Up"
		$AnimatedSprite2D.flip_v = velocity.y > 0



func _on_body_entered(body: Node2D) -> void:
	if(can_be_hit):
		hit.emit()
		can_be_hit = false
		$HitTimer.start() # give i-frames
		$HitSound.play() 
		$AnimatedSprite2D.modulate = Color(1, 0, 0)
		$CollisionShape2D.set_deferred("disabled", true)

func _on_hit_timer_timeout() -> void:
	can_be_hit = true
	$CollisionShape2D.set_deferred("disabled", false)
	$AnimatedSprite2D.modulate = Color(1, 1, 1)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
