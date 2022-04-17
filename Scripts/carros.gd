extends RigidBody2D

func _ready():
	# Função para sortear cor do carro ao ser criado.
	var cordocarro = $AnimatedSprite.frames.get_animation_names()
	$AnimatedSprite.animation = cordocarro[randi() % cordocarro.size()]


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()

