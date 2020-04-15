extends Node
class_name Beehive, "beehive_icon.png"


const Context := preload("context.gd")


enum Status {
	SUCCEEDED,
	RUNNING,
	FAILED
}


var is_running: bool = false


func run(context: Context) -> void:
	
	if not is_running:
		if context.debug:
			print("Starting ", name)
		
		is_running = true
		start(context)
	
	if context.debug:
		print("Updating ", name)
	
	update(context)


func start(context: Context) -> void:
	pass


func update(context: Context) -> void:
	pass


func succeed(context: Context) -> void:
	
	is_running = false
	get_parent().child_succeeded(self, context)


func fail(context: Context) -> void:
	
	is_running = false
	get_parent().child_failed(self, context)


func keep_running(context: Context) -> void:
	
	get_parent().child_running(self, context)
