clear all

cd /Users/barbaraszomolay/myfiles/MATLAB/CANTIGEN/test/cpl

C=importdata('Reno FLY 9mer.txt');

cd ..
load CPL_TEST
load names_TEST
load structure_TEST
load index_TEST
load info_TEST
s=size(C,1)/20;
CPL=CPL_TEST; names=names_TEST; structure=structure_TEST; index=index_TEST; info=info_TEST;
m=1e3; %top m peptides
q=150; %first q are initialized
tic
%i=1..q initialize
%i=1..q+1 has to have total length at least m 
W=0; Pepnames='0'; Protnames='0'; Information={'0','0','0'}; %initialize
for i=1:q
    for j=1:size(structure{i},2)-(s-1) 
        X=structure{i}(j:j+s-1);
        Q=coordinates(X);
        v=0;
        for jj=1:size(Q,1)
            u=CPL(Q{jj,1},Q{jj,2});
            v=v+sum(u(:,1));
        end
        vv=0;
        nn=strfind(X,'J'); %mean of I and L
        for ii=1:length(nn)
            vv(ii)=(CPL(nn(ii),8)+CPL(nn(ii),10))/2;
        end       
        nn=strfind(X,'B'); %mean of N and D
        for ii=1:length(nn)
            vv(ii)=(CPL(nn(ii),3)+CPL(nn(ii),12))/2;
        end       
        nn=strfind(X,'Z'); %mean of E and Q
        for ii=1:length(nn)
            vv(ii)=(CPL(nn(ii),4)+CPL(nn(ii),14))/2;
        end       
        w(j)=v+sum(vv); pepnames{j}=X; protnames=repmat(names(i),size(w,2),1);
        information=repmat(info(i,:),size(w,2),1);
    end
 W=[W; w']; Pepnames=[Pepnames; pepnames']; Protnames=[Protnames; protnames];
 Information=[Information; information];
 clear pepnames
 clear protnames
 clear information
 clear w
end
W=W(2:end); Pepnames=Pepnames(2:end); Protnames=Protnames(2:end); 
Information=Information(2:end,:); 

 toc
for i=q+1:size(structure,1)
    if mod(i,100)==0
       i
    end   
    w=0; pepnames='0'; protnames='0'; information={'0','0','0'}; %initialize
    if ismember(i,index)==1
       n=size(structure{i},2);
    else
       n=1;
    end   
    for k=1:n %count of subvectors
        if ismember(i,index)==1
           M=cell2mat(structure{i}(k));
           display('here')
        else
           M=structure{i};
        end   
        for j=1:length(M)-(s-1)
            X=M(j:j+s-1);
            Q=coordinates(X);
            v=0;
            for jj=1:size(Q,1)
                u=CPL(Q{jj,1},Q{jj,2});
                v=v+sum(u(:,1));
            end
            vv=0;
            nn=strfind(X,'J'); %mean of I and L
            for ii=1:length(nn)
                vv(ii)=(CPL(nn(ii),8)+CPL(nn(ii),10))/2;
            end       
            nn=strfind(X,'B'); %mean of N and D
            for ii=1:length(nn)
                vv(ii)=(CPL(nn(ii),3)+CPL(nn(ii),12))/2;
            end       
            nn=strfind(X,'Z'); %mean of E and Q
            for ii=1:length(nn)
                vv(ii)=(CPL(nn(ii),4)+CPL(nn(ii),14))/2;
            end       
            w1(j)=v+sum(vv); 
            pepnames1{j}=X;   
            protnames1=repmat(names(i), size(w1,2),1);
            information1=repmat(info(i,:),size(w1,2),1);
        end
        w=[w; w1']; pepnames=[pepnames; pepnames1']; protnames=[protnames; protnames1];
        information=[information; information1];
        clear pepnames1
        clear protnames1
        clear w1
        clear information1
    end
    w=w(2:end);  pepnames=pepnames(2:end); protnames=protnames(2:end);  information=information(2:end,:);       
    W=[W; w];
    [W Inx]=sort(W,'descend'); 
    W=W(1:m); Inx=Inx(1:m);
    Pepnames=[Pepnames; pepnames]; Pepnames=Pepnames(Inx);   
    Protnames=[Protnames; protnames]; Protnames=Protnames(Inx); 
    Information=[Information; information]; Information=Information(Inx,:);     
end   

Title{1,1}='Potential epitope';
Title{1,2} = 'Score';
Title{1,3}='Protein sequence';
Title{1,4}='Tumour antigen';
Title{1,5}='MHC';
Title{1,6}='Antigen type';
Y=[Pepnames  num2cell(W) Protnames Information]
Y=[Title; Y];
Y=string(Y);

[Yu,inxx]=unique(Y(:,1));
Yu=Y(inxx,:);
Yu=[Title; Yu];
Yu=string(Yu);
