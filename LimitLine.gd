extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	if body is Blob:
		print("starting timer as blob entered limit line")
		body.in_limit = true
		body.start_timer()

func _on_body_exited(body):
	if body is Blob:
		print("blob exiting area")
		body.timer.stop()
		body.in_limit = false
