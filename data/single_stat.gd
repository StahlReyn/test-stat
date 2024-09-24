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
	self.value += other_stat.value
	self.base_adder += other_stat.base_adder
	self.multiplier *= other_stat.multiplier

func get_final_value():
	return (value + base_adder) * multiplier
