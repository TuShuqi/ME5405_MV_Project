clc;
clear;
im=imread('D:\Documents\nus\5405-MV\project\hello_world.jpg');
imshow(im);

% 2.sub-image
subim=im([1/3*size(im,1):2/3*size(im,1)],:,:);%row 1/3
subim=subim(:,[1:1/2*size(subim,2)],:);%column 1/2
imshow(subim);
% 3.binary-image
grayim=rgb2gray(subim);

grayim(grayim<100)=0;
grayim(grayim>=100)=1;
imshow(grayim,[0,1]);
% 4.one-pixel thin
P=1-grayim;%negative
imshow(P,[0,1]);

se_search=1;%south-east search
cut = zeros(size(P)); %to be cut
cut = uint8(cut);%white
delete_flag=1;
eightnb=zeros(8);
eightnb = uint8(eightnb);%white
while delete_flag
    delete_flag=0;
  for i=2:size(P,1)-1
      for j=2:size(P,2)-1
          if(P(i,j)==1)%white is background
              continue;
          end
          eightnb=[P(i-1,j),P(i-1,j+1),P(i,j+1),P(i+1,j+1),P(i+1,j),P(i+1,j-1),P(i,j-1),P(i-1,j-1)];
          pairnum=0;
          %determine [0,1] pairs
          for k=1:8           
              if(eightnb(k)==0 && eightnb(mod(k,8)+1)==1)%avoid offset
                  pairnum=pairnum+1;
              end
          end
              %south-east search
              if(se_search==1 && sum(eightnb(:))<=6 && sum(eightnb(:))>=2 && pairnum==1)
                  if(eightnb(1)+eightnb(3)+eightnb(5)>0 && eightnb(3)+eightnb(5)+eightnb(7)>0)
                      cut(i,j)=1;%delete i,j (set to white)
                      delete_flag=1;
                  end
              end
              %north-west search
              if(se_search==0 && sum(eightnb(:))<=6 && sum(eightnb(:))>=2 && pairnum==1)
                  if(eightnb(1)+eightnb(5)+eightnb(7)>0 && eightnb(1)+eightnb(3)+eightnb(7)>0)
                      cut(i,j)=1;%delete i,j (set to white)
                      delete_flag=1;
                  end
              end
          
      end
  end
  if(delete_flag==1)%delete some pixels
      P=P+cut;
      cut(:)=0;
      se_search=~se_search;
  end
end
P=1-P;
imshow(P,[0,1]);
% 5.outline
O=zeros(size(grayim));
O=uint8(O);
G1=zeros(size(grayim));
G1=uint8(G1);
G2=zeros(size(grayim));
G2=uint8(G2);
for i=1:size(grayim,1)-1
    for j=1:size(grayim,2)-1
        if(grayim(i,j)==~grayim(i,j+1))
            G1(i,j)=1;
        end
        if(grayim(i,j)==~grayim(i+1,j))
            G2(i,j)=1;
        end
        if(G1(i,j)||G2(i,j)==1)
            O(i,j)=1;
        end
    end
end
imshow(O,[0,1]);
% 6.label
L= zeros(size(grayim));
L= uint8(L);
Ap = padarray(grayim,[1 1],0);%0 is background, 1 is object
L = padarray(L,[1 1],0);
Ap=1-Ap;        %negative

isSearched=zeros(size(L));
Lnb = 0;
label=0;
queue=[];
%  1,1  0,-1 1,-1
% -1,0       1,0
% -1,1  0,1  1,1
direction=[-1,0;-1,1;0,1;1,1;1,0;1,-1;0,-1;-1,-1];
for i=2:size(Ap,1)-1
    for j=2:size(Ap,2)-1
        if(Ap(i,j)==1)%is background
            continue;
        end
        if(Ap(i,j)==0 && L(i,j)==0)%is object and not searched
            label=label+1;
            L(i,j)=label;
            queue=[i;j];
            %%%%%%%%%%%%%%%BFS%%%%%%%%%%%%%%%%
            while size(queue)~=0
                center=[queue(1,1),queue(2,1)];
                queue(:,1)=[];%delete this center from queue
                for k = 1:8 
                    sround=center+direction(k,:);%sround is 1x2 matrix (i,j)
                    if(Ap(sround(1),sround(2))==0 && L(sround(1),sround(2))==0)%is objective and not searched
                        L(sround(1),sround(2))=label;%label this sround
                        queue = [queue,[sround(1);sround(2)]];%(sround1,sround2) as center
                    end
                end
            end
        end
    end
end
imshow(L,[0,label]);



for i=1:label
LH=L;
lab=i;
LH(L~=lab)=0;
LH(L==lab)=1;
while(sum(LH(:,1))==0)
    LH=LH(:,2:end);
end
while(sum(LH(:,end))==0)
    LH=LH(:,1:end-1);
end
while(sum(LH(1,:))==0)
    LH=LH(2:end,:);
end
while(sum(LH(end,:))==0)
    LH=LH(1:end-1,:);
end
LH=~LH;
eval(['L',num2str(i),'=LH;']);
if i ~= 1 && i ~= 2 && i ~= 13 && i ~= 14
save(['D:\Documents\nus\5405-MV\project\homework\SOM\test_original\',num2str(i),'.mat'],'LH','-mat')
end
% imwrite(LH,['D:\Documents\nus\5405-MV\project\homework\test_original\',num2str(i),'.png']);

%padding
LP = padarray(LH,[ceil((128-size(LH,1))/2) ceil((128-size(LH,2))/2)],1,'both');
if(size(LP,1)==129)
    LP(1,:)=[];
end
if(size(LP,2)==129)
    LP(:,1)=[];
end
eval(['P',num2str(i),'=LP;']);
if i ~= 1 && i ~= 2 && i ~= 13 && i ~= 14
save(['D:\Documents\nus\5405-MV\project\homework\SOM\test_padding\',num2str(i),'.mat'],'LP','-mat')
end
% imwrite(LP,['D:\Documents\nus\5405-MV\project\homework\test_padding\',num2str(i),'.png']);

%resizing
LH=imresize(LH,[128 128]);
eval(['R',num2str(i),'=LH;']);
if i ~= 1 && i ~= 2 && i ~= 13 && i ~= 14
save(['D:\Documents\nus\5405-MV\project\homework\SOM\test_resizing\',num2str(i),'.mat'],'LH','-mat')
end
% imwrite(LH,['D:\Documents\nus\5405-MV\project\homework\test_resizing\',num2str(i),'.png']);

end
%imshow(P3,[0,1]);
%imshow(R3,[0,1]);




