---
layout: page
title: Model Selection
---
---
最常用的模型选择方法就是 CV(Cross Valdation)    

#### __Cross Validation__    
---    
> 就是将样本分成N等分，每次只用N-1分进行训练，另一份用来测试。最后将N个测试的结果进行平均作为最终的测试结果。基于测试结构进行模型或参数的选择

* __注意__    
1. 在使用CV时，不要做一些基于训练集的supervise的预处理工作(`如在训练集上基于predictors与respones进行一些特征选择。PCA是可以的，其是unsupervise的`)。其会导致当前选取的特征是fit训练集的，`导致CV的结果非常好`




