class_name Entity
extends Node2D

var stats : Stats
var inventory : Inventory

func _ready() -> void:
	stats = Stats.new()
	stats.max_health.set_value(100)
	stats.max_mana.set_value(100)
	stats.attack.set_value(20)
	stats.recover_all()
	inventory = Inventory.new(self)
	# Add item to test
	inventory.add_item(ItemExample.new())
	pass

func _process(_delta: float) -> void:
	pass
