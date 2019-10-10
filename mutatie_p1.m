function [OM] = mutatie_p1(dim, O,pm, p, m)
OM=O;
OK=0;
for i=1:dim
    pop=OM(i,1:12);
    for j=1:12
        r=unifrnd(0, 1);
        if r<=pm

%            disp(O(i, :));
%            disp('gena:');
%            disp(j);
           %fac mutatie fluaj; generez 0 sau 1
           coef=unidrnd(2)-1;
           if coef==1
               pop(j)=pop(j)+1;
           else
               pop(j)=pop(j)-1;
           end;
           
          if j==1 || j==2 ||j==3
              if pop(j)>10
                  pop(j)=10;
              else if pop(j)<0
                    pop(j)=0;   
                  end
              end;
          else if j==4 || j==5 ||j==6
              if pop(j)>20
                  pop(j)=10;
              else if pop(j)<0
                    pop(j)=0;   
                  end
             end;
                    
               else                
                if pop(j)>15
                  pop(j)=15;
                else if pop(j)<0
                    pop(j)=0;   
                     end
                end
                
                end;
                                                    
          end
        end
        
    end
            if este_fezabil(pop)
                
                OM(i, 1:12)=pop;
                OM(i, 13)=fitness(pop,p,m);
                pop=OM(i, 1:12);
              % disp('Cromozom rezultat:');
             %  disp(OM(i, :));
            end
 end
 end
    

