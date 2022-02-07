function dataOut = upsampLowRes1(dataIn)
        temp = dataIn;
        temp = imresize(temp,[1024,50000],'method','bilinear');
        dataOut = {imresize(temp,[2048,50000],'method','bilinear')};
end
%----------------------------------------------------------------------------------
% function dataOut = upsampLowRes2(dataIn)
%         temp = dataIn;
%         temp = imresize(temp,[512,20000],'method','bilinear');
%         dataOut = {imresize(temp,[2048,20000],'method','bilinear')};
% end
% %-----------------------------------------------------------------------------------
% function dataOut = upsampLowRes3(dataIn)
%         temp = dataIn;
%         temp = imresize(temp,[256,100000],'method','bilinear');
%         dataOut = {imresize(temp,[2048,10000],'method','bilinear')};
% end
% %--------------------------------------------------------------------------------------
% function dataOut = upsampLowRes4(dataIn)
%         temp = dataIn;
%         temp = imresize(temp,[128,10000],'method','bilinear');
%         dataOut = {imresize(temp,[2048,10000],'method','bilinear')};
% end
% %--------------------------------------------------------------------------------
% function dataOut = upsampLowRes5(dataIn)
%         temp = dataIn;
%         temp = imresize(temp,[64,10000],'method','bilinear');
%         dataOut = {imresize(temp,[2048,10000],'method','bilinear')};
% end