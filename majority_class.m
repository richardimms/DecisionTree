function majority = majority_class(set)

        %Return amount of rows.
        rows = @(x) size(x,1);
        %Initialise all the counts.
        setosaCount = 0;
        versicolor = 0;
        virginica = 0;
        
        %Loop over each value in the data set and count each 
        %of the unique classes; Setosa, Versicolor and Virginica.
        for i = 1:rows(set)
            if(strcmp(set(i,5),'setosa'))
                setosaCount = setosaCount + 1;
            elseif(strcmp(set(i,5),'versicolor')) 
              versicolor = versicolor + 1;
            elseif(strcmp(set(i,5),'virginica'))
              virginica = virginica + 1;
            end 
        end
        
        %Store the three variables in the array to determine which one has
        %the max value.
        species = [setosaCount,versicolor,virginica];
        
        [M,I] = max(species);
        
        %If the index is 1 - setossa.
        if(I == 1)
            majority = 'setosa'
        %If the index is 2 - versicolor.
        elseif(I == 2)
             majority = 'versicolor'
        %If the index is 3 - virginica.
        elseif(I == 3)
            majority = 'virginica'
        end
        
       
end 
