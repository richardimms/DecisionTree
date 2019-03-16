function learnDecisionTree(M,v)

    %Join the two matrices together.
    Z = [num2cell(M),v];
 
    %Create the final classification tree
    final_tree = classification_tree(Z);
    
    %Get a random sample from the list in the dataset.
    sample = [4.40000000000000,2.90000000000000,1.40000000000000,0.200000000000000];
    
    disp(final_tree);
    
    %Display the final classified species.
    disp(classify(final_tree,sample));
   
     
end
