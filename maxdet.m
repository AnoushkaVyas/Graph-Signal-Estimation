function S=maxdet(M,T,G)
    S=zeros(M,1);
    Uf=G.U(:,1:M);
    D=zeros(T,T);
    C=zeros(T,T);
    visited=zeros(T,1);
    j=1;
    while nnz(S)<M
        max=0;
        index=0;
        for i=1:T
            if visited(i) ==0
                C(i,i)=1;
                e=eig(Uf'*C * Uf);
                temp=abs(prod(nonzeros(e)));
                if (temp > max)
                    max=temp;
                    index=i;
                end
                C(i,i)=0;
            end
        end
        visited(index)=1;
        D(index,index)=1;
        C=D;
        S(j)=index;
        j=j+1;
    end
end
    
            
                
                