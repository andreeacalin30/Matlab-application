function [p]=rang_l(pop,s)
[dim,~]=size(pop);
p=zeros(dim, 1);
for i=1:dim
    p(i)=(2-s)/dim+(2*i*(s-1)/(dim*(dim+1)));
end
end


