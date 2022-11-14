extends ColorRect

func _input(event):
	if event is InputEventMouseMotion:
		self.rect_position.x = event.position.x
		self.rect_position.y = OS.get_window_size().y / 2 - event.position.y

	if event is InputEventMouseButton:
		self.visible = event.is_pressed()

