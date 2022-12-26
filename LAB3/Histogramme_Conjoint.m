clear all
%histogramme conjoint
% L’information mutuelle est issue de la th´eorie de l’information. Pour deux images donn´ees,
% l’information mutuelle permet de mesurer leur ressemblance.
% Le calcul d’information mutuelle de deux images est bas´e sur la densit´e conjointe de probabilit´e des niveaux de gris des images. Il est n´ecessaire pour estimer la densit´e conjointe
% de probabilit´e de calculer un histogramme conjoint des niveaux de gris entre ces deux images.
% evaluer la difference entre les deux image
I=imread("cameraman.tif"); % cameraman matrice carre donc sa transpose teni carre  koun diri b une autre iamge algo heda maykhdmch 
                            % bon hiya broha gltna dirou  cameraman 
T=transpose(I);
Histo_conjoint=zeros(size(I,1),size(I,1));% size(I,1) returns the lengths of the specified dimensions in a 
                                          %row vector
                                          %hc est une matrice carre
 
 
 for i=1:size(I,1)
     for j=1:size(I,1)
 Histo_conjoint(j,i)=sum(I(i,:)==T(j,:));
     end
 end
 figure,
 subplot(131);imshow(I);title("image originale")
 subplot(133);imshow(T);title("image Transposée")
 subplot(132);imshow(Histo_conjoint);title("histo conjoint")
 