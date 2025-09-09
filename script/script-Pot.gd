extends Panel
# ____       _   
#|  _ \ ___ | |_ 
#| |_) / _ \| __|
#|  __/ (_) | |_ 
#|_|   \___/ \__|

@onready var thisScene = $"."
@onready var thisSceneTextureRect = $TextureRect
@onready var thisSceneColorRect = $ColorRect

var plant : String = ""

var thisScene_parent_position : Vector2 = Vector2(0.0,0.0)
var thisScene_Real_position : Vector2

#mouse on this object
var mouse_on_this_scene : bool = false

func _ready() -> void:
	if not thisSceneTextureRect.texture :
		print("%s >> No texture >> assign default texture" %[thisScene.name] )
		#var DefaultTexture = preload("res://asset/pot/pot-default.png")
		#thisSceneTextureRect.texture = DefaultTexture 
		thisSceneTextureRect.texture = GlobleItemData.data_Pot.default.texture
		
		#if (thisScene.size.x <= GlobleVariable.dragging_selection_pos.x) && (thisScene.size.x <= GlobleVariable.dragging_selection_pos.x+thisScene.size.x) :
		#	print("enter")


func _process(delta: float) -> void:
	
	thisScene_Real_position = thisScene_parent_position + thisScene.position
	
	if GlobleVariable.DebugMode :
		thisSceneColorRect.visible = true
	else :
		thisSceneColorRect.visible = false
	
	#ย่อตัวแปร
	var pos = thisScene_Real_position
	var mousePos = GlobleVariable.dragging_selection_pos
	var mouseSize = GlobleVariable.dragging_selection_area_size
	
	if ( mousePos.x <= pos.x + thisScene.size.x ) && ( mousePos.x + mouseSize.x >= pos.x ) && ( mousePos.y + mouseSize.y >= pos.y ) && ( mousePos.y <= pos.y + thisScene.size.y )  :
		
		if not mouse_on_this_scene :
			_mouse_entered_this_scene()
		
		if GlobleVariable.selected_item_name == thisScene.name :
			thisSceneColorRect.color = Color.GREEN
		else :
			thisSceneColorRect.color = Color.YELLOW
	else :
		if mouse_on_this_scene :
			_mouse_exited_this_scene()
		thisSceneColorRect.color = Color.RED

func _mouse_entered_this_scene() :
	mouse_on_this_scene = true
	GlobleVariable.selected_item_name = thisScene.name
	GlobleVariable.selected_item_path = thisScene.get_path()
	pass

func _mouse_exited_this_scene() :
	mouse_on_this_scene = false
	if GlobleVariable.selected_item_name == thisScene.name :
		GlobleVariable.selected_item_name = ""
		GlobleVariable.selected_item_path = ""
	pass

func _plant(plant_type) :
	print("%s > planting > %s" %[thisScene.name,plant_type])
	plant = plant_type
	#thisSceneTextureRect.texture
	pass
