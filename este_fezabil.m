function [OK] = este_fezabil(x)
s1=0;
s2=0;
s3=0;
s4=0;
s5=0;
s6=0;
s7=0;
for i=1:3
    s1=s1+x(i);
end
for i=4:6
     s2=s2+x(i);
end
for i=7:9
     s3=s3+x(i);
end
for i=10:12
     s4=s4+x(i);
end

s5=x(1)+x(4)+x(7)+x(10);
s6=x(2)+x(5)+x(8)+x(11);
s7=x(3)+x(6)+x(9)+x(12);


n=load('numbers.txt');
if s1<=n(1) && s2<=n(2) && s3<=n(3)&& s3<=n(4) && s5>=20 && s6>=20 && s7>=20 
        OK=1;
    else
        OK=0;
end

end

