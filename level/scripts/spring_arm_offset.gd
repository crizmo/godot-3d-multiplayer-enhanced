extends Node3D
class_name SpringArmCharacter

const MOUSE_SENSIBILITY: float = 0.005

@export_category("Objects")
@export var _spring_arm: SpringArm3D = null

func _unhandled_input(_event) -> void:
	if (_event is InputEventMouseMotion) and is_multiplayer_authority():
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):  # Check if the right mouse button is pressed
			rotate_y(-_event.relative.x * MOUSE_SENSIBILITY)
			_spring_arm.rotate_x(-_event.relative.y * MOUSE_SENSIBILITY)
			_spring_arm.rotation.x = clamp(_spring_arm.rotation.x, -PI/4, PI/24)
