function [val_cost] = fitness(x,p, m )
val_cost=0;
c=zeros(1, 12);
count=1;
for j=1:4
    for k=1:3
        c(count)=p(j)*m(k);
        count=count+1;
    end
    
end


for i=1:12
        val_cost=val_cost+c(i)*x(i);
end
val_cost=1/val_cost*100;
end

