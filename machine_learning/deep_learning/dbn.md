---
layout: page
title: DBN(Deep Belief Nets)
---
Hinton于2006年的文章[1]，Deep Learning的开山之作。其使用3个网路层作为特征提取层，再加一层softmax分类层。
使用[Bernoulli-Bernoulli RBM](../neural_network/rbm.html)预学习其特征层，然后再使用[反向传播](../neural_network/backpropagation.html)训练整个网路的参数。

* __实验细节__    
1. 其在反响传播学习整个网路时，再前几次的epoch中只更新`softmax层`的参数，然后再整体一起更新    
<br />

#### __AutoEncode with RBM__    
---   
Hinton在文章[2]中使用4个[RBM](../neural_network/rbm.html)搭成了一个auto encode,其先使用[RBM](../neural_network/rbm.html)进行网路的预学习，再基于cross-entropy(`见CG_MNSIT.m`) 进行网路参数的微调，其Loss Function如下:    
$$
\hspace{4mm}L = \sum\limits_{i=1}^N\{\sum\limits_{j=1}^M[-(p^i_jlog(\hat{p}^i_j)-(1-p^i_j)log(1-\hat{p}^i_j)]\}\\
\hspace{8mm}其中:    \\
\hspace{12mm}N是样本的数量\\
\hspace{12mm}M是样本的维数\\
\hspace{12mm}p^i_j是第i个样本第p维的值\\
\hspace{12mm}\hat{p}^i_j是第i个样本的重构的第p维的值\\
$$

* __疑惑__    
1. 其顶层RBM的隐层单元使用线性输出，但还是基于Bernoulli-Bernoulli RBM?    
<br />    

#### __Reference__    
---    
1. A fast learning algorithm for deep belief nets ∗
2. Reducing the Dimensionality of Data with Neural Networks
