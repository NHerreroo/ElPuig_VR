extends Node3D


var num1
var num2
var num3
var num4

func generate_random_num():
	var numbergenerated
	numbergenerated = randi_range(0, 255)
	return numbergenerated
	
func generate_ip():
	num1 = generate_random_num()
	num2 = generate_random_num()
	num3 = generate_random_num()
	num4 = generate_random_num()
	var ip_generated = str( str(num1) + "." + str(num2) +  "." + str(num3) +  "." + str(num4))
	find_ip_type()
	$"../Label3D".text = ip_generated
	return ip_generated
	
func find_ip_type():
	if num1 >= 0 and num1 <= 127:
		add_to_group("TypeA")
	elif num1 >= 128 and num1 <= 191:
		add_to_group("TypeB")
	elif num1 >= 192 and num1 <= 223:
		add_to_group("TypeC")
	elif num1 >= 224 and num1 <= 239:
		add_to_group("TypeD")
	elif num1 >= 240 and num1 <= 255:
		add_to_group("TypeE") 
		
		
func _ready() -> void:
	generate_ip()
