---
layout: default
---

CNN(Convolutional Neural Network)
============
 
__介绍__
--------
由[Yann LeCun](http://yann.lecun.com)于1998年在文章`Gradient-Based Learning Applied to Document Recognition`
中提出。其传统结构如下图所示:<br/>    
![cnn_structure](./img/cnn.jpg)
<br/>      
<br/>     

__结构方面的文章__
----------
* [Yann LeCun](http://yann.lecun.com)组由2009年发表了`What is the best multi-stage architecture for object 
recognition?`。对CNN的结构如何进行选择进行了研究。其结构的主要改变为以下两点：    
1.  卷积层的激活函数使用在传统的Tan函数前面加上一个系数g，即g*tan（）      
2.  在卷积层与下采样层之间加入LCN（Local Contrast Normalization）归一化层(或降低计算在下采样层后加LCN）     
<br/>      

* [Geoffrey E. Hinton](http://www.cs.toronto.edu/~hinton/)组于2012年发表的`ImageNet Classification with Deep Convolutional Neural Networks`。主要的差异性如下：    
1.  卷积层的激活函数使用ReLU，
2.  卷积层后面使用LRN（Local Response Normalization）归一化层
3.  使用dropout技术    
4.  训练数据增强    
<br/>      

* [Yann LeCun](http://yann.lecun.com)组于2013年发表的`OverFeat:Integrated Recognition Localization and Detection using Convolutional Networks`。其主要的贡献是使用CNN进行目标的定位
<br/>      
<br/>   

__预学习__
-----------
* [Yann LeCun](http://yann.lecun.com)组基于sparse coding的思路提出的PSD算法。详细阅读下面三篇文章：
1.  Fast Inference in Sparse Coding Algorithms with Applications to Object Recognition
2.  Learning Invariant Features through Topographic FilterMaps
3.  Learning Convolutional Feature Hierarchies for Visual Recognition  
4.  训练数据增强    
<br/>   

* [Andrew NG](http://www-cs-faculty.stanford.edu/people/ang/)组的文章。详细阅读下面这篇文章：
1.  Tiled convolutional neural networks
<br/>       
<br/>     

__开源代码__
-----------
开源的代码Matlab、Python、Torch、c++的都有。个人推荐[Torch](http://torch.ch/)的。原因很简单，其是[LeCun](http://yann.lecun.com)组的研发的。
