class_name HandlerConsciousnessCore
extends Node
## Manages Consciousness cores and related signals

## Singleton reference
static var ref : HandlerConsciousnessCore 

## Singleton check.
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	
	queue_free()

## Emmited when the consciousness cores are created
signal consciousness_core_created(quantity : int)
## Emitted when the consciousness cores are consumed
signal consciousness_core_consumed(quantity : int)

## Returning current amount of consciousness cores
func consciousness_core() -> int:
	return Game.ref.data.consciousness_core

## Create a specific amount of consciousness cores
func create_consciousness_cores(quantity : int) -> void:
	Game.ref.data.consciousness_core += quantity
	consciousness_core_created.emit(quantity)

## Consume a specific amount of consciousness cores
func consume_consciousness_cores(quantity : int) -> Error:
	if quantity > consciousness_core():
		return Error.FAILED
		
	Game.ref.data.consciousness_core -= quantity
	consciousness_core_consumed.emit(quantity)
	return Error.OK
