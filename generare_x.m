function [x] = generare_x
x=zeros(1,12);
for i=1:3
     x(i)=unidrnd(11)-1;
end
for i=4:7
     x(i)=unidrnd(21)-1;
end
for i=8:12
     x(i)=unidrnd(16)-1;
end

end

