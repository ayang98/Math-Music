from scipy.fftpack import fft
from scipy.io import wavfile 
import matplotlib.pyplot as plt


def wav_analyze(file_name,time_start=None,time_end=None):
	#get the array from the sound wave
	array = wavfile.read(file_name)[1]

	#check if the wave file has more than one channel
	if len(list(array.T[0])) == 1:
		data_interval = array[time_start:time_end]

	#if there are two or more channels, use the first one
	if len(list(array.T[0])) > 1:
		data_interval = array.T[0][time_start:time_end]

	#plot the time domain
	plt.plot(data_interval)
	plt.show()

	#normalize the data we have on [-1,1), based on the characteristic that the fourier transform performs a mirror image
	normalized_data = [(sample/2**8.)*2-1 for sample in data_interval]

	#calculate the fourier transform- only half needed 
	fourier_trans = fft(normalized_data)
	half_fourier_trans = fourier_trans[0:len(fourier_trans)/2]

	plt.plot((half_fourier_trans),'r') 
	plt.show()

wav_analyze('Korg.wav',1000,1200)