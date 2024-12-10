extends Node3D

var packet = preload("res://Scenes/Games/TcpUdp/TcpUdpPacket.tscn")


func _ready() -> void:
	Global.playercollider = false
	Global.score = 0
	Global.is_correct = null
	
	while true:
		spawn_packet()
		await get_tree().create_timer(6).timeout
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$XRNode3D.position = Vector3(-0.136, 5.082, 3.173)
	$SCORE.text = str("PUNTOS: " + str(Global.score))



func spawn_packet():
	var ip_packet = packet.instantiate()
	ip_packet.position = $Spawner.position
	get_tree().root.add_child(ip_packet)
