extends CharacterBody2D


@export var speed : float = 700



const SPRITE_MAP = {
	Vector2.RIGHT : preload("res://Art/PlayerSprites/PrototypeSide.png"),
	Vector2.LEFT : preload("res://Art/PlayerSprites/PrototypeSide.png"),
	Vector2.UP : preload("res://Art/PlayerSprites/PrototypeSide.png"),
}

func _process(delta):
	if velocity.length() > 0:
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
	
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "side"
		# See the note below about boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x > 0
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "down"
		$AnimatedSprite2D.flip_h = false
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_h = false
	
		

func _physics_process(_delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction.normalized() * speed
	
	move_and_slide()
