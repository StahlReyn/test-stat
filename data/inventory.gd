class_name Inventory
extends Resource

var items : Array[Item]

func _init():
	items = []
	pass
	
func get_items() -> Array[Item]:
	return items

func get_item_count() -> int:
	return len(items)

func add_item(item : Item) -> void:
	items.append(item)
