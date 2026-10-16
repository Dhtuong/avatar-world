
extends Node

# Danh sách các khu vực đã được tạo
const MAPS = {
	"city": "res://scenes/world/city_prototype.tscn"
}

var is_traveling: bool = false
var pending_entry: String = ""


func travel_to(map_id: String) -> void:
	if is_traveling:
		return

	if not MAPS.has(map_id):
		push_warning("Khu vực chưa được tạo: " + map_id)
		return

	var scene_path: String = MAPS[map_id]

	if not ResourceLoader.exists(scene_path):
		push_error("Không tìm thấy map: " + scene_path)
		return

	# Không load lại map đang đứng
	if get_tree().current_scene != null:
		if get_tree().current_scene.scene_file_path == scene_path:
			return

	is_traveling = true
	_change_scene.call_deferred(scene_path)


func _change_scene(scene_path: String) -> void:
	var error := get_tree().change_scene_to_file(scene_path)

	is_traveling = false

	if error != OK:
		push_error("Chuyển khu vực thất bại: " + scene_path)
