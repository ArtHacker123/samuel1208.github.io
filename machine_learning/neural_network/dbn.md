---
layout: page
title: DBN(Deep Belief Nets)
---

#### __AutoEncode with RBM__    
---   
Hinton在文章[2]中使用4个RBM搭成了一个auto encode,其先基于CG pretrain每一个RBM，再基于cross-entropy(`见CG_MNSIT.m`) 进行网路参数的微调

__疑惑__:其顶层RBM的隐层单元使用线性输出，但还是基于Bernoulli-Bernoulli RBM?    
<br />    

#### __Reference__    
---    
1. A fast learning algorithm for deep belief nets ∗
2. Reducing the Dimensionality of Data with Neural Networks
