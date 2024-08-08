function decision = create_decision(reaction,selection)

decision = zeros(length(reaction),1);
for i = 1:length(reaction)
    if (reaction(i) == 1) && (selection(i) == 1)
        decision(i) = 1;
    end
end