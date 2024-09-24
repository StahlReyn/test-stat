class_name SingleStat
extends Resource

var owner : Entity
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

func _init(id : int = 0, owner : Entity = null) -> void:
	self.owner = owner # Null owner is possible, used on its own like modifiers
	self.id = id
	self.value = 0
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

func get_modified_stat() -> SingleStat:
	if owner:
		var output_stat := SingleStat.new() # Creates a new single stat to calculate and not modify existing
		output_stat.copy_values(owner.stats.get_stat_from_id(self.id))
		if owner.inventory: # Process the entity inventory if it has it
			var item_list := owner.inventory.get_items()
			for item in item_list:
				item.process_modifiers(output_stat)
		return output_stat
	else: # If no owner then it's alone
		return self

func get_modified_value() -> float:
	return self.get_modified_stat().get_final_value()
