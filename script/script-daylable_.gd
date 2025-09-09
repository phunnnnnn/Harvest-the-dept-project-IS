extends Label

@onready var thisScene = $"."

func _ready() -> void:
	
	pass

func _process(delta: float) -> void:
	thisScene.text = ("Day %s " %[GlobleVariable.Day])
