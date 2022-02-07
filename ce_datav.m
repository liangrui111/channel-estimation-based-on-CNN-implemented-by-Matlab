%-------------------------------------验证集---------------------------
HV=HT';
%-------训练数据划分成五分------
Hv1=HV(:,1:10000);
Hv2=HV(:,1:10000);
Hv3=HV(:,1:5000);
Hv4=HV(:,1:2500);
Hv5=HV(:,1:2500);
%------训练数据五种不同的分辨率-----------
Hv1ls=upsampLowRes1v(Hv1);
Hv1l=Hv1ls{1,1};
Hv2ls=upsampLowRes2v(Hv2);
Hv2l=Hv2ls{1,1};
Hv3ls=upsampLowRes3v(Hv3);
Hv3l=Hv3ls{1,1};
Hv4ls=upsampLowRes4v(Hv4);
Hv4l=Hv4ls{1,1};
Hv5ls=upsampLowRes5v(Hv5);
Hv5l=Hv5ls{1,1};
%训练数据转化成多维矩阵形式
Hv=reshape(HV,32,32,2,30000);
HvL=[Hv1l,Hv2l,Hv3l,Hv4l,Hv5l];
size(HvL)
HvL=reshape(HvL,32,32,2,30000);


%------------------数据转化成深度网络设计器能够识别的形式-------------
for j=1:30000*0.5
D=Hv(:,:,:,j);
D=reshape(D,32,32,2);
save(['D:\linshiceshi\c\',num2str(j),'.mat'],'D');
end

for s=1:30000*0.5
D=HvL(:,:,:,s);
D=reshape(D,32,32,2);
save(['D:\linshiceshi\d\',num2str(s),'.mat'],'D');
end



c=fileDatastore(fullfile('D:\linshiceshi\c'),'ReadFcn',@load,'FileExtensions','.mat');
d=fileDatastore(fullfile('D:\linshiceshi\d'),'ReadFcn',@load,'FileExtensions','.mat');
viputda= transform(c,@(data) rearrange_datastore2(data));
vtargetda= transform(d,@(data) rearrange_datastore2(data));
vData=combine(viputda,vtargetda);
% here I defined my network architecture
% here I defined my training options
%net=trainNetwork(trainData, Layers, options);



function image = rearrange_datastore2(data)
image=data.D;
image= {image};
end