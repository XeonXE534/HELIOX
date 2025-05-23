#GLOBALS
#pretty obivous what this file does lol
#Global variables and constants are defined by using the {G.} prefix in front of the variable name
class_name Global
extends Node

func _ready() -> void:
        print("GLOBALS LOADED")
        
#player vars and consts
@export var P_SPEED: float = 300.0
@export var P_JUMP_VELOCITY: float = -500.0
@export var P_GRAVITY: int = 20
@export var P_HP: int = 20
@export var P_ATK_DMG: int = 10  
@export var P_ATK_RANGE: int = 70

#slime vars and consts
@export var S_SPEED: float = 100.0
@export var S_HP: float = 200