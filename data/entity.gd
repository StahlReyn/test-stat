class_name Entity
extends Node2D

var stats : Stats
var inventory : Inventory

func _ready() -> void:
	stats = Stats.new()
	stats.max_health.set_value(100)
	stats.max_mana.set_value(100)
	stats.recover_all()
	inventory = Inventory.new(self)
	# Add item to test
	inventory.add_item(ItemExample.new())
	pass

func _process(_delta: float) -> void:
	pass

func get_max_health() -> float:
	var output_stat := SingleStat.new() # Creates a new single stat to calculate
	output_stat.copy_values(stats.max_health)
	var item_list := inventory.get_items()
	for item in item_list:
		item.process_modifiers(output_stat)
	return output_stat.get_final_value()
