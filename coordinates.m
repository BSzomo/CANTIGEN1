function z=coordinates(x)
Q{1,1}=0; Q{1,2}=0;
a1=findstr(x,'A'); 
if isempty(a1)==0
   Q=[Q; {a1} {1*ones(1,size(a1,2))}];
end   
c1=findstr(x,'C');
if isempty(c1)==0
   Q=[Q; {c1} {2*ones(1,size(c1,2))}];
end   
d1=findstr(x,'D');
if isempty(d1)==0
   Q=[Q; {d1} {3*ones(1,size(d1,2))}];
end   
e1=findstr(x,'E');
if isempty(e1)==0
   Q=[Q; {e1} {4*ones(1,size(e1,2))}];
end   
f1=findstr(x,'F');
if isempty(f1)==0
   Q=[Q; {f1} {5*ones(1,size(f1,2))}];
end   
g1=findstr(x,'G');
if isempty(g1)==0
   Q=[Q; {g1} {6*ones(1,size(g1,2))}];
end   
h1=findstr(x,'H');
if isempty(h1)==0
   Q=[Q; {h1} {7*ones(1,size(h1,2))}];
end   
i1=findstr(x,'I');
if isempty(i1)==0
   Q=[Q; {i1} {8*ones(1,size(i1,2))}];
end   
k1=findstr(x,'K');
if isempty(k1)==0
   Q=[Q; {k1} {9*ones(1,size(k1,2))}];
end   
l1=findstr(x,'L');
if isempty(l1)==0
   Q=[Q; {l1} {10*ones(1,size(l1,2))}];
end   
m1=findstr(x,'M');
if isempty(m1)==0
   Q=[Q; {m1} {11*ones(1,size(m1,2))}];
end   
n1=findstr(x,'N');
if isempty(n1)==0
   Q=[Q; {n1} {12*ones(1,size(n1,2))}];
end   
p1=findstr(x,'P');
if isempty(p1)==0
   Q=[Q; {p1} {13*ones(1,size(p1,2))}];
end   
q1=findstr(x,'Q');
if isempty(q1)==0
   Q=[Q; {q1} {14*ones(1,size(q1,2))}];
end   
r1=findstr(x,'R');
if isempty(r1)==0
   Q=[Q; {r1} {15*ones(1,size(r1,2))}];
end   
s1=findstr(x,'S');
if isempty(s1)==0
   Q=[Q; {s1} {16*ones(1,size(s1,2))}];
end   
t1=findstr(x,'T');
if isempty(t1)==0
   Q=[Q; {t1} {17*ones(1,size(t1,2))}];
end   
v1=findstr(x,'V');
if isempty(v1)==0
   Q=[Q; {v1} {18*ones(1,size(v1,2))}];
end   
w1=findstr(x,'W');
if isempty(w1)==0
   Q=[Q; {w1} {19*ones(1,size(w1,2))}];
end   
y1=findstr(x,'Y');
if isempty(y1)==0
   Q=[Q; {y1} {20*ones(1,size(y1,2))}];
end   
z=Q(2:end,:);


