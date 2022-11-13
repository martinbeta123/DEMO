extends KinematicBody2D

var speed:int = 200 
var Jump:int = 500
var gravity:int = 800
var vel:Vector2 = Vector2()
var grounded:bool = false
onready var sprite = $Sprite

func _physics_process(delta):
	vel.x = 0
	if Input.is_action_pressed("ui_left"):
		vel.x -= speed
	if Input.is_action_pressed("ui_right"):
		vel.x += speed
	vel = move_and_slide(vel,Vector2.UP)
	vel.y += gravity * delta
	if Input.is_action_pressed("ui_up") and is_on_floor():
		vel.y -= Jump

func _on_Finish_body_entered(body):
	get_tree().change_scene("res://WinScreen.tscn")
	pass
