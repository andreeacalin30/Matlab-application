function [val_cost] = fitness_produse(x,pret_unitate,nr_pers)
val_cost=0;

for i=1:2
        val_cost=(val_cost+pret_unitate(i)*x(i)*nr_pers);
end
%val_cost=1/val_cost*100;
%avem o problema de maxim, nu de minim; nu mai e nevoie sa impartim
%1/val_cost
%pret_unitate este un vector rpeluat din fisier txt
end