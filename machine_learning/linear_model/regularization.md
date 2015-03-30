---
layout: page
title: Regularization
---
正则化（Regularization）的目的是为了防止过拟合，即为了防止学习模型只是对训练集有很好的表现，而对其他不在训练集的样本则效果不好。有时也为了使得模型具有某种属性，如sparse coding中L1是为了使得学习得到的参数具有一定的稀疏性

#### __L2__    
---     
也称为weight decay(即欧氏距离)    
$$       
\hspace{4mm}|\boldsymbol{w}|^2_2 = |w_0|^2 + |w_1|^2 + ... + |w_n|^2 
$$    
当$$w_0$$为bias时，一般不加入惩罚项(bishop_PRML page10)     

#### __L1__ 
---    
也称为Lasso(即曼哈顿距离)，具有特征选择的功能     
$$       
\hspace{4mm}|\boldsymbol{w}|_1 = |w_0| + |w_1| + ... + |w_n| 
$$    
当$$w_0$$为bias时，一般不加入惩罚项

#### __注意点__
---    
1. 在做Regularization的时候，特征一定要做[STD](../data_process/data-normalization.html#std-normalization),使得每个特征的量纲是一样的。`否则结果将有很强的偏向性`    
<br />

#### __References__
---
1. [bishop_PRML](http://research.microsoft.com/en-us/um/people/cmbishop/prml/)
2. convex optimization(Stephen Boyd)

