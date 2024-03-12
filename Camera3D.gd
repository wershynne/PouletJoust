extends Camera3D

# Adjustable parameters
var bob_speed = 0.1
var sway_speed = 0.01
var bob_threshold = 0.03
var sway_threshold = 0.05

# Internal variables
var original_position
var frame_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Store the original position of the camera
	original_position = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Increment frame count
	frame_count += 1

	# Bobbing motion along the Y-axis
	var bob_amount = sin(frame_count * bob_speed) * bob_threshold
	var new_y = original_position.y + bob_amount

	# Swaying motion along the X-axis
	var sway_amount = sin(frame_count * sway_speed) * sway_threshold
	var new_x = original_position.x + sway_amount

	# Update the camera position
	position.x = new_x
	position.y = new_y
	print(position.z)
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("p1speedup"):
		bob_speed*=1.4
		sway_speed*=1.4
		bob_threshold*=1.4
		sway_threshold*=1.4
	if Input.is_action_just_released("ui_up") or Input.is_action_just_released("p1speedup"):
		bob_speed/=1.4
		sway_speed/=1.4
		bob_threshold/=1.4
		sway_threshold/=1.4
	#all camera fov stuff for zooming below
	if Input.is_action_pressed("ui_up") or Input.is_action_pressed("p1speedup"):
		position.z-=0.01
	if Input.is_action_pressed("p1slowdown") and Input.is_action_pressed("ui_down"):
		position.z+=0.03
	if position.z<2.5:
		position.z=2.51
	if position.z>4:
		position.z=3.9

