extends Node

class_name State
#Reference to StateMachine
var state_machine: StateMachine

#Virtual methods that child states can override

func enter()-> void:
	#for initialization
	pass

func update(delta: float)-> void:
	#for frame update and animation
	pass

func physics_update(delta: float)-> void:
	#for movement update
	pass

func handle_input(event: InputEvent)-> void:
	#for handle player input
	pass

func exit()-> void:
	#cleanup when exiting 
	pass
