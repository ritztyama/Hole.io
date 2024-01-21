extends CSGCylinder3D

@onready var camera_3d: Camera3D = $"../../Camera3D"

const SPEED = 5.0

var tank: float = 0.0
var new_scale: Vector3 = Vector3(1,1,1)
# Called when the node enters the scene tree for the first time.
func _ready() -> void: 
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_dir = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	var direction = ( transform.basis * Vector3( input_dir.x,0,input_dir.y)).normalized()
	if direction:
		position.x += direction.x * SPEED * 0.01
		position.z += direction.z * SPEED * 0.01

	camera_3d.position = position + Vector3(0,5,3)
	scale = scale.lerp(new_scale, 10 * delta)

func _on_delete_area_falling_obj(size):
	print(size)
	tank += size
	if tank > scale.x:
		new_scale.x = scale.x * 1.1
		new_scale.y = 1.0
		new_scale.z = scale.z * 1.1
		tank = 0
