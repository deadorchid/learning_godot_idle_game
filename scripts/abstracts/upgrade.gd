class_name Upgrade
extends Node
## Abstract class defining an upgrade

## Emitted when the upgrade has leveled up 
signal leveled_up 

## Level of the upgrade
var level : int = -1
## Title of "name" the upgrade
var title : String = "Title Not defined"
## Base cost of the upgrade
var base_cost : int = -1
## Current cost of the upgrade
var cost : int = -1

## Virtual class, must be overwritten.[br]
## Returns description of the upgrade
func description() -> String:
	return "Description not defined"
	
## Virtual class, must be overwritten.[br]
## Returns the current cost based on level and base cost
func calculate_cost() -> void:
	printerr("calculate cost() method not defined")
	cost = -1

## Virtual class, must be overwritten.[br]
## Returns whether or not the player can afford buy the upgrade
func can_afford() -> bool:
	return false	
	
## Virtual class, must be overwritten.[br]
## Consumes stardust to level up
func level_up() -> void:
	printerr("level up() method not defined ")
