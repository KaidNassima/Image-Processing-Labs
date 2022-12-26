%filtre moyenneuur 
im1=imread("cameraman.tif");
vect2=fspecial('average',3);
imfilt_average2=filter2(vect2,im1,'same');
figure,subplot(1,2,1); imshow(im1);
subplot(1,2,2); imshow(imfilt_average2/255);
%%%%
imfilt_average2=filter2(vect2,im1,'valid');
figure,subplot(1,2,1); imshow(im1);
subplot(1,2,2); imshow(imfilt_average2/255);
%%%%
imfilt_average2=filter2(vect2,im1,'full');
figure,subplot(1,2,1); imshow(im1);
subplot(1,2,2); imshow(imfilt_average2/255);
%% L'effet de bord 
%l effet de bord se manifeste par l'apparition  d'un cadre entourant les
%bords de l'image filtré , il est du au fait d'ajouter des pixels de valeur nulle
%durant le calcul de covolution 
%% Commentaire  et Comparaison : 
%avec same l image est apparue avec un cadre==> elle renvoie une image qui
%a la meme taille 
% avec valid l'image reultante est sans cadres ==> elle renvoie une image
% avec une taille inferieure (254*254)
%avec  full  l'mage resultatnte est apparue avec un cadre prononcé ==> elle
%renvoie une image avec une taille superieure (258*258)
%% Relation avec l effet de bord 
%valid ne prend pas en compte les valeurs ajoute parcontre full les
%rajoute
% l'effet de bord est plus renforcé avec full qu'avec valid et n'apparait
% pas avec same 

