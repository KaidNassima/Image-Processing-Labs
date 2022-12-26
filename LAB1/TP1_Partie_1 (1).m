clear all ; 
close all ;
%% Variable chemin et img :
%Question 1
chemin = 'C:\Users\acer\Desktop\SEMESTRE 2\TI\TP\TP1\image_TP1\';

%Question 2 
img = 'fruits.jpg';

%% Lire L'image 
%Question 3
ima=imread(cat(2,chemin,img),'jpg');
imshow(ima)
title('image fruits.png')
imageinfo('fruits.jpg');
%% la commande whos 
%Question 4 
whos 

%% Affiche de l'image 
%Question 5 
    % 1. en utilisant la fonction imshow : 
figure(1); imshow(ima)
title('image avec imshow')

    %2. en utilisant le fonction imtool :
figure(2); imtool(ima)
title('image avec imtool')

    %3. en utilisant la fonction image :
figure(3); image(ima)
title('image avec image')

    %4. en utilisant la fonction imagesec :
figure(4); imagesc(ima)
title('image avec imagesc')
  
%%Image double : 
%Question 6
img_d = double(ima);
imshow(img_d)
title('image double')

img_d1 = img_d/255;
imshowpair(img_d,img_d1,'montage')
title('Comaparaison entre image double et image double / 255')

%% La fonction im2double
%Question 7
img_2_d = im2double(ima);
imshow(img_2_d)
title('conversion de l l"image en utilisant im2double()')

%% Comparaison des deux images 
%Question 8 
size(img_2_d)
size(img_d)

%%Conversion en image niveau de gris 
%Question 9
img_gray = rgb2gray(ima);
imshow(img_gray)
title('Conversion de l"image en degré de gris avec rgb2gray()')

imwrite(img_gray,'img_gray.jpg')
img_gray_1 = ima(:,:,1)*0.1 + ima(:,:,2)*0.1 + ima(:,:,3)*0.8;
img_gray_2 = ima(:,:,1)*0.1 + ima(:,:,2)*0.8 + ima(:,:,3)*0.1;
img_gray_3 = ima(:,:,1)*0.8 + ima(:,:,2)*0.1 + ima(:,:,3)*0.1;

montage({img_gray_1,img_gray_2,img_gray_3},'size' ,[1 3])
title('image avec 3 différents Coefficients ')

%img_montage = cat(3,img_gray_1,img_gray_2,img_gray_3) ;
%imshow(img_montage)


%%Sauvgarder les images :
%Je suis pas sur que c'est ce qui est demandé dans la question :
%///rectifié Done 
image1 = cat(2,img_gray_1,img_gray_2);
image2 = cat(2,image1,img_gray_3);
imwrite(image2,'montage.jpg')
