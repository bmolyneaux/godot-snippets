extends Node

var _player_index = 0

func _ready():
	_add_dynamic_input()
	_fake_key_input()
	_fake_action_input()
	
func _process(delta):
	_process_input()

func _add_dynamic_input():
	# Bind keyboard key A
	var key_event = InputEventKey.new()
	key_event.scancode = KEY_A
	
	# Bind joypad button 0 for player 0
	# Input constants are defined in @GlobalScope
	var button_event = InputEventJoypadButton.new()
	button_event.device = _player_index
	button_event.button_index = JOY_BUTTON_0
	
	InputMap.add_action("action")
	InputMap.action_add_event("action", key_event)
	InputMap.action_add_event("action", button_event)

# Input is processed in a strict order:
# _input() -> Control._gui_input() -> _unhandled_input() -> CollisionObject._input_event()
# It can be consumed to not propagate to later input handling
# http://docs.godotengine.org/en/stable/tutorials/inputs/inputevent.html?highlight=_unhandled_input#how-does-it-work
func _input(event):
	if event is InputEventJoypadButton:
		if event.device == _player_index and event.button_index == JOY_BUTTON_0 and event.pressed:
			print("Joy 0 was pressed")
	elif event is InputEventKey:
		if event.scancode == KEY_A and event.pressed:
			print("A was pressed")
	
	# Consume this input event
	# SceneTree.set_input_as_handled()
	# For Control, use Control.accept_event() instead
	
	# Will never get an InputEventAction from _input(event)
	assert(!event is InputEventAction)

func _process_input():
	# Note that this function is called by _process()
	if Input.is_action_just_pressed("action"):
		print("action was pressed")

func _fake_key_input():
	var key_event = InputEventKey.new()
	key_event.scancode = KEY_A
	Input.parse_input_event(key_event)

func _fake_action_input():
	# For some reason this causes a subsequent action to be lost
	Input.action_press("action")
	
func _disable_input():
	set_process_input(false)
