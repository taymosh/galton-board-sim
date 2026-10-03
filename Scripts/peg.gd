@tool class_name Peg extends StaticBody2D

@export var collisionshape: CollisionShape2D
@export var sprite: Sprite2D
var base_size = 1

func interact():
	var tween = get_tree().create_tween()
	tween.tween_property(sprite, "scale", Vector2(base_size * 1.5, base_size * 1.5), .05)
	tween.tween_property(sprite, "scale", Vector2(base_size, base_size), .1)

func set_radius(amount: float):
	collisionshape.shape.radius = amount
	sprite.scale = Vector2(amount, amount) / 10
	base_size = amount / 10