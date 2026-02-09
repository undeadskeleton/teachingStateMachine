extends State

class_name JumpState

func enter():
	print("Entering jumpstate")
	var character = state_machine.get_parent()
	character.velocity.y = -400
	
func physics_update(delta: float)-> void:
	var character = state_machine.get_parent()
	
	#Apply gravity
	character.velocity.y +=900 * delta
	
	#Handle horizontal movement
	var direction = Input.get_axis("ui_left","ui_right")
	character.velocity.x = direction * 200
	
	character.move_and_slide()
	
	#Return character to appropriate state when landing 
	if character.is_on_floor():
		if direction !=0:
			state_machine.change_state("movestate")
		else:
			state_machine.change_state("idlestate")
