tool
extends Beehive
class_name BehaviorTree, "root_icon.png"


export(bool) var debug: bool
var blackboard: Dictionary = {}
var contexts: Dictionary = {}

var child: Beehive


func _ready() -> void:
	child = get_child(0)


func tick(actor) -> void:
	
	var context = contexts.get(actor)
	
	if not is_instance_valid(context):
		context = Context.new()
		context.debug = debug
		context.data = blackboard
		contexts[actor] = context
	
	child.run(context)


func child_succeeded(child: Beehive, context: Context) -> void:
	pass

func child_running(child: Beehive, context: Context) -> void:
	pass

func child_failed(child: Beehive, context: Context) -> void:
	pass  


func _notification(notification: int) -> void:

	if notification == NOTIFICATION_PARENTED or notification == NOTIFICATION_UNPARENTED:
		update_configuration_warning()
		
		if get_child_count() > 0:
			child = get_child(0)


func _get_configuration_warning() -> String:

	if not get_child_count() == 1:
		return "Behavior Trees should have exactly one child"
	return ""
