
function sampling
%samplingvisuals
%This function performs an array of sound demonstrations based on
%sinusoidal functions and the Nyquist-Shannon Sampling Theorem.
fs=44100; %The ideal sampling frequency based on Nyquist-Shannon (2*20000) 
%This is what CD's sample at
duration=.8; %use .4 for everything except the chord demo (use 4 for chord demo) 
freq=700; %frequency 
values=0:1/fs:duration;
%a= originalsound(100,freq,values);
a= doriginalsound(100,freq,values);
%spectrogram(a) %creates spectrogram showing time,frequency,and amplitude(dB)
sound(a,fs)
%plot(values, originalsound(5,pi,values))
%hold on
%plot(values,doriginalsound(5,pi,values))
%xlabel('Time(s)')
%ylabel('Amplitude(dB)')
%figure();
%modulatephase(1000,1432346)
c1=sin(2*pi*261.6*values);
e=sin(2*pi*329.6*values);
g=sin(2*pi*392.0*values);
c2=sin(4*pi*261.6*values);
a=sin(2*pi*440*values);
f=sin(2*pi*349.2*values);
b=sin(2*pi*493.9*values);
A={c1,e,g,c2};
tritone={f,b};
%for i=1:4
    %sound(A{i},fs)
%end
%sound((f+b)/max(abs(f+b)),fs)
end

function [output]=doriginalsound(n,f,t)
%this function produces output for the function which is the sum of
%(1/n^2)sin(n*w*t) where n is the number of component functions in the sum
%and w is the frequency. 
output=0;
for i=1:n
    output=output+(1/i^2)*sin(i*2*pi*f*t);
end
output=output/max(abs(output)); %must divide by max amplitude to normalize
end

function [output]= originalsound(n,f,t)
output=0;
for i=1:n
    output=output+2*pi*f*(1/i)*cos(i*2*pi*f*t);
end
output=output/max(abs(output)); %must divide by maximum amplitude to normalize 
end

function modulatephase(w,phi)
%This creates output of the function y=sin(w*t)+sin(2*w*t+phi) where w is
%the frequency and phi is the phase shift
fs=3000;
duration=2;
%freq=1000;
values=0:1/fs:duration;
a=sin(w*values)+sin(2*w*values+phi)+sin(3*w*values+phi);
sound(a,fs)
end

function [output]=X(n,w,t)
%this is the function which is the sum of sin(3*n*w*t)
output=0;
for i=1:n
    output=output+sin(3*i*w*t);
end
end

function [output]=Y(n,w,t)
%this is the function which is the sum of sin(4*n*w*t)
output=0;
for i=1:n
    output=output+sin(4*i*w*t);
end
end

function [output]=Z(n,w,t)
%this is the function which is the sum of sin(5*n*w*t)
output=0;
for i=1:n
    output=output+sin(5*i*w*t);
end
end


function samplingvisuals
%This provides a visual representation of the Nyquist-Shannon Sampling
%Theorem at work. You can clearly see that if the sampling frequency is
%less than 2 times the maximum frequency, the interpolation of the
%reconstructed wave will result in a huge discrepancy from the original
%sampled wave. 
f=10e3;
cycles=5;
fs=500e3;
t=0:1/fs:cycles*1/f;
x= cos(2*pi*f*t);
hold on
title('Continuous Analog Signal')
xlabel('Time')
ylabel('Amplitude')


fs1=40e3; %4 times the original frequency (very accurate)
t1=0:1/fs1:cycles*1/f;
x1= cos(2*pi*f*t1);

fs2=20e3; %2 times the original frequency (minimum required)
t2=0:1/fs2:cycles*1/f;
x2= cos(2*pi*f*t2);

fs3=15e3; %1.5 times the original frequency (not sufficient for reconstruction)
t3=0:1/fs3:cycles*1/f;
x3= cos(2*pi*f*t3);

subplot(3,1,1);
plot (t,x)
title(['Discrete Sampling: Sample Rate=',num2str(fs1),' Hz, ','Original Rate=',num2str(f),' Hz'])
xlabel('Time(s)')
ylabel('Amplitude')
hold on
stem(t1,x1);
plot(t1,x1)
hold on
subplot(3,1,2);
plot (t,x)
title(['Discrete Sampling: Sample Rate=',num2str(fs2),' Hz, ','Original Rate=',num2str(f),' Hz'])
xlabel('Time(s)')
ylabel('Amplitude')
hold on
stem(t2,x2);
plot(t2,x2)
hold on
subplot(3,1,3);
plot(t,x)
title(['Discrete Sampling: Sample Rate=',num2str(fs3),' Hz, ','Original Rate=',num2str(f),' Hz'])
xlabel('Time(s)')
ylabel('Amplitude')
hold on
stem(t3,x3);
plot(t3,x3)
end



