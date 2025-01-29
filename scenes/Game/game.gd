class_name Game
extends Node
## Main node of the game.

## Singleton reference
static var ref : Game

## Singleton check.
func _singleton_check() -> void:
	if not ref:
		ref = self
		return
	
	queue_free()

## Contains the data to save and load
var data : Data

## Singleton check and data initialization
func _enter_tree() -> void:
	_singleton_check()
	data = Data.new()
	SaveSystem.load_data()

## Triggered when the save timer completes the loop. Save the game
func _on_save_timer_timeout() -> void:
	SaveSystem.save_data()
