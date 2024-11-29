extends Node3D

var packet = preload("res://Scenes/Games/Pipes/PipePacket.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Global.is_correct == true:
		$Correct.play()
	elif Global.is_correct == false:
		$Incorrect.play()
	$SCORE.text = str("PUNTOS: " + str(Global.score))
	if Global.is_packet_instanciated == false:
		spawn_packet()


func spawn_packet():
	var ip_packet = packet.instantiate()
	ip_packet.position = $Spawner.position
	get_tree().root.add_child(ip_packet)
