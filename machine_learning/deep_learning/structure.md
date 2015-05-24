---
layout: page
title: Deep Network Structure Suvery
---
Deep Learning的热潮是由2006年Hinton的[DBN](dbn.html)引发的，Deep Learning中[CNN](cnn.html)方向在图像方面的研究热潮也是Hinton组2012年的Imagenet引发的。后面主要就Deep Learning比较出名的结构进行一些介绍。 

#### __ImageNet__   
--- 
[Geoffrey E. Hinton](http://www.cs.toronto.edu/~hinton/)组于2012年的文章[1]的ImageNet。主要变化如下：    

1.  卷积层的激活函数使用ReLU，
2.  卷积层后面添加LRN（Local Response Normalization）归一化层
3.  分类层使用了dropout    
4.  训练数据增强    
<br />    

#### __OverFea__    
---
[Yann LeCun](http://yann.lecun.com)组于2013年的文章[2]，且其最后网路的`输出值可以当着特征来用`。其主要使用了其2009年的文章[3]提出来的一些技术来进行网路的构造:    

1.  卷积层的激活函数使用在传统的Tan函数前面加上一个系数g，即`g*tan（wx+b）`      
2.  在卷积层与下采样层之间加入[LCN](../data_process/data-normalization.html#scnspatial-constractive-normalization)归一化层(或降低计算在下采样层后加LCN）    
<br />       

#### __TCNN__ 
---   
其与2013年在文章[4]中由Bengio组的goodfellow提出的

#### __Maxout Network__    
---
其与2013年在文章[5]中由Bengio组的goodfellow提出的

#### __Network in Network__    
---
其与2014年在文章[6]中提出的,其主要贡献有两点:    

1. 使用`MLP(神经网路)`代替卷积层中的卷积滤波核，称其为mlpconv    
如何将不同map之间的进行链接？
2. 使用`全局平均采样`来代替CNN中的分类器层    
即将最后一个Feature Map的大小设为类的个数，然后计算每个Feature Map里平均值，然后丢个softmax，其起到了`regularizer`的作用。

关于`全局平均采样`的`regularizer`的作用，作者做了如下实验 :      

1. `NIN + Fully Connected`、`NIN + Fully Connected+dropout`、`NIN + 全局平均采样`：全局平均采样效果最好
2. `CNN + Fully Connected`、`CNN + Fully Connected+dropout`、`CNN + 全局平均采样`：全局平均采样比全连接好，没有dropout好    
<br />     

#### __GoogleNet__    
---
其与2014年在文章[7]中基于`Network in Network`的改进

*  其他关于网路结构方面的文章    
文章[8]    
<br />    

#### __Pre-Train__    
---     
* [Yann LeCun](http://yann.lecun.com)组基于Deconvolutional Network的思路提出的[CPSD](./psd.html#convolutional-psd)    

* [Andrew NG](http://www-cs-faculty.stanford.edu/people/ang/)组的文章[4]  

* 聚类的一种预学习方法文章[9]   
<br />    

#### __Visualization__    
---    
<br />    

#### __References__    
--- 
1. ImageNet Classification with Deep Convolutional Neural Networks    
2. OverFeat:Integrated Recognition Localization and Detection using Convolutional Networks 
3. What is the best multi-stage architecture for object recognition?    
4. Tiled convolutional neural networks
5. Maxout networks, Goodfellow
6. Network in Network, Min Li
7. Going deeper with convolutions
8. An Analysis of the Connections Between Layers of Deep Neural Network
9. Clustering Learning for Robotic Vision

