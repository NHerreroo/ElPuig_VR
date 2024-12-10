extends Node3D

var packet = preload("res://Scenes/Games/Pipes/PipePacket.tscn")
var time = 5

func _ready() -> void:
	Global.playercollider = false
	timer()
	
	Global.score = 0
	Global.current_packet_type
	Global.is_packet_instanciated = false
	Global.is_correct

func timer():
	while time > 0:
		await get_tree().create_timer(1).timeout
		time -= 1
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Time.text = "Tiempo: " + str(time)
	if time == 0:
		Global.ended = true
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://Scenes/main.tscn")
	if Global.is_correct == true:
		$Correct.play()
	elif Global.is_correct == false:
		$Incorrect.play()
	$SCORE.text = str("PUNTOS: " + str(Global.score))
	if Global.is_packet_instanciated == false and Global.ended == false:
		spawn_packet()


func spawn_packet():
	var ip_packet = packet.instantiate()
	ip_packet.position = $Spawner.position
	get_tree().root.add_child(ip_packet)
