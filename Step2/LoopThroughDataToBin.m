function LoopThroughDataToBin ()
%Created by Nehad Hirmiz 20201111
%Run this code after running "LoopThroughMultipleDataFolders"
%User inputs path to untransfected data 
untransfected_path=  'U:\FLIM-FRET (watershed)\18thNov2022_HCT116DKO_mc3BaxdcvsBakdC_vBimL_chimera\A10' ;

untransfected_measures = fullfile(untransfected_path,'Measurements.csv'); 
[untransfected_lifetime,untransfected_ratio,ch2_lower_thresh,ch2_upper_thresh] = CalculateUntransfectedLifetime(untransfected_measures) ;

%User inputs all folders to run the ROI analysis and export raw binding curve data

list_of_paths = { 'U:\FLIM-FRET (watershed)\18thNov2022_HCT116DKO_mc3BaxdcvsBakdC_vBimL_chimera\A3'
};
        

      



for i = 1:numel(list_of_paths)
    measurement_path = list_of_paths{i};
    measurement_file = fullfile(measurement_path,'Measurements.csv'); 
    output_file = fullfile(measurement_path,'Binned_Results_UThreshold3.csv');
    BinISSData(measurement_file,output_file,untransfected_lifetime,untransfected_ratio,ch2_lower_thresh,ch2_upper_thresh); 

end

fprintf('The "LoopThroughDataToBin" Analysis is complete');
end