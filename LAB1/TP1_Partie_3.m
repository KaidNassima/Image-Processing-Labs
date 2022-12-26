clear all;
close all; 

%% Question 1 : lire l'image degre de gris :
ima_gray = imread('img_gray_1.jpg');
ima_gray(11:14,44:50)
imshow(ima_gray(11:14,44:50))
title('Partie de l"image :lignes 11 à 14 , colonne 44 à 50 ')

%%Question 2 : dimension de l'image : nl nombre de ligne , nc nombre de colonne 
[nl,nc]=size(ima_gray)

%%Question 3 : Le max de chaque ligne 
maxligne = max(ima_gray ,[], 2) ;

%% Question 4 : le min de chaque ligne : 
minligne = min(ima_gray , [],2) ;
moyligne = mean(ima_gray,2) ;

%%Question 5 : tracé les 3 vecteurs au meme graphes : 
figure(1);
plot(maxligne,'blue')
hold on
plot(minligne,'red')
hold on
plot(moyligne,'green')
legend('maxligne','minligne','moyligne')
title('moyenne , maximum et minimum des lignes ')

%%Question 6 : tracé du max en fonction du min : 
figure(2);
plot(minligne,maxligne)
xlabel('minligne')
ylabel('maxligne')
title('max en fonction du min')


%%Question 7 : max min moy de toute l'image 
maxx = max(maxligne)
minn = min(minligne)
moyy= mean(moyligne)
summ = sum(sum(ima_gray))

%%Question 8 : partie de l'image : 
ima_gray_part = ima_gray(100:200,100:200);
max2 = max(max(ima_gray_part ,[], 2))
min2 = min(min(ima_gray_part ,[], 2))
moy2 = mean(mean(ima_gray_part, 2))
sum2 = sum(sum(ima_gray_part))

%%Question 9 : tracer les histogramme 
figure(3);
plot(ima_gray)
title('plot')

figure(4);
imhist(ima_gray)
title('imhist')