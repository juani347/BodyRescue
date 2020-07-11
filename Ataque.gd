extends Area2D #Tutorial_Part4 ==> UKfzBnfh4Ak

var speed=50
var steer_force=0
var velocity = Vector2()
var acceleration = Vector2()
var target = null

func start(_position, _direction, _target=null):
	position = _position
	rotation = _direction.angle()
	velocity = _direction * speed
	target = _target

func seek():
	var desired = (target.position - position).normalized() * speed
	var steer = (desired - velocity).normalized() * steer_force
	return steer

func _process(delta):
	if target:
		acceleration += seek()
		velocity += acceleration * delta
		velocity = velocity.clamped(speed)
		rotation = velocity.angle()
	position += velocity * delta

func explode():
	set_process(false)
	velocity = Vector2()
	$Sprite.hide()
	$Explosion.show()
	$Explosion.play("smoke")

func _on_Lifetime_timeout():
	explode()

func _on_Explosion_animation_finished():
	queue_free()
