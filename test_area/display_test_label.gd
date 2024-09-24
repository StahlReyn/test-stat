extends Label

@onready var entity : Entity = $".."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	text = (
		"ITEM COUNT: " + str(entity.inventory.get_item_count()) + "\n" +
		"ATTACK: " + str(entity.stats.attack.get_modified_value(entity)) + "\n" +
		"MHP: " + str(entity.stats.max_health.get_modified_value(entity)) + "\n" +
		"HP: " + str(entity.stats.cur_health)
	)
	pass
