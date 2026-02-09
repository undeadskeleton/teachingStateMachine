extends State

class_name IdleState

func enter():
	print("Entering idle State")

func physics_update(delta: float)-> void:
	var character = state_machine.get_parent()
	if !character.is_on_floor():
		character.velocity.y+=delta *980
		character.move_and_slide()
	
	
func handle_input(event: InputEvent)-> void:
	if Input.is_action_just_pressed("ui_left") or Input.is_action_just_pressed("ui_right"):
		state_machine.change_state("movestate")
	if Input.is_action_just_pressed("ui_up"):
		state_machine.change_state("jumpstate")
