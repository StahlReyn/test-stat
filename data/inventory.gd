class_name Inventory
extends Resource

var owner : Entity
var items : Array[Item]

func _init(owner : Entity = null):
	if owner == null:
		print("Inventory with Null owner instantiated")
	items = []
	self.owner = owner
	pass

# GETTER AND SETTERS might seem redundant here, but this allows it to be changed later
func get_items() -> Array[Item]:
	return items

func get_item_count() -> int:
	return len(items)

func get_owner() -> Entity:
	return owner

func set_owner(entity : Entity) -> void:
	owner = entity

func add_item(item : Item) -> void:
	item.set_inventory(self) # Set item inventory to this so it knows it belongs here
	items.append(item)
