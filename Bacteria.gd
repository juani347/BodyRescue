extends RigidBody2D

export (int) var velocidad_min
export (int) var velocidad_max
var tipo_bacteria = ["grande1","chica1"]


func _ready():
	pass
	#$AnimatedSprite.animation= tipo_bacteria[randi() % tipo_bacteria.size()]

func _on_Visibilidad_screen_exited():
	queue_free()  #elimina la bacteria si se sale de la pantalla

func change_bacteria_type(type):
	tipo_bacteria=type

func select_animation(x):
	$AnimatedSprite.animation=tipo_bacteria[x]