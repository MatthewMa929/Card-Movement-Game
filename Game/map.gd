extends Node2D

@onready var tilemap = $TileMap	
@onready var under = $Under
@onready var over = $Over
@onready var y_offset = 10
@onready var cell_size = 32

func _ready():
	pass
	#create_stage()

func _process(delta):
	if Input.is_action_just_pressed("Left Click"):
		var mouse_vectori = create_vectori(get_global_mouse_position())
		if tilemap.get_cell_atlas_coords(0, mouse_vectori) == Vector2i(1, 0):
			tilemap.set_cell(0, mouse_vectori, 0, Vector2i(0, 0))

func create_vectori(vector):
	if vector.y < y_offset:
		return Vector2i(-1, -1)
	return Vector2i(vector.x/cell_size, (vector.y-y_offset)/cell_size)

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

