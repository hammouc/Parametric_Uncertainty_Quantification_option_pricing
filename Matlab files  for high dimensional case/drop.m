function y=drop(p,i,n)
%Drop algorithm for the iterative enumeration of all indices used in the
%product rule
d=length(i);
while (i~=0)
    i(p) = i(p) +1;
    if i(p)> n(p)
        if p == d
            y=0;
            break;
        end
        i(p)=1;
        p=p+1;
    else
        p=1;
        y=i;
        break;
    end
end   
end