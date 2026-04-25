extends Area2D

@onready var game_manager: Node = %game_manager

func _on_body_entered(body: Node2D) -> void:
	#check garee haddi collection uu qaatay si loga hortago marku u dhawado in qarsoomo collectionka 
	if(body.name == "player"):
		queue_free()
		game_manager.add_points ()
