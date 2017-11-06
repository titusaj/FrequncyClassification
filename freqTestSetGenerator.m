clear all

for i = 40:20:400 %loops through frequncy
    amp=10; 
    fs=20500;  % sampling frequency
    duration=10*10;
    freq=i;
    values=0:1/fs:duration;
    a=amp*sin(2*pi* freq*values);
   
    currentPath  = pwd;
    
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
                 imagesc(t,period, abs(wt));

                 folderName = strcat(num2str(i),'Hz');
                 mkdir ([folderName])
                 cd ([folderName]) 

                 imageName = strcat(num2str(i),'_',num2str(j));
                 set(gca,'XTick',[]) % Remove the ticks in the x axis!
                 set(gca,'YTick',[]) % Remove the ticks in the y axis
                 set(gca,'Position',[0 0 1 1]) % Make the axes occupy the hole figure
                 saveas(gcf,imageName,'png')
                 
                 close all
                 
                 

%                 im = imread(strcat(imageName,'.png'));
%                 im = imresize(im, [64 64]);
%                 
%                 
%                 figure
%                 imshow(im)
%                 set(gca,'XTick',[]) % Remove the ticks in the x axis!
%                 set(gca,'YTick',[]) % Remove the ticks in the y axis
%                 set(gca,'Position',[0 0 1 1]) % Make the axes occupy the hole figure
%                 
%                 saveas(gcf,imageName,'png')

            end
    
    %Change back to overall path
     cd ([currentPath])
    
    
end





