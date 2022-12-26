clc;
close all;
clear all;
imchoisie=imread("pout.tif");
imshow(imchoisie);
[r,c]=size(imchoisie);
%% affichage de l'histogramme de l image choisie 
%avec la fonction imhist
imhist(imchoisie);
%sans la fonction imhist
 H=zeros(256,1);
 for i=0:255
 H(i+1)=sum(imchoisie(:)==i);
  end
 figure(1);
 bar(0:255,H);
%% affichage de l'histogramme cummulé 
% avec la fonction cumsum
Hc=cumsum(H);
% figure(2);
% bar(0:255,Hc);
%sans la fonction cumsum
Hc=zeros(256,1);
for i=2:256
%Hc(i)=sum(H(1:i));
 Hc(i)=Hc(i-1)+H(i);
end
 figure(2);
 bar(0:255,Hc);
%des exemples d'applications qui montrent l'interet de l histogramme cumulé
% on trouve  dans le domaines de la médecine : les radios et les scanners ex :la reconnaissance de cellules.
%% La Luminance 
somme=double(0);
for i=1:r
    for j=1:c
        somme = somme + double(imchoisie(i,j));
    end
end

luminance = somme / (r*c);

%% Le contraste 
% Formule de michelson 
Contraste_michelson=(max(imchoisie(:))-min(imchoisie(:)))/(max(imchoisie(:))+min(imchoisie(:)));
% Formule ecart type 
contraste_ecart_type = 0;
for i=1:r
  for j=1:c
    contraste_ecart_type = contraste_ecart_type + (double(imchoisie(i,j)) - luminance)^2;
  end
end

contraste_ecart_type = (contraste_ecart_type / (r*c))^0.5;
%Commentaire : pas les mm valeurs  pourquoi ?
%% modification sur les histogrammes
% Etirement 
%avec la fonction imadjust
im_Etire=imadjust(imchoisie);
 figure ,
 subplot(221);imshow(imchoisie);title("original");
 subplot(222);plot(imhist(imchoisie));
 subplot(223);imshow(im_Etire);title("Ajuste");
 subplot(224);plot(imhist(im_Etire));
 %commentaire : l'etirement permet d'etaler l'histogramme sur toute les valeurs 
 % d'intensité possible, il décroit toute fois la qualité de l'image
 % ==>apparition de  interstices 
 %Egalisation
 im_Egalise=histeq(imchoisie);
 figure ,
 subplot(221);imshow(imchoisie);title("original");
 subplot(222);plot(imhist(imchoisie));
 subplot(223);imshow(im_Egalise);title("Apres egalisation");
 subplot(224);plot(imhist(im_Egalise));
 % commentaire :l'egalisation rend les intensité equiprobables il modifie l'histogramme
%de tel sorte a avoir un histogramme plat (plus au moins)
%une image egalisé est de meilleur qualité et visuellement plus plaisante

%comparaison de l'etiremnt et de l'egalisation de l image 
figure ,
 subplot(221);imshow(im_Etire);title("Etalé");
 subplot(222);plot(imhist(im_Etire));
 subplot(223);imshow(im_Egalise);title("Apres egalisation");
 subplot(224);plot(imhist(im_Egalise));