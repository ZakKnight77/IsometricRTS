class_name VelocityComponent
extends Node2D


@export var _speed: float = 20
@export var _unit: CharacterBody2D
var _direction: Vector2 = Vector2.ZERO


#region OVERRIDES
func _physics_process(_delta: float) -> void:
	_unit.velocity = _speed * _direction
	_unit.move_and_slide()
#endregion

#region PUBLIC
func set_direction(dir: Vector2) -> void:
	_direction = dir
#endregion
