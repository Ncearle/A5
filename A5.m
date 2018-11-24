%% MATH 405 - Assignment 5
% Nicholas Earle

clear;clc;close all;

im = imread('unsharp_images/testpat_noblur.png');
im = double(im) / 255;

n = length(im);

tend = 1;
k = 0.1;
T = tend/k;
N = n*n;

u = zeros(T+1,n,n);
% u(1,:,:) = im;
u = im;

e = ones(N, 1);
L = spdiags([e e -4*e e e], [-129 -1 0 1 129], N, N);
L(1, N) = 1;
L(N, 1) = 1;

for i = 1:n+1
   L(i, N-(n+1)+i) = 1;
   L(N+1-i, i) = 1;
end

    v = reshape(u, N, 1);
    vnew = L*v;
    unew = u + 0.1 * reshape(vnew, n, n);

% for i = 1:T
%     v = reshape(u(i,:,:), N, 1);
%     vnew = L*v;
%     unew = 0.1 * reshape(vnew, n, n);
%     ui = u(i,:,:);
%     unew = ui(1) + unew;
%     u(i+1,:,:) = unew;
% 
% end
%     figure();
% for i = 1:T+1
% 
%     uim = squeeze(u(i));
%     
%     imagesc(uim);
%     colormap(gray);
%     drawnow;
% end
