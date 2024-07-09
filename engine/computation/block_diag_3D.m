function B = block_diag_3D(A)
% This function creates a block diagonal 2D sparse matrix out of a 3D
% matrix
% A = 3D matrix

[row,col,sli] = size(A);

B =  sparse([],[],[],row*sli,col*sli,0);

for i=1:sli
    B((i-1)*row+1:i*row,(i-1)*col+1:i*col) = sparse(A(:,:,i));
end
