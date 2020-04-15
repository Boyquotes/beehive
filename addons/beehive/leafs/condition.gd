extends Leaf
class_name Condition, "condition_icon.png"


func _update(context: Context) -> int:
	
	 return Status.SUCCEEDED if _evaluate(context) else Status.FAILED


func _evaluate(context: Context) -> bool:
	
	assert(false)
	return false
