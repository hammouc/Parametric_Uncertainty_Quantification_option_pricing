function fs = SpGrGetSeq(d, norm)
%Drop algorithm for the iterative enumeration of all indices used in sparse
%grid quadrature
  seq = zeros(1,d);
  a=norm-d;
  seq(1)=a;
  fs = seq;
  c=1;
  while seq(d)<a
    if (c==d) 
        for i=(c-1):-1:1
            c=i;
            if seq(i)~=0, break, end;
        end
    end
    seq(c) = seq(c)-1;
    c=c+1;
    seq(c) = a - sum(seq(1:(c-1)));
    if (c<d) 
        seq((c+1):d)=zeros(1,d-c);
    end
    fs = [fs;seq];
  end 
  fs = fs+1;
end