function S_Phi = Create_S_Phi(Sigma_M,decision)
% Creates the fluence sensitivity matrix
S_Phi = Sigma_M';
S_Phi((decision == 0),:) = [];