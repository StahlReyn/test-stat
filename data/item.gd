class_name Item
extends Resource

func _init():
	pass
	
func process_modifiers(single_stat : SingleStat) -> void:
	if single_stat.id == SingleStat.stat_id.MAX_HEALTH:
		single_stat.base_adder += 3
		single_stat.multiplier += 1
	return
