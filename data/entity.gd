class_name Entity
extends Node2D

var stats : Stats
var inventory : Inventory

func _ready() -> void:
	# Set Stats - Example
	stats = Stats.new(self)
	stats.max_health.set_value(100)
	stats.max_mana.set_value(100)
	stats.attack.set_value(20)
	stats.defense.set_value(15)
	stats.speed.set_value(10)
	stats.recover_all()
	# Create inventory
	inventory = Inventory.new(self)
	# Add item to test
	inventory.add_item(ItemExample.new())
	pass

func _process(_delta: float) -> void:
	pass
