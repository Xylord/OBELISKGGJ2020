extends Node2D


onready var spectrum = AudioServer.get_bus_effect_instance(0,0)

#range of frequency e.g. if definition = 10 from 0 to 20khz there will be a frequency of 2khz x 10 definition. 
var definition= 20
var total_width = 200
var total_height = 100

#full range audible to human ear
var min_freq = 20
var max_freq = 20000

#These values are for visualizing drums as frequency range = [0,250] hz
#var min_freq = 0
#var max_freq = 250

#Modern songs should be within the range of -24db to -48db however older song might be lower
#Pumped up kicks from FTP is at - 40db to -72db. Make adjustments as you see fit
export(float) var max_db = -16
export(float) var min_db = -90

#!!!!!!!!!!!GET THIS ARRAY FOR FREQUENCY!!!!!!!!!!!!!!!!!!!
# Note: histogram[i] represent a freqency inside a certain interval
# Note: histogram.length = definition
var histogram =[] 

export(float) var accel = 5
func _ready():
	#reset the volume db, will not affect adjustment made prior.
	max_db += get_parent().volume_db
	min_db += get_parent().volume_db
	
	for i in range(definition):
		histogram.append(0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var freq = min_freq
	var interval = (max_freq-min_freq)/definition
	
	for i in range(definition):
		
		var freqrange_low = float(freq-min_freq)/float(max_freq-min_freq)
		freqrange_low = freqrange_low * freqrange_low * freqrange_low * freqrange_low #to power of 4
		freqrange_low = lerp(min_freq,max_freq,freqrange_low)
		
		freq+=interval
		
		var freqrange_high = float(freq-min_freq)/float(max_freq-min_freq)
		freqrange_high = freqrange_high * freqrange_high * freqrange_high * freqrange_high
		freqrange_high = lerp(min_freq,max_freq,freqrange_high)
		
		var mag = spectrum.get_magnitude_for_frequency_range(freqrange_low,freqrange_high)
		mag = linear2db(mag.length())
		#narrows the song frequency to its max and min range
		mag = (mag - min_db)/(max_db - min_db) 
		#apply a sloping to frequency to equalize them
		mag += 0.3 * (freq-min_freq) / (max_freq - min_freq)
		
		#clamp the value of the magnitude so it doesnt got off the charts
		mag = clamp(mag,0.02,1)
		
		histogram[i] = lerp(histogram[i], mag, accel*delta)

		
	update()
		
func _draw():
	var draw_pos = Vector2(0,0)
	var w_interval = total_width/definition
	
	#create maximum height line
	draw_line(Vector2(0,-total_height),Vector2(total_width,-total_height),Color.chocolate,2.0,true)
	
	for i in range(definition):
		draw_line(draw_pos,draw_pos + Vector2(0,-histogram[i]*total_height),Color.chocolate,4.0,true)
		draw_pos.x +=w_interval
		
