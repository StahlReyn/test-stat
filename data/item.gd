class_name Item
extends Resource

var inventory : Inventory ## Inventory the item is in, so item can reference it

func _init():
	pass
	
func process_modifiers(_single_stat : SingleStat) -> void:
	return

func set_inventory(inventory : Inventory) -> void:
	self.inventory = inventory

func get_owner() -> Entity:
	return inventory.get_owner()
	
