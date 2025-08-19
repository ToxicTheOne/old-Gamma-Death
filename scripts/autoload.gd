extends Node


@onready var player_max_health : float = 100
@onready var player_curremt_health : float
@onready var player_speed : int = 300
@onready var player_dash_speed : int = 1000
@onready var shoot_wait_time : float = 0.35
@onready var dash_wait_time : float = 2

const wavelenghts : Dictionary = {
	"radio" : [1],
	"microonde" : [1.5],
	"infrared" : [1.8],
	"visible" : [2],
	"ultraviolet" : [2.4],
	"x-rays": [2.7],
	"gammarays": [3]

}

var bullet_nodes : Array[PackedScene] = [
	preload("res://scenes/radiobullet.tscn"),
	
	
]
