class_name SingleStat
extends Resource

var id : int
var value : float
var base_adder : float
var multiplier : float

enum stat_id {
	MAX_HEALTH,
	MAX_MANA,
	ATTACK,
	DEFENSE,
	SPEED
}

func _init(id = 0, value = 0) -> void:
	self.id = id
	self.value = value
	self.base_adder = 0
	self.multiplier = 1

func set_value(value : float):
	self.value = value

func copy_values(other_stat : SingleStat):
	self.id = other_stat.id
	self.value = other_stat.value
	self.base_adder = other_stat.base_adder
	self.multiplier = other_stat.multiplier
	
func combine_values(other_stat : SingleStat):
	if self.id == other_stat.id: # Combines stat only when it's same type
		self.value += other_stat.value
		self.base_adder += other_stat.base_adder
		self.multiplier *= other_stat.multiplier

func get_final_value():
	return (value + base_adder) * multiplier

func get_modified_stat(entity : Entity) -> SingleStat:
	var output_stat := SingleStat.new() # Creates a new single stat to calculate and not modify existing
	output_stat.copy_values(entity.stats.get_stat_from_id(self.id))
	if entity.inventory: # Process the entity inventory if it has it
		var item_list := entity.inventory.get_items()
		for item in item_list:
			item.process_modifiers(output_stat)
	return output_stat

func get_modified_value(entity : Entity) -> float:
	return self.get_modified_stat(entity).get_final_value()
