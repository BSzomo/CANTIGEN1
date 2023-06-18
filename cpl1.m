clear all

C=importdata('Reno FLY 9mer.txt');

cd ..

load Total

index=find(C<=0);
C(index)=3; %replace all negatives by a fixed positive number
s=size(C,1)/20;
for i=0:s-1
    CPL(i+1,:)=C(i*20+1:(i+1)*20)/sum(C(i*20+1:(i+1)*20));
end
CPL=log(CPL);

names=cellstr(Total(:,4)); structure=cellstr(Total(:,5));
info=cellstr(Total(:,1:3));

%exclude proteins of length less than s
for i=1:size(structure,1)
    x(i)=length(structure{i});
end    
iiindex=find(x>=s); 
names=names(iiindex);
structure=structure(iiindex); 
info=info(iiindex,:); 

%break proteins having X into subvectors

Y=structure;
index=0; index1=0; index2=0;
for i=1:size(structure,1)
    i
    if size(strfind(structure{i},'X'),2)==length(structure{i})   %these are sequences having X only of length at least s
       index1=[index1 i];
    else
       if min(strfind(structure{i},'X'))>=1 %find the indexes of the splitvectors of length at least s
          index=[index i]; 
          vv=strfind(structure{i},'X'); 
          v=setdiff([1:length(structure{i})],vv);
          V=vectorsplit(v,s);
          if isempty(V)==0 %if the length of at least one subvector is >=s
             for k=1:size(V,2)
                 Z{k}=structure{i}(V{k});    
             end   
             structure{i}=Z;  
          else
             index2=[index2 i]; %if splitvectors have size less than s, i.e., V is empty
          end    
       end  
       clear Z
    end
end   
index=index(2:end);  index=setdiff(index,index2); %save indeces where X appears and leave out index2
index1=index1(2:end); index2=index2(2:end); 
iindex=[index index1 index2]; n=size(names,1);
NamesX=names(index); StructureX=structure(index);  InfoX=info(index,:); %save the X splits
NNames=names(setdiff([1:n],iindex)); SStructure=structure(setdiff([1:n],iindex));
IInfo=info(setdiff([1:n],iindex),:); %keep all the rest, n was where length is less than s
Names=[NNames; NamesX]; Structure=[SStructure; StructureX]; Info=[IInfo; InfoX];
Index=[size(NNames,1)+1:size(Names,1)]';

names_TEST=Names; structure_TEST=Structure; CPL_TEST=CPL; index_TEST=Index; info_TEST=Info;

save('names_TEST','names_TEST')
save('structure_TEST','structure_TEST')
save('CPL_TEST','CPL_TEST')   
save('index_TEST','index_TEST')
save('info_TEST','info_TEST')

    
    
    
    
    
    
