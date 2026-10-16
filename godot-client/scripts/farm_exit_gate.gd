
extends Area2D

const FARM_SCENE := "res://scenes/world/farm_prototype.tscn"

var changing_scene: bool = false


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if changing_scene:
		return

	if body.name != "Player":
		return

	changing_scene = true

	# Ghi nhớ vị trí cần xuất hiện khi ra cổng
	TravelManager.pending_entry = "EntryFromPersonalFarm"

	print("FARM: Player đang đi ra khỏi nông trại")

	# Chuyển scene sau khi physics xử lý xong
	get_tree().call_deferred(
		"change_scene_to_file",
		FARM_SCENE
	)
