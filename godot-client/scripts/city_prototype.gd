extends Node2D

# Nhân vật trong City
@onready var player: CharacterBody2D = $Player

# Vị trí xuất hiện khi vào City
@onready var spawn_point: Marker2D = $SpawnPoint


func _ready() -> void:
	# Đưa Player đến SpawnPoint khi City được tải
	player.global_position = spawn_point.global_position

	# Đảm bảo Player không còn vận tốc cũ
	player.velocity = Vector2.ZERO

	print("CITY: Đã tải thành công")
	print("CITY: Player xuất hiện tại ", player.global_position)
