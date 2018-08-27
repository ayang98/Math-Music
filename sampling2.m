function sampling2
fs=44100; %The ideal sampling frequency based on Nyquist-Shannon (2*20000) 
%This is what CD's sample at
duration=1; %use .4 for everything except the chord demo (use 4 for chord demo) 
freq=5000; %Maximum human audible frequency 
values=0:1/fs:duration;
n1=sin(2*pi*200*values);
n2=sin(2*pi*400*values);
%sound(n1/max(n1),fs);
%sound(n2/max(n2),fs);
%sound((n1+n2)/max(abs(n1+n2)),fs)
n3=sin(2*pi*600*values);
n4=sin(2*pi*800*values);
n5=sin(2*pi*1000*values);
%sound((n2+n3+n4+n5)/max(abs(n2+n3+n4+n5)),fs) %different timbre, sound quality
end

