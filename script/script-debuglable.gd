extends Label

func _ready() -> void:
	visible = false
	pass

func _process(delta: float) -> void:
	
	if GlobleVariable.DebugMode :
		visible = true
	else :
		visible = false
	
	text = "Debug Mode > %s
			already_dragging_item > %s
			dragging_selection_Scene > %s
			dragging_selection_pos > %s
			dragging_selection_area_size > %s
			select pot name > %s
			select pot path > %s
		" %[
			GlobleVariable.DebugMode,
			GlobleVariable.already_dragging_item,
			GlobleVariable.dragging_selection_Scene,
			GlobleVariable.dragging_selection_pos,
			GlobleVariable.dragging_selection_area_size,
			GlobleVariable.selected_item_name,
			GlobleVariable.selected_item_path
		]
	pass
