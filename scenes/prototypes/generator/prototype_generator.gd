class_name PrototypeGenerator
extends View
## Generating and creating stardusts every second

## Reference to the button starting generation
@export var button : Button
## Reference to the timer
@export var timer : Timer

## Init the label
func _ready() -> void:
	super()
	visible = false
	
## Creates stardust  and store it
func create_stardust() -> void:
	HandlerStardust.ref.create_stardust(1)

## Starts the timer and disable the button
func begin_generating_stardust() -> void:
	timer.start()
	button.disabled = true

## Triggered when the "start generating" button is pressed
func _on_button_pressed() -> void:
	begin_generating_stardust()

## Triggered when the timer times out
func _on_timer_timeout() -> void:
	create_stardust()
