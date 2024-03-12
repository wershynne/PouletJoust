extends MeshInstance3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
var move=0
func _process(delta):
	if Input.is_action_pressed("p1left"):
		move=0.05
		position.x-=move
		rotate_y(+move/50)
		move=0
	if Input.is_action_pressed("p1right"):
		move=0.05
		position.x+=move
		rotate_y(-move/50)
		move=0
	pass
