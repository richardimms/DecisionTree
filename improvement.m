function info_gain = improvement(originalSet,splitSet1,splitSet2)
    
    %Calculate the entropy of each set.
    ent_orig = entropy(originalSet);
    ent_ss1 =  entropy(splitSet1);
    ent_ss2 =  entropy(splitSet2);
    
    %Count the size of set to use as each weight
    a = length(splitSet1)./length(originalSet);
    b = length(splitSet2)./length(originalSet);

    %Information Gain is the original sets entropy - the sum of the weight
    %entropy of each split set.
    Information_Gain = ent_orig - (a.*ent_ss1 + b.*ent_ss2); 
    %For debbuging print out information gain.    
    info_gain = Information_Gain;

end
