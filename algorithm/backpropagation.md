---
layout: default
---

__Backpropagation of Neural Network__
========
本文主要就2层(不包含输入层)的full-connect神经网路基于squared error的反向传播算法进行推导。简单起见，参数不考虑偏移b。`只供自娱`    

__网路结构__     
----------    
---       

其中:
$$
W1 \in R^{(n+1) \times m}  \\
W2 \in R^{m \times o}      \\
f1 是隐层节点的激活函数     \\
f2 是输出节点的激活函数    \\ 
$$


