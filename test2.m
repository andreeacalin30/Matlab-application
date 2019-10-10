
pret_unitate=load('pret_unitate.txt');
nr_ore_tura=6;

dim=10;

Populatie= generare_pop_produse(dim, pret_unitate);
disp(Populatie);

pm=0.2;
pc=0.8;
Copii=mutatie_pop_produse(dim, Populatie,pm,pret_unitate);
disp(Copii);

Copii_crossover=recombinare_pop_produse(Populatie,dim,pc,pret_unitate);
disp(Copii_crossover);

