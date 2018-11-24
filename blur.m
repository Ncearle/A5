clear,clc;

dt = 0.1;
time = 1;
T_old = imread('unsharp_images/testpat_noblur.png');
T_temp=double(T_old);
[m,n,k] = size(T_temp);

T_new = double(T_temp);
T_new=ind2gray(T_new,colormap);

t = 0;
while t < time
    for i = 2:1:m-1
        for j = 2:1:n-1
            T_new(i,j) = T_temp(i,j) + dt*(T_temp(i+1,j) -2*T_temp(i,j) + T_temp(i-1,j)) + dt*(T_temp(i,j+1)-2*T_temp(i,j) + T_temp(i,j-1));
        end
    end
   T_temp = T_new;
   t = t+dt;
   imshow(uint8(T_new))
   getframe;
end