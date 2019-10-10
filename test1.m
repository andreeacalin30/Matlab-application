c=load('costuri.txt');
p=load('payment.txt');
m=load('multiplier.txt');
[n]=size(c);
dim=10;

Populatie=generare_pop_ini(dim, p, m);
disp(Populatie);
%presupunem Populatie multisetul de copii
%construim multisetul progeniturilor mutate

Parinti_SUS= selectie_SUS(Populatie,dim);
Parinti_ruleta=selectie_ruleta(Populatie,dim);
disp('Aplicarea selectie SUS:'); 
disp(Parinti_SUS);
disp('Aplicarea selectie Ruleta:');
disp(Parinti_ruleta);
%selectia de tip ruleta imi selecteaza mai multi indivizi cu val fitness
%mai mare

