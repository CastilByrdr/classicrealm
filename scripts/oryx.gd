extends CharacterBody2D

var health=500
var player
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var child_node = $Aim
func _ready():
	player = get_node("/root/Game/Player")

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * 25
	move_and_slide()
	

func take_damage():
	health-=10
	animation_player.play("oryx_hit")
	if health<=0:
		animation_player.play("oryx_death")
		child_node.queue_free()
		
