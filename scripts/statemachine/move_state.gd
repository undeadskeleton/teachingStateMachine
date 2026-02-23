extends State

class_name MoveState

func enter():
	#print("Entering movestate")
	pass
	
func physics_update(delta: float)-> void:
	var character = state_machine.get_parent()
	if !character.is_on_floor():
		character.velocity.y+=delta *980
		
	var direction = Input.get_axis("ui_right","ui_left")
	var joydir = state_machine.joystick.value
	
	if joydir.x!=0 or direction!=0:
		#print("inside :",joydir.x)
		if joydir.x:
			character.velocity.x = joydir.x * 200
			lastdir= sign(joydir.x)
		elif direction:
			character.velocity.x = -direction * 200
			lastdir=sign(direction)
	elif direction == 0 or joydir.x == 0:
		state_machine.change_state("idlestate")
		return
	
	character.move_and_slide()

func handle_input(event: InputEvent)-> void:
	if Input.is_action_just_pressed("ui_up"):
		state_machine.change_state("jumpstate")
	
