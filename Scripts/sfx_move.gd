extends AudioStreamPlayer


func randplay(from_position=0.0):
	randomize()
	pitch_scale = randf_range(0.8 , 1.0) 
	
	play(from_position)
