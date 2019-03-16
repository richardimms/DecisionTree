function [information_gain, column_split, value_split,species] = maxSplit(set)

            set_information  = [];
            %Over each column (4 columns)       
            for c = 1:4
                %Over each value within that column.
                unique_values = unique(cell2mat(set(:,c)),'rows');
                %Loop over the unique values.
                for v = 1:length(unique_values)
                    %Find the threshold variable.
                    threshold = unique_values(v,:);
                    %disp(threshold);
                    %Split using the threshold varibable and column index.
                    [setA,setB] = split(set,c,threshold);
                    %Compute the information gain.
                    information_gain = improvement(set,setA,setB);
                    %Create the set_infomration matrix with the gain,
                    %variable,value and species.
                    set_information = [set_information; information_gain,c,unique_values(v)];
                end  
            end
        
        %get first column then do max.
        gain_column = set_information(:,1);
        %Find the max value and the index.
        [M,I] = max(gain_column(:,1));
        %Create the final split values using index I
        information_gain = M;
        %Convert the cells to matrices and get the specific values.
        column_split = set_information(I,2);
        value_split = set_information(I,3);
end