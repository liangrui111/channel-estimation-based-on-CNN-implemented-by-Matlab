% load("DATA_Htrainin");
% load("DATA_Hvalin");
% load("DATA_Htestin");

HT=HT';

%-----------------------------训练集----------------------------------------
%-------训练数据划分成五分------
Ht1=HT(:,1:50000);
Ht2=HT(:,1:20000);
Ht3=HT(:,1:10000);
Ht4=HT(:,1:10000);
Ht5=HT(:,1:10000);
%------训练数据五种不同的分辨率-----------
Ht1ls=upsampLowRes1(Ht1);
Ht1l=Ht1ls{1,1};
Ht2ls=upsampLowRes2(Ht2);
Ht2l=Ht2ls{1,1};
Ht3ls=upsampLowRes3(Ht3);
Ht3l=Ht3ls{1,1};
Ht4ls=upsampLowRes4(Ht4);
Ht4l=Ht4ls{1,1};
Ht5ls=upsampLowRes5(Ht5);
Ht5l=Ht5ls{1,1};
%训练数据转化成多维矩阵形式
Htrain=reshape(HT,32,32,2,100000);
HtrainL=[Ht1l,Ht2l,Ht3l,Ht4l,Ht5l];
HtrainL=reshape(HtrainL,32,32,2,100000);

%------------------数据转化成深度网络设计器能够识别的形式-------------
for i=1:100000*0.5
B=Htrain(:,:,:,i);
C=reshape(B,32,32,2);
save(['D:\linshiceshi\a\',num2str(i),'.mat'],'C');
end

for k=1:100000*0.5
B=HtrainL(:,:,:,i);
C=reshape(B,32,32,2);
save(['D:\linshiceshi\b\',num2str(k),'.mat'],'C');
end



a=fileDatastore(fullfile('D:\linshiceshi\a'),'ReadFcn',@load,'FileExtensions','.mat');
b=fileDatastore(fullfile('D:\linshiceshi\b'),'ReadFcn',@load,'FileExtensions','.mat');
iputda= transform(a,@(data) rearrange_datastore1(data));
targetda= transform(b,@(data) rearrange_datastore1(data));
trainData=combine(iputda,targetda);
% here I defined my network architecture
% here I defined my training options
%net=trainNetwork(trainData, Layers, options);








function image = rearrange_datastore1(data)
image=data.C;
image= {image};
end


