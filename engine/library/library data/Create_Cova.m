load('SD.mat');
load('CrS.mat');
load('Cor.mat');
load('Cova.mat');

Cova_old = Cova;
N = 50;

for i=1:N
    Cova(:,:,i)=diag(SD(:,i))*diag(CrS(:,i))*Cor(:,:,i)*diag(CrS(:,i))*diag(SD(:,i));
end

%check
check = Cova - Cova_old;
