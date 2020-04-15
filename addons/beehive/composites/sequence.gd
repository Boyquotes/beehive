extends Composite
class_name Sequence, "sequence_icon.png"


func child_succeeded(child, context: Context) -> void:
	
	.child_succeeded(child, context)
	
	current_child_index += 1
	
	if current_child_index < get_child_count():
		run(context)
	
	else: 
		succeed(context)


func child_failed(child, context) -> void:
	
	.child_failed(child, context);
	fail(context)
