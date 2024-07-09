load('CrS.mat')
load('CrS_stacked')

CrS_stacked_old = CrS_stacked;

CrS_stacked = [];
N = 50;

for i = 1:N
    CrS_stacked = [CrS_stacked;CrS(:,i)];
end

check = CrS_stacked - CrS_stacked_old;