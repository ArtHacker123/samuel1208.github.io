---
layout: default
---

__Training Tricks for Neural Network__
========
本文主要就[Yann LeCun](http://yann.lecun.com)1998年的文章`(Efficient BackProp)`进行学后感的整理。大牛98年就已经给出了这么详细的分析。干货真的很多    
<br />

__Stochastic versus Batch learning__     
----------    
---   
    
### __一. Pros of Stochastic Learning__     
1.  __学习过程比Batch Learning快__      
假设样本集中有10个样本，然后每个样本生成9个自身的copy，这样就有100个样本。
Stochastic只需要10个样本就完成了一个epoch。
而Batch则需要计算100个样本才能完成一次epoch`(而且其中90次是无用的计算)`    
2.  __学习的效果一般比较好__      
因为Stochastic的过程比较振荡，容易跳过一些局部最小值，找到更好的局部最小值。`而Batch在初始参数定了以后其最终的局部最小值就定了`
3.  __可以用来跟踪学习样本的变化__       
样本的变化，会立即反应到训练中，这也是其另一个名字Online Lerning的由来

###  __二. Pros of Batch Learning__     
1.  __学习的过程比较平稳__    
Batch的学习过程比较平稳，容易收敛，而Stochastic比较振荡，因此一般Stochastic的学习率都比较小。可以采用mini-batch来折衷，`既可以跳过局部最小，也可以相对平稳`      
2.  __一些加速算法只能用在Batch模式下(如:conjugate gradient，hessian-based)__   
可以现基于训练集学习得到一些加速算法需要的参数，再应用到Stochastic方法中，但是在Online就不行了(因为没有提前准备好的数据集)。  
<br />


### __二. 训练样本的处理__  


### __二. 激活函数的选择__  


