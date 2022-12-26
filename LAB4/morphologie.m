clear all 
close all 
x=imread ('AT3_1m4_01.tif');
im=x;
image=im2bw(im);
se=[0 1 0;1 1 1;0 1 0];
im2=imopen(image,se);

se2=strel('disk',10);%strel Create morphological structuring element. ici on cree un disque de rayon 10
closebw=imclose(image,se2);


figure ,
subplot(1,3,1);imshow(image);
subplot(1,3,2);imshow(im2);title('ouverture');
subplot(1,3,3);imshow(closebw);title('fermeture');
%binarisation de l image 
% imopen fait une ouverture ç-a-d une erosion puis une dilatation
