
%Lema Henry
rng default 
Fs = 2500; 
t = linspace(0,1,Fs);  
x = sin(pi*1000*t)+10*randn(size(t)); 
 
%Filtro pasa bajo 
Fs = 500;   
N  = 15;    Fc = 150;  
h  = fdesign.lowpass('N,F3dB', N, Fc, Fs); 
Hd = design(h, 'butter'); 
y1 = filter(Hd,x); 
 

plot(t,x,t,y1)  
xlim([0 0.1]) 
title('x = sin(pi*1000*t)+10*randn(size(t)')
xlabel('Tiempo (s)')  
ylabel('Amplitud')  
legend('Señal Original','Señal Filtrada')