extends Beehive
class_name Composite


var running_child: Beehive
var current_child_index: int = 0


func start(context: Context) -> void:
	
	running_child = null
	current_child_index = 0


func update(context: Context) -> void:
	
	if running_child == null:
		running_child = get_child(current_child_index)
	
	running_child.run(context)


func child_succeeded(child: Beehive, context: Context) -> void:
	
	running_child = null


func child_running(child: Beehive, context: Context) -> void:
	
	running_child = child
	keep_running(context)


func child_failed(child: Beehive, context: Context) -> void:
	
	running_child = null
