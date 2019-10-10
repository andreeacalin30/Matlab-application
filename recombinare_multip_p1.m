function [c1, c2] = recombinare_multip_p1(p1, p2, n)
c1=p1;
c2=p2;
r=unifrnd(0, 1);
   p=zeros(1, n);
   for i=1:n
       temp=unidrnd(n);
       while ismember(temp, p)
           temp=unidrnd(n);
       end;
       p(i)=temp;
   end;
   p=sort(p);
   p=[p,n];
   
   for i=1:2:n
       c1(p(i):p(i+1))=p2(p(i):p(i+1));
       c2(p(i):p(i+1))=p1(p(i):p(i+1));
   end;

end