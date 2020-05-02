function [ A ] = Choleskesy_fectorization( R)
%This function computes the Choleskesy factorization of a matrix
d=length(R);
A=zeros(d);
for j = 1:d
for i = j: d
    v(i)=R(i,j);
    for k = 1: j-1
       v(i)=v(i)-A(j,k)*A(i,k);
    end
       A(i,j)=v(i)/sqrt(v(j));
end
end
end
