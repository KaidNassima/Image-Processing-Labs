clear all ;

%image couleur 
%filtre gaussien
figure;

img_couleur=imread('couleur.jpg');
imshow(img_couleur)
im_bruit=imnoise(img_couleur,'gaussian');
sigma=1;
a=ceil(3*sigma);
vect2=fspecial('gaussian',5*sigma,sigma);
for i=1:3
    gauss(:,:,i)=conv2(double(vect2),double(im_bruit(:,:,i)));
end
figure, subplot(1,3,1); imshow(img_couleur); title("Image Original");
subplot(1,3,2); imshow(im_bruit); title("Image Bruité");
subplot(1,3,3); imshow(gauss/255); title("Image Filtré");
%filtre weiner 

for i=1:3
weiner(:,:,i)=wiener2(im_bruit(:,:,i),[5*sigma 5*sigma]);
end
figure
subplot(1,2,1)
imshow(im_bruit); title("image bruité");
subplot(1,2,2)
imshow(weiner); title(" image filtré");

%comparaison entre weiner et gauss 
figure
subplot(1,3,1)
imshow(im_bruit); title("image bruité");
subplot(1,3,2)
imshow(gauss/255); title("image filtré avec gauss");
subplot(1,3,3)
imshow(weiner); title(" image filtré avec weiner");
%explication 
% on remarque que l'image résultante aprés un filtrage de weiner est plus
% meilleure que celle aprés un filtrage gaussien
% le fait d'appliquer un bruit gaussien ne signifie pas qu'on peut BIEN le
% supprimer avec un filtre gaussien aussi 
%parce que le filtrage gaussien travaille juste sous sa cloche ç-a-d se contente d'eliminer les haute
%frequences PARCONTRE  weiner essaye de minimiser l'erreur quadratique
%entre le bruit et l'image d'origine en utilisant ses propriétes
%statistiques

