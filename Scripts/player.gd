extends XROrigin3D

var xr_interface: XRInterface
var speed: float = 3.0  # Velocidad de movimiento

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	xr_interface = XRServer.find_interface("OpenXR")
 
	if xr_interface and xr_interface.is_initialized():
		print("OpenXR está funcionando")
		
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)
		get_viewport().use_xr = true
	else:
		print("OpenXR no inicializado")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !xr_interface or !xr_interface.is_initialized():
		return
	
	var input_direction: Vector3 = Vector3.ZERO
	
	# Leer inputs de los joysticks
	if Input.is_action_pressed("up"):
		input_direction.z -= 1
	if Input.is_action_pressed("down"):
		input_direction.z += 1
	if Input.is_action_pressed("left"):
		input_direction.x -= 1
	if Input.is_action_pressed("right"):
		input_direction.x += 1
	
	# Normalizar la dirección para evitar velocidades mayores en diagonal
	if input_direction.length() > 0:
		input_direction = input_direction.normalized()
	
	# Aplicar movimiento
	translate(input_direction * speed * delta)
