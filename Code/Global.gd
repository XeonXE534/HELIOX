#GLOBALS
#pretty obivous what this file does lol
#Global variables and constants are defined by using the {G.} prefix in front of the variable name
class_name Global
extends Node

func _ready() -> void:
        print("GLOBALS LOADED")
        
#player vars and consts
@export var P_SPEED = 300.0
@export var P_JUMP_VELOCITY = -500.0
@export var P_GRAVITY = 20
@export var P_HP = 20
@export var P_ATK_DMG = 10  
@export var P_ATK_RANGE = 70

#slime vars and consts
@export var S_SPEED = 100.0 
@export var S_HP = 200