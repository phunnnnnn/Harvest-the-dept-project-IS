extends Node

func _check_mouse(scene : SceneTree ,input : Input) :
	if Input.is_action_just_pressed("click") :
		print("%s >> just click" %[scene.name] )
		
	if Input.is_action_pressed("click") :
		print("%s >> pressed click" %[scene.name] )
	
	if Input.is_action_just_released("click") :
		print("%s >> just released click" %[scene.name] )

func _planting(target_pot:String,target_path:String,plant_type:String) :
	
	print("Globle function >> planting %s to %s (%s)" %[plant_type,target_pot,target_path])
	var pot = get_node(target_path)
	pot._plant(plant_type)
	pass

func _Event_NextDay():
	GlobleVariable.Day += 1
	print("Nextday")
	GlobleVariable.emit_signal("Event_nextday")
