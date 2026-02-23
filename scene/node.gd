extends State

class_name DashState
@export var  dash_speed : float = 1000.0
@export var  dash_time : float = 0.5
var dash_timer: float = 0.0

func enter()->void:
	var char=state_machine.get_parent()
	print("Enter dash")
	var direction = Input.get_axis("ui_left","ui_right")
	if direction==0:
		print(lastdir)
		direction=lastdir
	
	char.velocity.x = dash_speed * direction 
	dash_timer=dash_time
	
func physics_update(delta: float)-> void:
	var char=state_machine.get_parent()
	
	#var direction = Input.get_axis("ui_left","ui_right")
	#
	#char.velocity.x = dash_speed * direction 
	#char.move_and_slide()
	dash_timer-=delta
	if dash_timer<=0:
		if Input.get_axis("ui_right","ui_left")!=0:
			state_machine.change_state("movestate")
		else:
			state_machine.change_state("idlestate")
