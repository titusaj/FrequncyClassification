function freqSignalToWaveImages(PathName)
 
    wav_files = dir([PathName filesep '*.wav']);

    for i =  1 : length(wav_files)
            [data, Fs ]  = audioread([PathName filesep wav_files(i).name]);
              
            
             %filter data
                        filter_order = 4;
                        cutoff_low_f = 35;
                        cutoff_high_f = 410;


                        [b_low,a_low] = butter( filter_order, 2*cutoff_low_f/Fs  ,'high');
                        filtered_data = filtfilt(b_low, a_low, data);

                        [b_low,a_low] = butter( filter_order, 2*cutoff_high_f/Fs  ,'low');
                        filtered_data = filtfilt(b_low, a_low, filtered_data);

                        filtered_data = filtered_data/max(abs(filtered_data));

                       
          
    
                            
                            Fs = 20000; 
                            [wt, period] = cwt(filtered_data,Fs); 

                             dt = 1/Fs;
                             Norig = Fs;
                             t = 0:dt:(Norig*dt)-dt;

                             figure
                             %imageName = strcat('norm_',num2str(count));

                             imagesc(t,period, abs(wt));
                             
    end   
end