extends Composite
class_name Selector, "selector_icon.png"


func child_succeeded(child: Beehive, context: Context) -> void:
	
	.child_succeeded(child, context)
	succeed(context)


func child_failed(child: Beehive, context: Context) -> void:
	
	.child_failed(child, context);
	
	current_child_index += 1
	
	if current_child_index < get_child_count():
		run(context)
	
	else:
		fail(context)
