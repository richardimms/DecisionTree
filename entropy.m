function returnEntropy = entropy(dataSet)

        %Return amount of rows.
        rows = @(x) size(x,1);
        %Initialise all the counts.
        setosaCount = 0;
        versicolor = 0;
        virginica = 0;
        
        %Loop over each value in the data set and count each 
        %of the unique classes; Setosa, Versicolor and Virginica.
        for i = 1:rows(dataSet)
            if(strcmp(dataSet(i,5),'setosa'))
                setosaCount = setosaCount + 1;
            elseif(strcmp(dataSet(i,5),'versicolor')) 
              versicolor = versicolor + 1;
            elseif(strcmp(dataSet(i,5),'virginica'))
              virginica = virginica + 1;
            end 
        end
        
        %Calculate probability of each occuring
        setosa_P = setosaCount ./ rows(dataSet);
        versicolor_P = versicolor ./ rows(dataSet);
        virginica_P = virginica ./ rows(dataSet);
        
        %Shannon's Entropy Calculation on each
        e_setosa = -sum(setosa_P .* log2(setosa_P));
        e_versi = -sum(versicolor_P .* log2(versicolor_P));
        e_virginica = -sum(virginica_P .* log2(virginica_P));
        
        %IF NAN RETURN 0.
        if isnan(e_setosa)
            e_setosa = 0;
        end
        if isnan(e_versi)
            e_versi = 0;
        end
        if isnan(e_virginica)
            e_virginica = 0;
        end
        
        %Total Entropy for the set.
        returnEntropy = e_setosa + e_versi + e_virginica;
end
