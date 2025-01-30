class_name ConsciousnessCoreLabel
extends Label
## Displays the current amount of consciousness core available

## Connecting signals
func _ready() -> void:
	update_text()
	HandlerConsciousnessCore.ref.consciousness_core_created.connect(update_text)
	HandlerConsciousnessCore.ref.consciousness_core_consumed.connect(update_text)

## Updates the label text to match the current amount of consciousness cores in storage
func update_text(_quantity : int = -1) -> void:
	text = "Consciousness cores: %s" %Game.ref.data.consciousness_core
