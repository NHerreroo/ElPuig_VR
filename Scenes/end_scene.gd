extends CanvasLayer


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Label.text = "Puntuación: " + str(Global.score)
	print("Puntuación: " + str(Global.score))
	if Global.ended == true:
		$Button.disabled = false
	else:
		$Button.disabled = true
	


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/main.tscn")
