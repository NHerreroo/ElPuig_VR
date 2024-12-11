extends Node3D

var packet = preload("res://Scenes/Games/TcpUdp/TcpUdpPacket.tscn")

var time = 15
var speed = 6

func timer():
	while time > 0:
		await get_tree().create_timer(1).timeout
		time -= 1
		
func _ready() -> void:
	Global.ended = false
	timer()
	Global.playercollider = true
	$Viewport2Din3D.visible = false
	Global.playercollider = false
	Global.score = 0
	Global.is_correct = null
	
	while Global.ended == false:
		spawn_packet()
		await get_tree().create_timer(speed).timeout
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$tiempo.text = str(time)
	$XRNode3D.position = Vector3(-0.136, 5.082, 3.173)
	$SCORE.text = str("PUNTOS: " + str(Global.score))
	if time <= 0:
		Global.ended = true
		$Viewport2Din3D.visible = true
	if time < 60:
		speed = 3.5
	if time < 120:
		speed = 5.5
func spawn_packet():
	var ip_packet = packet.instantiate()
	ip_packet.position = $Spawner.position
	get_tree().root.add_child(ip_packet)
