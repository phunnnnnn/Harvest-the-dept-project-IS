extends Panel
#  ____                _   _                 
# / ___|  ___  ___  __| | | |__   __ _  __ _ 
# \___ \ / _ \/ _ \/ _` | | '_ \ / _` |/ _` |
#  ___) |  __/  __/ (_| | | |_) | (_| | (_| |
# |____/ \___|\___|\__,_| |_.__/ \__,_|\__, |
#                                      |___/ 
@onready var thisScene = $"."
@onready var thisSceneTextureRect = $TextureRect
@onready var thisSceneColorRect = $ColorRect

#seedbag data variable
var plant : String = "default"

#variable
var mouse_is_on_this_scene : bool = false

var is_dragging : bool = false
var dragging_Offset : Vector2

func _ready() -> void:
	if not thisSceneTextureRect.texture :
		print("%s >> No texture >> assign default texture" %[thisScene.name] )
		#var DefaultTexture = preload("res://asset/pot/pot-default.png")
		#thisSceneTextureRect.texture = DefaultTexture 
		thisSceneTextureRect.texture = GlobleItemData.data_Seed.default.texture

func _process(delta: float) -> void:
	
	#Dubug
	if GlobleVariable.DebugMode :
		thisSceneColorRect.visible = true
	else :
		thisSceneColorRect.visible = false
		
	if mouse_is_on_this_scene || is_dragging :
		drag_this_scene()

func drag_this_scene():
	
	if Input.is_action_just_pressed("click") :
		print("%s >> just click" %[thisScene.name] )
		if not GlobleVariable.already_dragging_item && GlobleVariable.dragging_item_name == "" :
			
			is_dragging = true
			dragging_Offset = get_global_mouse_position() - thisScene.position
			thisScene.position = get_global_mouse_position() - dragging_Offset
			
			GlobleVariable.already_dragging_item = true
			GlobleVariable.dragging_item_name = thisScene.name
			GlobleVariable.dragging_selection_area_size = thisScene.size
			GlobleVariable.dragging_selection_pos = thisScene.position
		
	if Input.is_action_pressed("click") :
		print("%s >> pressed click" %[thisScene.name] )
		if GlobleVariable.dragging_item_name == thisScene.name :
			
			thisScene.position = get_global_mouse_position() - dragging_Offset
			
			GlobleVariable.dragging_selection_pos = thisScene.position
		
	if Input.is_action_just_released("click") :
		if GlobleVariable.already_dragging_item && GlobleVariable.dragging_item_name == thisScene.name :
			
			is_dragging = false
			GlobleVariable.dragging_item_name = ""
			GlobleVariable.already_dragging_item = false
			GlobleVariable.dragging_selection_area_size = Vector2(0.0,0.0)
			GlobleVariable.dragging_selection_pos = Vector2(0.0,0.0)
			
			if GlobleVariable.selected_item_name != "" :
				#print("PLANT !!!!")
				GlobleFunction._planting(GlobleVariable.selected_item_name,GlobleVariable.selected_item_path,plant)
				thisScene.queue_free()
			
		print("%s >> just released click" %[thisScene.name] )

func _on_mouse_entered() -> void:
	print("%s >> mouse entered" %[thisScene.name] )
	mouse_is_on_this_scene = true

func _on_mouse_exited() -> void:
	print("%s >> mouse exited" %[thisScene.name] )
	mouse_is_on_this_scene = false
