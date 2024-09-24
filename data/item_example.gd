class_name ItemExample
extends Item

# THIS IS AN EXAMPLE - Of using single stat as a "set" to activate
var active_modifier : SingleStat
var active_modifier_2 : SingleStat

func _init():
	var ref = SingleStat.stat_id
	active_modifier = SingleStat.new(ref.MAX_HEALTH)
	active_modifier.base_adder = 7
	active_modifier.multiplier = 2
	active_modifier_2 = SingleStat.new(ref.MAX_HEALTH)
	active_modifier_2.base_adder = 17
	active_modifier_2.multiplier = 5
	pass
	
func process_modifiers(single_stat : SingleStat) -> void:
	if is_active_2(): # Do second modifier
		single_stat.combine_values(active_modifier_2)
	elif is_active(): # Do first modifier
		single_stat.combine_values(active_modifier)

func is_active():
	var entity : Entity = get_owner()
	if entity:
		return entity.stats.cur_health <= 50 # Here activates when health less than 50
	return false

func is_active_2():
	var entity : Entity = get_owner()
	if entity:
		return entity.stats.cur_health <= 30 # Here activates when health less than 30
	return false
