clear all

for i = 40:20:400 %loops through frequncy
    amp=10; 
    fs=20500;  % sampling frequency
    duration=10*10;
    freq=i;
    values=0:1/fs:duration;
    a=amp*sin(2*pi* freq*values);
   
    count = 1;
    
    for j =1:200 
         vectorSamples= a(count:count+199999);
         count = count+199999; 
         
         figure
         fs = 200
         [wt, period] = cwt(vectorSamples,fs); 

         dt = 1/fs;
         Norig = fs;
         t = 0:dt:(Norig*dt)-dt;

         figure
         %imageName = strcat('norm_',num2str(count));

         imagesc(t,period, abs(wt));

         
    end
    
    
    
end





