class_name State
extends Node


signal transition(to: String)


#region PUBLIC
func enter() -> void:
	transition.emit("")

func update(_delta: float) -> void:
	pass

func physics_update(_delta: float) -> void:
	pass

func exit() -> void:
	pass
#endregion
