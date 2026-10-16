
extends Node2D

# ==========================================
# AVATAR WORLD - TRAVEL POINT
# ==========================================

# Vùng phát hiện người chơi
@onready var interaction_area: Area2D = $InteractionArea

# Dòng chữ [E] Di chuyển
@onready var interaction_prompt: Label = $InteractionPrompt

# Giao diện chọn khu vực
@onready var travel_screen: Control = $"../TravelUI/TravelScreen"

# Nút đóng menu
@onready var close_button: Button = $"../TravelUI/TravelScreen/MenuCenter/TravelMenuPanel/MenuMargin/MenuContent/CloseButton"

# Nút chọn Thành phố
@onready var city_button: Button = $"../TravelUI/TravelScreen/MenuCenter/TravelMenuPanel/MenuMargin/MenuContent/CityButton"

# Trạng thái người chơi
var player_inside: bool = false


# ==========================================
# KHỞI TẠO
# ==========================================

func _ready() -> void:
	# Ẩn giao diện khi bắt đầu
	interaction_prompt.hide()
	travel_screen.hide()

	# Kết nối phát hiện người chơi
	interaction_area.body_entered.connect(_on_body_entered)
	interaction_area.body_exited.connect(_on_body_exited)

	# Kết nối các nút
	close_button.pressed.connect(_on_close_pressed)
	city_button.pressed.connect(_on_city_pressed)


# ==========================================
# XỬ LÝ PHÍM E
# ==========================================

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("interact") and not event.is_echo():

		if travel_screen.visible:
			travel_screen.hide()
			get_viewport().set_input_as_handled()

		elif player_inside:
			travel_screen.show()
			get_viewport().set_input_as_handled()


# ==========================================
# PLAYER VÀO VÙNG TRAVEL
# ==========================================

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		player_inside = true
		interaction_prompt.show()


# ==========================================
# PLAYER RỜI VÙNG TRAVEL
# ==========================================

func _on_body_exited(body: Node2D) -> void:
	if body.name == "Player":
		player_inside = false
		interaction_prompt.hide()
		travel_screen.hide()


# ==========================================
# NÚT ĐÓNG MENU
# ==========================================

func _on_close_pressed() -> void:
	travel_screen.hide()


# ==========================================
# NÚT THÀNH PHỐ
# ==========================================

func _on_city_pressed() -> void:
	print("Travel: Người chơi chọn Thành phố")

	travel_screen.hide()

	TravelManager.travel_to("city")
