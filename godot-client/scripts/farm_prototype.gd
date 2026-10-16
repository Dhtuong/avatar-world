
extends Node2D

@onready var player: CharacterBody2D = $Player
@onready var spawn_point: Marker2D = $SpawnPoint
@onready var entry_from_farm: Marker2D = $EntryFromPersonalFarm


func _ready() -> void:

	var entry: String = TravelManager.pending_entry

	# Xóa thông tin cũ sau khi nhận
	TravelManager.pending_entry = ""

	if entry == "EntryFromPersonalFarm":
		# Người chơi vừa đi bộ từ bên trong nông trại ra
		player.global_position = entry_from_farm.global_position

		print("FARM: Player đã đi ra cổng FARM")

	else:
		# Người chơi đến từ Teleport hoặc mở scene trực tiếp
		player.global_position = spawn_point.global_position

		print("FARM: Player xuất hiện tại Teleport")

	player.velocity = Vector2.ZERO
