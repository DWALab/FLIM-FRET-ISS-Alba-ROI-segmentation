function[segmentation_map,num_of_labels] =  watershed_segmentation(img,bw,separation_between_seeds)

    disk = strel('disk' , separation_between_seeds);
    d = imdilate(img,disk);
    s = d == img; 
    D = bwdist(s); 
    L = watershed(D); 

    temp_map = uint16(L) .* uint16(bw); 
    C = unique(temp_map); 

    segmentation_map = zeros(size(temp_map)); 
    for i = 1:length(C)
        segmentation_map(temp_map == C(i)) = i ;
    end

 

    num_of_labels = max(max(segmentation_map));  

end