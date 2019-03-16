function classification = classify(tree, sample_data)

    i = 1;
    %Write a continous loop.
    while 1
        %If the information gain doesn't equal 0.
        if tree{i, 2} ~= 0
            %Decide whether to go left or right.
            if sample_data(tree{i,3}) < tree{i,4}
                %Go left.
                i = tree{i,6};
            else
                %Go right.
                i = tree{i,7};
            end
        else
            %If the information gain IS 0 - return the species found.
            classification = tree{i,8};
            break;
        end
    end
    
end