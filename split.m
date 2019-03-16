function [setA,setB] = split(set,index,threshold)
   
    %Theshold Array
    setA=[];
    %Non-Threshold Array
    setB=[];
    %Loop Over the entire set
    for i = 1:size(set,1)
        %If splitting a cell use {}, if splitting a matrix use ()
        %Decide to go left.
        if set{i,index} < threshold
            %push to threshold array
            setA = vertcat(setA,set(i,:));
        %If the value at the given index is greater than/equal to the
        %threshold.
        %Decide to go right.
        elseif set{i,index} >= threshold
            %push to non-threshold array
            setB = vertcat(setB,set(i,:));
        end
    end
    
end
