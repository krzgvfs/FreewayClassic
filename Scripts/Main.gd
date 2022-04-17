extends Node

const novocarro = preload("res://Scenes/carros.tscn")

var pdevagar = [275,219,160,109]
var prapido = [80,137,194,246]

var score1 = 0
var score2 = 0

func _ready():
	$tema.play()
	randomize()
	$Button.hide()

func _on_horacarrorapido_timeout():
	var carrorapido = novocarro.instance()
	add_child(carrorapido)
	carrorapido.position.x = -10
	carrorapido.position.y = prapido[randi() % prapido.size()]
	carrorapido.linear_velocity = Vector2(rand_range(350,355),0)


func _on_horacarrodevagar_timeout():
	var carrodevagar = novocarro.instance()
	add_child(carrodevagar)
	carrodevagar.position.x = -10
	carrodevagar.position.y = pdevagar[randi() % prapido.size()]
	carrodevagar.linear_velocity = Vector2(rand_range(300,325),0)
	


func _on_Player_pontua():
	if score1 < 10:
		score1 += 1
		$ponto.play()
		$placar1.text = str(score1)
	if score1 >= 10:
		$Button.show()
		$tema.stop()
		$resultado.text = "P1 Ganhou!"
		$ganhou.play()
		$horacarrodevaga.stop()
		$horacarrorapido.stop()


func _on_Player2_pontua2():
	if score1 < 10:
		score2 += 1
		$ponto.play()
		$placar2.text = str(score2)
	if score2 >= 10:
		$Button.show()
		$tema.stop()
		$resultado.text = "P2 Ganhou!"
		$ganhou.play()
		$horacarrodevagar.stop()
		$horacarrorapido.stop()


func _on_Button_pressed():
	$Button.hide()
	score1 = 0
	score2 = 0
	$placar1.text = "0"
	$placar2.text = "0"
	$resultado.text = ""
	$horacarrodevagar.start()
	$horacarrorapido.start()
	$Player.volta()
	$Player2.volta()
	$tema.play()
	
	
	
	
