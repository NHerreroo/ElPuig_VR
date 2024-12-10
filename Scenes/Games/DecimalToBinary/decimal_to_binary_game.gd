extends Node3D

var decimal_num: int
var binary_combination: Array = []  # Mantendrá los valores 0 o 1 en orden
var total: int = 0

var packet = preload("res://Scenes/Games/DecimalToBinary/pickable_Packet_Binary.tscn")

func spawn_packet():
	var newpacket = packet.instantiate()
	newpacket.position = $Spawner.position
	get_tree().root.add_child(newpacket)

func _ready():
	Global.playercollider = false
	reset_game()

func reset_game():
	
	$num.text = "0"
	$num2.text = "0"
	$num3.text = "0"
	$num4.text = "0"
	$num5.text = "0"
	$num6.text = "0"
	$num7.text = "0"
	$num8.text = "0"
	
	decimal_num = get_random_decimal()
	binary_combination = [0, 0, 0, 0, 0, 0, 0, 0]  # Reinicia la combinación
	total = 0
	$DECIMAL.text = "Convierte el número: " + str(decimal_num)
	$DECIMAL2.text = "Total actual: " + str(total)

func get_random_decimal() -> int:
	return randi_range(1, 255)

# Actualiza la combinación binaria
func update_binary(index: int, value: int, area_value: int) -> void:
	spawn_packet()
	if binary_combination[index] == 0:  # Solo suma si el área no estaba ocupada
		binary_combination[index] = value
		total += area_value
		$DECIMAL2.text = "Total actual: " + str(total)

func binary_to_decimal(binary_string: String) -> int:
	var result = 0
	var length = binary_string.length()
	for i in range(length):
		var bit = binary_string[i].to_int()
		result += bit * pow(2, length - i - 1)
	return result


func _process(delta: float) -> void:
	check_combination()
	
func check_combination() -> void:
	if not Global.comprobar:
		return  # No hacer nada si comprobar no está activo

	Global.comprobar = false
	var binary_string = ""
	for bit in binary_combination:
		binary_string += str(bit)
	
	var binary_to_decimal_value = binary_to_decimal(binary_string)
	if binary_to_decimal_value == decimal_num:
		print("¡Correcto!")
		$DECIMAL2.text = "¡Correcto! Total: " + str(total)
		$Correct.play()
		reset_game()
	else:
		$Incorrect.play()
		print("Sigue intentando...")
		reset_game()

# Eventos de área
func _on_area_1_area_entered(area: Area3D) -> void:
	if area.is_in_group("paket"):
		$"Barrels/1/Area1/CollisionShape3D".disabled = true
		$num8.text = "1"
		update_binary(7, 1, 1)

func _on_area_2_area_entered(area: Area3D) -> void:
	if area.is_in_group("paket"):
		$"Barrels/2/Area2/CollisionShape3D".disabled = true
		$num7.text = "1"
		update_binary(6, 1, 2)

func _on_area_4_area_entered(area: Area3D) -> void:
	if area.is_in_group("paket"):
		$"Barrels/4/Area4/CollisionShape3D".disabled = true
		$num6.text = "1"
		update_binary(5, 1, 4)

func _on_area_8_area_entered(area: Area3D) -> void:
	if area.is_in_group("paket"):
		$"Barrels/8/Area8/CollisionShape3D".disabled = true
		$num5.text = "1"
		update_binary(4, 1, 8)

func _on_area_16_area_entered(area: Area3D) -> void:
	if area.is_in_group("paket"):
		$"Barrels/16/Area16/CollisionShape3D".disabled = true
		$num4.text = "1"
		update_binary(3, 1, 16)

func _on_area_32_area_entered(area: Area3D) -> void:
	if area.is_in_group("paket"):
		$"Barrels/32/Area32/CollisionShape3D".disabled = true
		$num3.text = "1"
		update_binary(2, 1, 32)

func _on_area_64_area_entered(area: Area3D) -> void:
	if area.is_in_group("paket"):
		$num2.text = "1"
		$"Barrels/64/Area64/CollisionShape3D".disabled = true
		update_binary(1, 1, 64)

func _on_area_128_area_entered(area: Area3D) -> void:
	if area.is_in_group("paket"):
		$num.text = "1"
		$"Barrels/128/Area128/CollisionShape3D".disabled = true
		update_binary(0, 1, 128)
