extends Area2D

@export_file("*.tscn") var target_scene: String = "res://scenes/world/city_prototype.tscn"

var changing_scene := false


func _ready() -> void:
	body_entered.connect(_on_body_entered)


func _on_body_entered(body: Node2D) -> void:
	if changing_scene:
		return

	if body.name != "Player":
		return

	changing_scene = true
	call_deferred("_change_scene")


func _change_scene() -> void:
	get_tree().change_scene_to_file(target_scene)
