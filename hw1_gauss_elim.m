

clear;
A = [1 2 3; 4 5 6; 7 8 9];
b = [-5; 3; 11];

% 
% inputs: A of size nxn
%         b of size nx1


 
[nrow, ncol]=size(A);
if(nrow ~= ncol)
    disp('Error: Square coefficient matrix required!!');
    return;
end

nb = size(b);
if (nrow ~= nb(1) || nb(2)~=1)
    disp('Error: size of b is incompatible!!!');
    return;
end

% Gaussian Elimnation

for i = 1:nrow-1

    % Fill in the details here
    mult = -A(i + 1 : nrow , i)/(A(i,i));
    A(i+1:nrow,:) = A(i+1:nrow,:)+mult*A(i,:);
    b(i+1:nb,:) = b(i+1:nb,:) + mult*b(i,:);

end

% Backwards substitution

x = zeros(nrow,1);
x(nrow) = b(nrow)/A(nrow,nrow);
for i = nrow-1:-1:1
    % Fill in the details here
    x(i,:) = (b(i,:) - A(i,i+1:ncol)*x(i+1:nb,:))/A(i,i);
end
    
x

