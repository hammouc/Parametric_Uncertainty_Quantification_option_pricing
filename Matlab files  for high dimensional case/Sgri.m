function [y]=Sgri(d,l,f)
%Implementation of the sparse grid method
y=0;
m=l+d-1;
for q=l:m
    i= SpGrGetSeq(d,q);
    for k=1:size(i,1)
        y=y+(-1)^(m-sum(i(k,:)))*nchoosek(d-1,sum(i(k,:))-l)*product(d,i(k,:),f);
    end

end
end

