extends Action
class_name Print, "print_icon.png"


export(String) var text: String


func _update(context: Context) -> int:
	
	print(text)
	return Status.SUCCEEDED
