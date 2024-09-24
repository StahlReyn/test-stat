class_name Stats
extends Resource

var cur_health : float = 0
var cur_mana : float = 0
var max_health : SingleStat
var max_mana : SingleStat
var attack : SingleStat
var defense : SingleStat
var speed : SingleStat

func _init() -> void:
	var ref = SingleStat.stat_id
	max_health = SingleStat.new(ref.MAX_HEALTH)
	max_mana = SingleStat.new(ref.MAX_MANA)
	attack = SingleStat.new(ref.ATTACK)
	defense = SingleStat.new(ref.DEFENSE)
	speed = SingleStat.new(ref.SPEED)
	pass

func recover_all() -> void:
	cur_health = max_health.value
	cur_mana = max_mana.value
