class_name PrototypeClicker
extends View
## A clicker prototype

## Initialize the label at launch
func _ready() -> void:
	super()
	visible = true

## Add one stardust
func create_stardust() -> void:
	HandlerStardust.ref.trigger_clicker()

## Triggeret when the create stardust button is pressed
func _on_button_pressed() -> void:
	create_stardust()
