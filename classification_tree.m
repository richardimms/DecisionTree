function final_tree = classification_tree(Z)
   
    %set initial variables for first split
    i = 1;
    index = 1;
    node = 1;
    species = '';
    %Complete first max split on original set.
    [info, column, value] = maxSplit(Z);
    %Create beggining of the tree based on the first split.
    tree = {Z, info, column, value, index, node+1, node+2,species};
    
    %Make the node 3 large before starting loop because of node+1, node+2
    node = node + 3;
    
    %Begin splitting and creating the rest of the tree.
    while i <= size(tree,1)
        %If the tree information gain doesn't equal 0
        if tree{i,2} ~=0
            %Perfom a split and then analyse the performance of that split.
            [set1, set2] = split(tree{i,1}, tree{i, 3}, tree{i, 4});
            split_cell = {set1,set2};
            %Loop over the cell containing both the new arrays.
            for j = 1:length(split_cell)
                %If the size of set that has been split is > than 0 e.g not
                %empty.
                if size(split_cell{1,j}) > 0
                    %Perform max split and increase the index by 1.
                    [info,column,value] = maxSplit(split_cell{1,j});
                    index = index + 1;
                    %If the information gain is > than 0.
                    if info > 0
                        % Add this value to a tree with a new node, this
                        % set contains another possible split.
                        tree = [tree; {split_cell{1,j}, info, column, value, index, node, node+1},majority_class(split_cell{1,j})];
                        node = node + 2;
                    else
                        %Add this value to a tree without a new node - there is no more information from splitting this set.
                        tree = [tree; {split_cell{1,j}, info, column, value, index, 0, 0},majority_class(split_cell{1,j})];
                    end
                end
            end
        end
        i = i + 1;
    end
    
    final_tree = tree;
    
end

    