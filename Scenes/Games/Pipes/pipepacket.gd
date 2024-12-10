extends Node3D

var num1
var num2
var num3
var num4


func _process(delta: float) -> void:
	if Global.ended == true:
		get_parent().queue_free()
		
func _ready() -> void:
	Global.is_packet_instanciated = true
	var type = chose_ip_type()
	var res
	Global.is_correct = null


	if type == 0:
		res = str(generate_private_ip())
		$"../Label3D".text = res
		print(res + " esta IP es privada")
		Global.current_packet_type = "privada"

	elif type == 1:
		res = str(generate_public_ip())
		$"../Label3D".text = res
		print(res + " esta IP es pública")
		Global.current_packet_type = "publica"

	elif type == 2:
		res = str(generate_invalid_ip())
		$"../Label3D".text = res
		print(res + " esta IP es inválida")
		Global.current_packet_type = "invalida"

func generate_random_num():
	return randi_range(0, 255)

func chose_ip_type():
	return randi_range(0, 2)  # 0: privada, 1: pública, 2: inválida

func generate_private_ip() -> Array:
	var private_ip = []
	var type = randi_range(0, 2)
	if type == 0:
		private_ip = [10, generate_random_num(), generate_random_num(), generate_random_num()]
	elif type == 1:
		private_ip = [172, randi_range(16, 31), generate_random_num(), generate_random_num()]
	elif type == 2:
		private_ip = [192, 168, generate_random_num(), generate_random_num()]
	return private_ip

func is_private_ip(ip_parts: Array) -> bool:
	if ip_parts[0] == 10:
		return true
	elif ip_parts[0] == 172 and ip_parts[1] >= 16 and ip_parts[1] <= 31:
		return true
	elif ip_parts[0] == 192 and ip_parts[1] == 168:
		return true
	return false

func generate_public_ip() -> Array:
	var ip
	while true:
		ip = [generate_random_num(), generate_random_num(), generate_random_num(), generate_random_num()]
		if ip[0] > 0 and ip[0] < 224 and not is_private_ip(ip):
			return ip
	return ip

func generate_invalid_ip():
	var type = randi_range(0, 2)
	if type == 0:
		return [0, generate_random_num(), generate_random_num(), generate_random_num()]  # Dirección de red
	elif type == 1:
		return [127, generate_random_num(), generate_random_num(), generate_random_num()]  # Loopback
	elif type == 2:
		return [randi_range(224, 255), generate_random_num(), generate_random_num(), generate_random_num()]
	return # Clase D o E


func _on_area_3d_area_entered(area: Area3D) -> void:
	if area.is_in_group("PUBLICA"):
		if Global.current_packet_type == "publica":
			Global.score += randi_range(20,40)
			Global.is_correct = true
		else:
			Global.is_correct = false
	Global.is_packet_instanciated = false
	get_parent().queue_free()
	if area.is_in_group("PRIVADA"):
		if Global.current_packet_type == "privada":
			Global.score += randi_range(20,40)
			Global.is_correct = true
		else:
			Global.is_correct = false
		Global.is_packet_instanciated = false
		get_parent().queue_free()
	if area.is_in_group("INVALIDA"):
		if Global.current_packet_type == "invalida":
			Global.score += randi_range(20,40)
			Global.is_correct = true
		else:
			Global.is_correct = false
			
		Global.is_packet_instanciated = false
		get_parent().queue_free()
