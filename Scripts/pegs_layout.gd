@tool
extends Node2D

const peg_scene: PackedScene = preload("uid://ckyfl55s5ml8k")

## Amount of pegs in last row.
@export_range(3, 16, 1) var peg_count: int = 16
## Radius of pegs.
@export_range(1, 100, 1) var peg_radius: int = 10
## Amount of space between pegs.
@export_range(5, 150, 1) var peg_gap: int = 75
@export_tool_button("Generate", "Play") var generate_button = generate_layout

func _ready() -> void:
	generate_layout()

func generate_layout():
	prints("Generating with options:", peg_count, peg_radius, peg_gap)
	delete_children()
	const start_peg_count: int = 3
	var y: int = 0
	for rows in range(start_peg_count, peg_count+1):
		for peg in rows:
			var offset = peg_gap * rows / 2 - (peg_gap/2)
			var peg_instance = peg_scene.instantiate()
			self.add_child(peg_instance)
			peg_instance.owner = get_tree().edited_scene_root
			peg_instance.set_radius(peg_radius)
			peg_instance.position.x = peg * peg_gap - offset
			peg_instance.position.y = y
			peg_instance.unique_name_in_owner = true
			peg_instance.name = "Peg"
		y += peg_gap

	var linear_count = remap(peg_count, 3, 16, 0, 1)
	var y_offset = lerp(-100, -450, linear_count)
	%balldrop.position.y = y_offset - 100
	self.position.y = y_offset
	%Camera2D.zoom = lerp(Vector2(1, 1), Vector2(.5, .5), linear_count)

func delete_children():
	for node in self.get_children():
		node.queue_free()
