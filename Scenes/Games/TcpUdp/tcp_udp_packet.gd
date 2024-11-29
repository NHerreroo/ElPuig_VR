extends Node3D

var tcp_clues = [
	# Fiabilidad y Confirmación
	"Entrega garantizada.",
	"Requiere confirmación del receptor.",
	"Confirmación ACK",
	"Sin confirmación, no continúa.",
	"El mensaje debe llegar.",

	# Orden y Control
	"Llega en el mismo orden en que se envió.",
	"Reensamblado para estar en secuencia.",
	"Requiere control de flujo.",
	"Controla cuántos datos se envían simultáneamente.",

	# Conexión
	"Se establece una conexión antes de enviar datos.",
	"Handshake completado (SYN-ACK).",
	"Espera hasta que ambos lados estén listos.",
	"La conexión debe ser establecida primero.",

	# Ejemplos comunes de uso
	"HTTP/HTTPS",
	"SMTP",
	"POP3/IMAP",
	"FTP",
	"SSH o Telnet.",

	# Casos avanzados
	"Fragmentos que deben ser reensamblados.",
	"Mantiene la conexión hasta que se completa la transferencia.",
	"El receptor pide retransmisión si el paquete se pierde.",
	"Diseñado para evitar sobrecargas en la red."
]

var udp_clues = [
	# Velocidad y Simplicidad
	"Entrega rápida, sin confirmación.",
	"No espera a que el receptor responda.",
	"Es más importante la velocidad que la fiabilidad.",
	"Llega en cualquier orden.",
	"No importa si algunos datos se pierden.",

	# Tiempo Real
	"Optimizado para datos en tiempo real.",
	"Ideal para transmisiones de audio o video.",
	"Perfecto para juegos en línea.",
	"Los datos fluyen continuamente, incluso si hay errores.",
	"Prefiere velocidad sobre precisión.",

	# Sin conexión
	"No necesita establecer una conexión.",
	"Enviado directamente al destino.",
	"Sin handshake previo.",
	"No verifica si el receptor está listo.",

	# Ejemplos comunes de uso
	"Streaming en vivo",
	"Llamadas VoIP",
	"Gaming online",
	"DNS",
	"Protocolo SNMP",

	# Casos avanzados
	"Paquetes independientes, sin seguimiento.",
	"No hay control de flujo.",
	"El receptor no puede pedir una retransmisión.",
	"Ideal para tráfico masivo en multicast."
]

func chose_tcp_or_udp():
	var type = randi_range(0,1) #0 tcp / 1 udp
	return type
	

func get_random_clue(type: int):
	var clue
	var i
	if type == 0: #tcp
		i = randi_range(0,tcp_clues.size())
		print(tcp_clues[i])
	elif type == 1:
		i = randi_range(0,udp_clues.size())
		print(udp_clues[i])

	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_random_clue(chose_tcp_or_udp())
