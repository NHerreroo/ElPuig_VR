extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.playercollider = true
	Global.score = 0
	Global.ended = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("player"):
		get_tree().change_scene_to_file("res://Scenes/Games/DecimalToBinary/DecimalToBinaryGame.tscn")


func _on_area_3d_2_area_entered(area: Area3D) -> void:
	if area.is_in_group("player"):
		get_tree().change_scene_to_file("res://Scenes/Games/TcpUdp/TcpUpdGame.tscn")


func _on_area_3d_area_entered2(area: Area3D) -> void:  
	if area.is_in_group("player"):
		get_tree().change_scene_to_file("res://Scenes/Games/Pipes/PipeGame.tscn")
