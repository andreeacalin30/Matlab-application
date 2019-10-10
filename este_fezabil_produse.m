function [OK] = este_fezabil_produse(x,nr_pers)
nr_limita=load('nr_limita_tura.txt');
cereri=load('cereriProduse.txt');

if x(1)<=nr_limita(1) && x(1)<=nr_limita(2) && nr_pers*x(1)>=cereri(1) && nr_pers*x(2)>=cereri(2)
        OK=1;
    else
        OK=0;
end

end

