class_name Stats
extends Resource

var owner : Entity
var cur_health : float = 0
var cur_mana : float = 0
var max_health : SingleStat
var max_mana : SingleStat
var attack : SingleStat
var defense : SingleStat
var speed : SingleStat

func _init(owner : Entity = null) -> void:
	self.owner = owner
	var ref = SingleStat.stat_id
	max_health = SingleStat.new(ref.MAX_HEALTH, owner)
	max_mana = SingleStat.new(ref.MAX_MANA, owner)
	attack = SingleStat.new(ref.ATTACK, owner)
	defense = SingleStat.new(ref.DEFENSE, owner)
	speed = SingleStat.new(ref.SPEED, owner)
	pass

func recover_all() -> void:
	cur_health = max_health.value
	cur_mana = max_mana.value

# THIS IS NOT THE BEST WAY TO DO IT, MORE OF PLACEHOLDER METHOD
func get_stat_from_id(id : int) -> SingleStat:
	var ref = SingleStat.stat_id
	match id:
		ref.MAX_HEALTH:
			return max_health
		ref.MAX_MANA:
			return max_mana
		ref.ATTACK:
			return attack
		ref.DEFENSE:
			return defense
		ref.SPEED:
			return speed
	return null
	
