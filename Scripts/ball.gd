extends CharacterBody2D

@onready var line_renderer: Line2D = $Line2D

func _ready() -> void:
	update_line()
	line_renderer.default_color = Color.ROYAL_BLUE

var frame_count: int = 0

func _physics_process(delta: float) -> void:

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	#if (self.global_position.x - 0) > 25 or (self.global_position.x - 0) < -25 and is_grounded():
	#	var drag_dir = sign(0 - self.global_position.x)
	#	velocity.x += drag_dir * 0.05
	
	var collision = move_and_collide(velocity)
	if collision:
		var collider = collision.get_collider()
		if collider is Peg:
			collider.interact()
		if velocity.length() > 1:
			velocity = velocity.bounce(collision.get_normal()) * .5
			create_bounce_ghost()
		if is_grounded():
			velocity.y -= 2.5

	if self.global_position.y > 1000:
		die()
	
	frame_count += 1
	if frame_count % 10 == 0:
		update_line()

func is_grounded():
	return is_zero_approx(velocity.x) and is_zero_approx(velocity.y)

func update_line():
	if line_renderer:
		line_renderer.add_point(self.global_position)

func create_bounce_ghost():
	var ghost = $Sprite2D.duplicate()
	ghost.global_position = self.global_position
	line_renderer.add_child(ghost)
	ghost.modulate = Color.ROYAL_BLUE
	ghost.modulate.a = 0.5

func die():
	var tween = get_tree().create_tween()
	tween.tween_property(line_renderer, "modulate", Color(0, 0, 0, 0), 1)
	tween.finished.connect(queue_free)
