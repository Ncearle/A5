
function [u1]=heat_blur2D(im,T1) %,T2,T3)
% To study blurring of an image using 2D heat equation u_t=u_xx+u_yy
%
% The function heat_blur2D takes in an image (can be gray scaled or coloured)
% and applies the diffusion (heat) equation and displays the action at 3 different
% time steps T1,T2,T3
%
% Written by: Hirak Doshi
% input image file and store in u1,u2,u3
u1=double(imread(im));
% u2=double(imread(im));
% u3=double(imread(im));
% store size in m and n
[m,n,~]=size(u1);
% step size along t
dt=0.1;
% Diffusion constant
k=0.5;
% Display Original Image
subplot(2,2,1), imshow(uint8(u1))
title('Original image');
    
for t = 0:dt:T1
   u_xx = u1(:,[2:n n],:) - 2*u1 + u1(:,[1 1:n-1],:);       % finite difference approximation for u_xx
   u_yy = u1([2:m m],:,:) - 2*u1 + u1([1 1:m-1],:,:);    % finite difference approximation for u_yy
   u1= u1 + k*dt*(u_xx+u_yy);
   temp=u1;
end
subplot(2,2,2), imshow(uint8(temp))
str1=sprintf('T=%d',T1);
title(str1);
% for t = 0:dt:T2
%    u_xx = u2(:,[2:n n],:) - 2*u2 + u2(:,[1 1:n-1],:);       % finite difference approximation for u_xx
%    u_yy = u2([2:m m],:,:) - 2*u2 + u2([1 1:m-1],:,:);    % finite difference approximation for u_yy
%    u2= u2 + k*dt*(u_xx+u_yy);
%    temp1=u2;
% end
% subplot(2,2,3), imshow(uint8(temp1))
% str2=sprintf('T=%d',T2);
% title(str2);
% for t = 0:dt:T3
%    u_xx = u3(:,[2:n n],:) - 2*u3 + u3(:,[1 1:n-1],:);       % finite difference approximation for u_xx
%    u_yy = u3([2:m m],:,:) - 2*u3 + u3([1 1:m-1],:,:);    % finite difference approximation for u_yy
%    u3= u3 + k*dt*(u_xx+u_yy);
%    temp2=u3;
% end
% subplot(2,2,4), imshow(uint8(temp2))
% str3=sprintf('T=%d',T3);
% title(str3);
% end