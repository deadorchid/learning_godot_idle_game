class_name CCU01StardustGenerator
extends Upgrade
## Unlocks the passive Stardust generation

var max_level : int = 1

func _init() -> void:
	level = Game.ref.data.cc_upgrades.u_01_stardust_generation_level
	title = "Awaken the Universe"
	base_cost = 1
	calculate_cost()

## Returns description of the upgrade
func description() -> String:
	var text : String = "Awaken the Universe to start generating Stardust."
	text += "\n[b]Effect:[/b] passive Stardust generation"
	text += "\n[b]Cost:[/b] %s Consciousness Cores" %cost
	return text

## Returns the current cost based on level and base cost
func calculate_cost() -> void:
	cost = base_cost

## Returns whether or not the player can afford buy the upgrade
func can_afford() -> bool:
	if level >= max_level:
		return false
	if Game.ref.data.consciousness_core >= cost:
		return true
	return false
	
## Consumes stardust to level up
func level_up() -> void:
	if level >= max_level:
		return
	
	var error : Error = HandlerConsciousnessCore.ref.consume_consciousness_cores(1)
	if error:
		return
	level += 1
	
	Game.ref.data.cc_upgrades.u_01_stardust_generation_level = true
	
	leveled_up.emit()
	HandlerCCUpgrades.ref.upgrade_leveled_up.emit(self)
