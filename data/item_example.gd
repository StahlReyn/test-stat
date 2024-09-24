class_name ItemExample
extends Item

# THIS IS AN EXAMPLE - Of using single stat as a "set" to activate
var active_modifier : SingleStat
var active_modifier_2 : SingleStat
var active_modifier_3 : SingleStat

func _init():
	var ref = SingleStat.stat_id
	active_modifier = SingleStat.new(ref.MAX_HEALTH)
	active_modifier.base_adder = 7
	active_modifier.multiplier = 2
	active_modifier_2 = SingleStat.new(ref.MAX_HEALTH)
	active_modifier_2.base_adder = 17
	active_modifier_2.multiplier = 5
	active_modifier_3 = SingleStat.new(ref.ATTACK)
	active_modifier_3.base_adder = 5
	active_modifier_3.multiplier = 3
	pass

func process_modifiers(single_stat : SingleStat) -> void:
	if is_active_2(): # Do second modifier
		single_stat.combine_values(active_modifier_2)
		single_stat.combine_values(active_modifier_3)
	elif is_active(): # Do first modifier
		single_stat.combine_values(active_modifier)

func is_active() -> Variant:
	var entity : Entity = get_owner()
	if entity:
		return entity.stats.cur_health <= 50 # Here activates when health less than 50
	return false

func is_active_2() -> Variant:
	var entity : Entity = get_owner()
	if entity:
		return entity.stats.cur_health <= 30 # Here activates when health less than 30
	return false

func is_active_3() -> float:
	var entity : Entity = get_owner()
	if entity:
		var enemies_in_range: int = 0
		for enemy in entity.get_tree().get_nodes_in_group("Enemy"): # Gets all enemies in node tree
			if enemy.distance_to(enemy.global_position) > 15.0: # Checks distance of all enemies and if they're greater than 15.0
				enemies_in_range += 1
		return enemies_in_range
	else:
		return 0

