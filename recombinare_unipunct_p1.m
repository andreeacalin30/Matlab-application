function [c1,c2]=recombinare_unipunct_p1(p1,p2,n)
c1=p1;
c2=p2;
p=unidrnd(n);
c1(1:p)=p1(1:p);
c2(1:p)=p2(1:p);

c1(p+1:n)=p2(p+1: n);
c2(p+1:n)=p1(p+1: n);

end