clear all;
close all;

%%%Partie 1 :
%%Affichage de l'image CouleursAdditifs.tif
%Question 1
chemin = 'C:\Users\acer\Desktop\SEMESTRE 2\TI\TP\TP1\image_TP1\';
img = 'CouleursAdditifs.tif';

ima=imread(cat(2,chemin,img),'tif');
imshow(ima)
title('image CouleursAdditifs.tif')

%%Caractéristiques de l'image :
%Question 2
imageinfo('CouleursAdditifs.tif');

%% RGB :
%Question 3
RGB=reshape(ones(64,1)*reshape(jet(64),1,192),[64,64,3]);
%affichage de l'image 
figure(1);imshow(RGB)
title('Image RGB')
%Affichage des plan R G B Séparément 
figure(2);

subplot(3,2,1); imshow(RGB(:,:,1)) % 1 : position 1 => R
title('Le plan R')
subplot(3,2,2); imshow(RGB(:,:,2)) % 2 : position 2 => G
title('Le plan G')
subplot(3,2,3); imshow(RGB(:,:,3)) % 3 : position 3 => B
title('Le plan B')


% jet and reshape : 
% jet(M) : crée une matrice Mx3 conteneant le code des couleurs d'une palate de couleur  (9awss 9oza7)
% Reshape(vecteur(x0:xn),L,C) : créer une matrice de L ligne et C colonne la prmiere case de cette 
%matrice est x0 et la derniere xn

%%  Matrcice indexé : 
%Question 4 
%afficher image : 
[X, map]=imread('CouleursAdditifs.tif') ;
imshow(X,map)
title('Affichage de l"image Indexé')
imwrite([X,map],'ColeursAdditifIndex.tif');
%Caractéristique image : 
imageinfo('ColeursAdditifIndex.tif')
%comparer les taille des images : 
size(X)
size(ima)

%%La Palette : 
%R = ima(:,:,1);
%G = ima(:,:,2);
%B = ima(:,:,3);

%img_grey = uint8((double(R)+double(G)+double(B))/3);
%map = [0 0 0 ; 1 1 1]
%imagesc(img)
%colormap(map);
%imagesc(ima);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Profondeur 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%image binaire : 
ima_binaire = im2bw(ima);
imshow(ima_binaire)
title('Conversion en image binaire avec La fnction im2bw()')
imwrite(ima_binaire,'ima_binaire.tif')
%image binariser 
I = imread('CouleursAdditifs.tif');
level = graythresh(I);
ima_binarise = im2bw(I,level);
imshow(ima_binarise)
title('Conversion en image binaire avec La fnction graythresh()')
imwrite(ima_binarise,'ima_binarise.tif')
% Comparaison entre l'image binaire , et l'image binarisé : identique 
size(ima_binaire)
size(ima_binarise)
img_montage = cat(2,ima_binarise,ima_binaire);
imshow(img_montage);
title('Comparaison entre image binariser avec la fonction im2bw() et graythresh()')
imwrite(img_montage,'montage_binaire.tif')
%caracteristique de l'image : 
imageinfo('ima_binaire.tif')
imageinfo('ima_binarise.tif') 