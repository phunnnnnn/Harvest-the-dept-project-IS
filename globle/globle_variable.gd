extends Node

#DebugMode
var DebugMode : bool = false

#dragging item
var already_dragging_item : bool = false
var dragging_item_name : String = ""
var dragging_selection_Scene : StringName = ""
var dragging_selection_pos : Vector2 = Vector2(0.0,0.0)
var dragging_selection_area_size : Vector2 = Vector2(0.0,0.0)

#selected item
var selected_item_name : String = ""
var selected_item_path : String = ""
func _process(delta: float) -> void:
	
	#debug key
	if Input.is_action_just_pressed("keyboard P"):
		if not DebugMode :
			print("Globle >> DebugMode Activated")
			DebugMode = true
		else :
			print("Globle >> DebugMode UnActivated")
			DebugMode = false
