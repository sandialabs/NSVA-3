function reduction = create_reduction(reaction,selection)

reduction = zeros(length(reaction),1);
reduction((reaction == 0),:) = [];
selection((reaction == 0),:) = [];
for i = 1:length(selection)
    if (selection(i) == 1)
        reduction(i) = 1;
    end
end