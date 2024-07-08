extends Node2D

@onready var tilemap = $TileMap
@onready var under = $Under
@onready var over = $Over

func _ready():
	pass
	#create_stage()

func _process(delta):
	if Input.is_action_just_pressed("Left Click"):
		pass

func create_stage():
	var pos = Vector2(-32, 1)
	for i in range(10):
		pos.y = 1
		pos.x += 33
		for j in range(5):
			var new_under = under.duplicate()
			var new_over = over.duplicate()
			new_under.position = pos
			new_over.position = pos
			new_under.visible = true
			new_over.visible = true
			add_child(new_under)
			add_child(new_over)
			pos.y += 33

