class_name StateMachine
extends Node


@export var _initial_state: String = ""
var _states: Dictionary[String, State] = {}
var _current_state: String = ""


#region OVERRIDES
func _ready() -> void:
	for child in get_children():
		if child is State:
			_states[child.name.to_lower()] = child
			child.transition.connect(_transition_to)
	_transition_to(_initial_state)

func _process(delta: float) -> void:
	if _current_state in _states:
		_states[_current_state].update(delta)

func _physics_process(delta: float) -> void:
	if _current_state in _states:
		_states[_current_state].physics_update(delta)
#endregion

#region PRIVATE
func _transition_to(next_state: String) -> void:
	next_state = next_state.to_lower()
	if next_state != _current_state and next_state in _states:
		if _current_state in _states:
			_states[_current_state].exit()
		
		_current_state = next_state
		
		_states[_current_state].enter()
#endregion
