extends State

class_name DashState
@export var dash_speed : float = 700.0
@export var dash_time : float = 0.3
var dash_timer : float = 0.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func enter()-> void:
	print("Enter dash")
	var character = state_machine.get_parent()
	var direction = Input.get_axis("ui_right","ui_left")
	var joydir=state_machine.joystick.value
	if direction==0:
		direction=lastdir
	character.velocity.x=direction*dash_speed
	if joydir.x==0:
		joydir.x = lastdir
	character.velocity.x=joydir.x*dash_speed
	character.move_and_slide()
	
	dash_timer=dash_time
	
func physics_update(delta: float)-> void:
	dash_timer-=delta
	if dash_timer<=0:
		if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
			state_machine.change_state("movestate")
		else:
			state_machine.change_state("idlestate")
