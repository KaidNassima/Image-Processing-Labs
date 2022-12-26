clear all ;
%egalisation et etiremnt d' une image de notre choix
im_couleur=imread('ash.jpg');

%etirement
for k=1:3
    im_etale(:,:,k)=imadjust(im_couleur(:,:,k));
end
  figure,
  title("etirement");
  subplot(321);plot(0:255,imhist(im_couleur(:,:,1)));title("Rouge");
  subplot(323);plot(0:255,imhist(im_couleur(:,:,2)));title("vert");
  subplot(325);plot(0:255,imhist(im_couleur(:,:,3)));title("Bleur");
  subplot(322);plot(0:255,imhist(im_etale(:,:,1)));title("Rouge apres etalement");
  subplot(324);plot(0:255,imhist(im_etale(:,:,2)));title("vert apres etalemnt");
  subplot(326);plot(0:255,imhist(im_etale(:,:,3)));title("Bleu apres etalemnt");

% %egalisation
for k=1:3
    im_egalise(:,:,k)=histeq(im_couleur(:,:,k));
 end
figure,
 title("egalisation");
  subplot(321);plot(0:255,imhist(im_couleur(:,:,1)));title("Rouge");
  subplot(323);plot(0:255,imhist(im_couleur(:,:,2)));title("vert");
  subplot(325);plot(0:255,imhist(im_couleur(:,:,3)));title("Bleu");
  subplot(322);plot(0:255,imhist(im_egalise(:,:,1))); title("Rouge apres egalisation");
  subplot(324);plot(0:255,imhist(im_egalise(:,:,2)));title("vert apres egalisation");
  subplot(326);plot(0:255,imhist(im_egalise(:,:,3)));title("Bleu apres egalisation");
 % affichage des images resultantes
 figure,
 subplot(131);imshow(im_couleur);title("image originale")
 subplot(133);imshow(im_egalise);title("image apres egalisation")
 subplot(132);imshow(im_etale);title("image apres etirement")
  