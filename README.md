# channel-estimation-based-on-CNN-implemented-by-Matlab
using the Deep Learning Toolbox.
using the fileDatastore to make the input of cnn be .mat .
A case of channel estimation based on convolution network using MATLAB is given.
upsampleLowRes.m is to Used to generate low resolution channels from the true channel data.
ce_data.m is used to make the .mat can be the input of the cnn in matlab .
ce_cnn.m is used to define the structure of the cnn.
ce_test.m is used to measure the accuracy of channel estimation,use the result of LS algorithm as the input of trained cnn.
Reference article：Deep Learning for Joint Channel Estimation and Feedback in Massive MIMO Systems
Tong Chen, Jiajia Guo, Chao-Kai Wen, Member, IEEE, Shi Jin, Senior Member, IEEE,
Geoffrey Ye Li, Fellow, IEEE, Xin Wang, Member, IEEE and Xiaolin Hou, Member, IEEE
