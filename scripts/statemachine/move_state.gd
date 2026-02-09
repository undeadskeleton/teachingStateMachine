extends State

class_name MoveState

func enter():
	print("Entering movestate")
	
func physics_update(delta: float)-> void:
	var character = state_machine.get_parent()
	var direction = Input.get_axis("ui_right","ui_left")
	
	if direction == 0:
		state_machine.change_state("idlestate")
		return
	
	character.velocity.x = -direction * 200
	character.move_and_slide()

func handle_input(event: InputEvent)-> void:
	if Input.is_action_just_pressed("ui_up"):
		state_machine.change_state("jumpstate") 
