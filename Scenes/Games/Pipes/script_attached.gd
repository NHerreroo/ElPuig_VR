extends Node3D

var num1
var num2
var num3
var num4

func _ready() -> void:
	Global.is_packet_instanciated = true
	var type = chose_ip_type()
	var res
	if type == 0:
		res = str(generate_private_ip())
		$"../Label3D".text = res
		print(res + " esta ip es privada")
		Global.current_packet_type = "privada"
		
		
	if type == 1:
		res = str(generate_public_ip())
		$"../Label3D".text = res
		print(res + " esta ip es publica")
		Global.current_packet_type = "publica"
		
	
func generate_random_num():
	var numbergenerated
	numbergenerated = randi_range(0, 255)
	return numbergenerated
	
func chose_ip_type():
	var res = randi_range(0,1)
	return res

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
