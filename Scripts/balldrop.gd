extends Marker2D

const ball_scene: PackedScene = preload("uid://dft4porwhs2c2")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("ui_accept"):
		spawn_ball()

func spawn_ball():
	randomize()
	var start_x_vel: float = randf_range(-.5, .5)
	var ball_instance = ball_scene.instantiate()
	self.add_child(ball_instance)
	ball_instance.velocity.x = start_x_vel
