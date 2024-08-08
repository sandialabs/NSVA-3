function S_Sigma = Create_S_Sigma(Phi,decision)
% fill the variables for S_sigma

% Phi has to be a column vector

n_reactions = length(decision);
n_energy = length(Phi);

S_Sigma = {};

for i=1:n_reactions
    for j=1:n_reactions
        if i == j
            S_Sigma{i,j} = Phi'; %Check if Phi is a column or row vector
        else
            S_Sigma{i,j} = zeros(1,n_energy);
        end
    end
end

S_Sigma = cell2mat(S_Sigma);
S_Sigma((decision == 0),:) = [];