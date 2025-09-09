extends GridContainer

@onready var thisScene = $"."

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	for child in thisScene.get_children():
		if "thisScene_parent_position" in child :
			child.thisScene_parent_position = thisScene.position

func _grow_garden() :
	for child in thisScene.get_children():
		if child.planted:
			child.grow()
