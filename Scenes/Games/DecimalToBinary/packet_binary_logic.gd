extends Node3D



func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("areaDecimal"):
		get_parent().queue_free()

func _process(delta: float) -> void:
	if Global.ended == true:
		get_parent().queue_free()
