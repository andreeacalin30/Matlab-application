function [OM] = mutatie_pop_produse(dim, O,pm,pret_unitate,nr_pers)
OM=O;
OK=0;
for i=1:dim
    pop=OM(i,1:2);
    for j=1:2
        r=unifrnd(0, 1);
        if r<=pm
            if j==1               
                   pop(j)=unidrnd(15);              
            else
                if j==2                    
                   pop(j)=unidrnd(30);                                                    
                end
            end        
          
         end
            if este_fezabil_produse(pop,nr_pers)
                
                OM(i, 1:2)=pop;
                OM(i, 3)=fitness_produse(pop,pret_unitate,nr_pers);
                pop=OM(i, 1:2);
               % disp('Cromozom rezultat:');
               % disp(OM(i, :));
            end
          end
        end
    end


