extends Node

var data_Pot = {
	"default": {
		"texture": preload("res://asset/pot/pot-default.png")
	},
	"planted": {
		"texture": preload("res://asset/pot/pot-planted.png")
	}
}

var data_Plant = {
	"sunflower" : {
		"texture" : {
			0 : preload("res://asset/pot/pot-planted.png"),
			1 : preload("res://asset/flower/plant-flower-01.png"),
			2 : preload("res://asset/flower/plant-flower-02.png"),
			3 : preload("res://asset/flower/plant-flower-03.png"),
			4 : preload("res://asset/flower/plant-sunflower-full.png")
		}
	}
}

var data_Seed = {
	"default": {
		"texture" : preload("res://asset/seed/seed-bag-default.png")
	}
}
