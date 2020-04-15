extends Beehive
class_name Leaf, "action_icon.png"


func update(context: Context) -> void:
	
	match _update(context):
		Status.SUCCEEDED:
			succeed(context)
		Status.FAILED:
			fail(context)
		Status.RUNNING:
			keep_running(context)
		_:
			assert(false)


func _update(context: Context) -> int:
	
	assert(false)
	return 0
