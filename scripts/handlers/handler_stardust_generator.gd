class_name HandlerStardustGenerator
extends Node
## Passivly generates Stardusts

## Singleton reference
static var ref : HandlerStardustGenerator

## Singleton check.
func _enter_tree() -> void: 
	if not ref:
		ref = self
		return
	
	queue_free()

## Reference to the generator timer
@export var timer : Timer

## Loads data
func _ready() -> void:
	if Game.ref.data.cc_upgrades.u_01_stardust_generation_level:
		timer.start()
		return
	
	HandlerCCUpgrades.ref.upgrade_leveled_up.connect(watch_for_upgrades_leveled_up)

## Triggered when the timer completes a loop
func _on_timer_timeout() -> void:
	HandlerStardust.ref.create_stardust(1)

## Waits for CCU 01 to be purchased
func watch_for_upgrades_leveled_up(upgrade : Upgrade) -> void:
	if upgrade == HandlerCCUpgrades.ref.u_01_stardust_generation:
		timer.start()
		HandlerCCUpgrades.ref.upgrade_leveled_up.disconnect(watch_for_upgrades_leveled_up)
