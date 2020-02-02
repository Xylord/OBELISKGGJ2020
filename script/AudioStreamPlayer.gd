extends AudioStreamPlayer


#export(float) var amplitude
#export(float) var bufferLength
#export(float) var fft_size

#var player 

func _ready():
#	var player = AudioStreamPlayer.new()
#	self.add_child(player)
#	self.stream = load("res://asset/Sounds/Home.wav")
	self.play()

func _process(delta):
	#print(self.stream)
	#print(get_playback_position())
	#print(get_stream_playback())
	#print(AudioEffectSpectrumAnalyzer.new().get_buffer_length())
	#print(AudioEffectSpectrumAnalyzer.new().get_tap_back_pos())
	pass
