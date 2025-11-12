extends CanvasLayer
	
@export var tutorial_text: Texture2D

func _on_texture_button_pressed() -> void:
	visible = false
	
func _ready() -> void:
	$TextureRect.texture = tutorial_text
