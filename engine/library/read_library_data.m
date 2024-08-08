% type: sriptfile
% describtion: reads data out of the library

% =========================================================================
% read cross section vectors (CrS)
filename = '\engine\library\library data\CrS.mat';
path = pwd;
path_CrS = [path filename];
clear filename path;
load (path_CrS);

% CS is a [89x34] Matrix containing the cross section information
% of all isotopes in the library
% cross section vectors are sorted columwise and 
% aligned with the order of the correlation matrix
% =========================================================================

% =========================================================================
% read cross section standart deviation vectors (SD)
% filename = '\NSVA MultiEnviroments\Library\library data\SD.mat';
% path = pwd;
% path_SD = [path filename];
% clear filename path;
% load (path_SD);

% SD is a [89x33] Matrix containing the cross section 
% standart deviations of all isotopes in the library
% vectors are sorted columwise and aligned 
% by the order of the correlation matrix
% =========================================================================

% =========================================================================
% read 3D correlation matrix 
% filename = '\NSVA MultiEnviroments\Library\library data\Cor.mat';
% path = pwd;
% path_Cor = [path filename];
% clear filename path;
% load (path_Cor);

% 3D correlation matrix is ordered in the way
% it is shown at the end of this file
% =========================================================================

% =========================================================================
% read 3D covariance matrix 
filename = '\engine\library\library data\Cova.mat';
path = pwd;
path_Cova = [path filename];
clear filename path;
load (path_Cova);

% 3D covariance matrix is ordered in the same
% way as the 3D correlation matrix
% =========================================================================

% =========================================================================
% read cross section as a stacked column vector 
filename = '\engine\library\library data\CrS_stacked.mat';
path = pwd;
path_CrS_stacked = [path filename];
clear filename path;
load (path_CrS_stacked);

% Column vector where the cross section for each isotope are stacked on top
% of each other
% =========================================================================

% =========================================================================
% order of the correlation / covariance matrix

% Cor(:,:,1)  = na23gcov;
% Cor(:,:,2)  = mg24pcov;
% Cor(:,:,3)  = al27acov;
% Cor(:,:,4)  = s32pcov;
% Cor(:,:,5)  = sc45gcov;
% Cor(:,:,6)  = ti46pcov;
% Cor(:,:,7)  = ti47pcov;
% Cor(:,:,8)  = ti48pcov;
% Cor(:,:,9)  = mn55gcov;
% Cor(:,:,10) = mn552cov;
% Cor(:,:,11) = fe54pcov;
% Cor(:,:,12) = fe56pcov;
% Cor(:,:,13) = fe58gcov;
% Cor(:,:,14) = co59pcov;
% Cor(:,:,15) = co59gcov;
% Cor(:,:,16) = co592cov;
% Cor(:,:,17) = ni58pcov;
% Cor(:,:,18) = ni582cov;
% Cor(:,:,19) = cu63gcov;
% Cor(:,:,20) = cu63acov;
% Cor(:,:,21) = zn64pcov;
% Cor(:,:,22) = zr902cov;
% Cor(:,:,23) = nb932cov;
% Cor(:,:,24) = in115gcov;
% Cor(:,:,25) = in115ncov;
% Cor(:,:,26) = au197gcov;
% Cor(:,:,27) = u235fcov;
% Cor(:,:,28) = u238fcov;
% Cor(:,:,29) = np237fcov;
% Cor(:,:,30) = np237fcov \Bf;
% Cor(:,:,31) = pu239fcov;
% Cor(:,:,32) = rmleucov \Bf;
% Cor(:,:,33) = rmlducov \Bf;
% Cor(:,:,34) = rmlpucov \Bf;
% =========================================================================