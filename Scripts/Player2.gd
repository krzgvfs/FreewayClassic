extends Area2D

# A velocidade se mede por pixel por segundos.
export var speed = 100
var screen_size
# Forma de comunicação interna entre objetos.
# warning-ignore:unused_signal
signal pontua2

func _ready():
	screen_size = get_viewport_rect().size

# Função para processos continuos.
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("desce"):
		velocity.y += 1
	if Input.is_action_pressed("sobe"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else: 
		$AnimatedSprite.stop()
		
	position += velocity * delta
	
	# Não sair da tela - Clamp
	position.y = clamp(position.y,0,screen_size.y)
	
	# Tocar animações certas
	if velocity.y > 0:
		$AnimatedSprite.animation = "baixo"
	elif velocity.y < 0:
		$AnimatedSprite.animation = "cima"

func _on_Player2_body_entered(body):
	if body.name == "chegada":
		emit_signal("pontua2")
	else:
		$AudioStreamPlayer2D.play()
	
	volta()

func volta():
	position.x = 436
	position.y = 335
	
