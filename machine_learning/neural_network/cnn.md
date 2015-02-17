---
layout: page
title: CNN(Convolutional Neural Network)
---
由[Yann LeCun](http://yann.lecun.com)于1998年在文章[1]
中提出。其传统结构如下图所示:<br/>    
![cnn_structure](./img/cnn.jpg)
CNN在层数比较多的情况下还能学习得到比较好的结果的原因，是因为CNN中`滤波核的共享大大降低了网路的复杂度`。其目前也是深度学习中研究
研究比较多的，且效果比较好的模型。
<br/>      
<br/>     

#### __结构方面的文章__    
---    
* [Yann LeCun](http://yann.lecun.com)组由2009年的文章[2]。对CNN的结构如何进行选择进行了研究。其结构的主要改变为以下两点：    
1.  卷积层的激活函数使用在传统的Tan函数前面加上一个系数g，即g*tan（wx+b）      
2.  在卷积层与下采样层之间加入LCN（Local Contrast Normalization）归一化层(或降低计算在下采样层后加LCN）     
<br />      

* [Geoffrey E. Hinton](http://www.cs.toronto.edu/~hinton/)组于2012年的文章[3]的ImageNet。主要的差异性如下：    
1.  卷积层的激活函数使用ReLU，
2.  卷积层后面使用LRN（Local Response Normalization）归一化层
3.  使用dropout技术    
4.  训练数据增强    
<br />   

*  网路链接的学习方法，见文章[6]     

<br/>      

* [Yann LeCun](http://yann.lecun.com)组于2013年的文章[4]。其主要的贡献是使用CNN进行目标的定位
<br/>     

#### __预学习__  
---    
* [Yann LeCun](http://yann.lecun.com)组基于sparse coding的思路提出的[PSD](./psd.html)算法。        
详细请查看[PSD Pretraining for CNN](./psd.html#convolutional-psd)

* [Andrew NG](http://www-cs-faculty.stanford.edu/people/ang/)组的文章[5]  

* 聚类的一种预学习方法文章[7]

<br/>       

#### __开源代码__
---    
开源的代码Matlab、Python、Torch、c++的都有。个人推荐[Torch](http://torch.ch/)。原因很简单，其是[LeCun](http://yann.lecun.com)组的研发的。


#### __Reference__
---    
1.    Gradient-Based Learning Applied to Document Recognition    
2.    What is the best multi-stage architecture for object recognition?    
3.    ImageNet Classification with Deep Convolutional Neural Networks    
4.    OverFeat:Integrated Recognition Localization and Detection using Convolutional Networks    
5.    Tiled convolutional neural networks
6.    An Analysis of the Connections Between Layers of Deep Neural Network
7.    Clustering Learning for Robotic Vision

