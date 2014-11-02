---
layout: default
---

__Backpropagation of Neural Network__
========
本文采用的是2层(不包含输入层)的full-connect神经网路。Loss function使用squared error。且输出层的激活函数为线性函数，即`y=wx`。`只供自娱`    
<br />

__推导__
----------------    
---   
*  __网络结构__     
![mlp](./img/mlp.png)   

*    __Loss Function__         
$$
\hspace{4mm}E = \frac{1}{2}\sum_{k=1}^K（y_k-t_k）^2 \\ 
\hspace{8mm}其中:\\
\hspace{12mm}y_k = \vec z^T*\vec w^{(2)}_{k}   \\
\hspace{12mm}\vec z = (1, z_1,..., z_M)^T  \\
\hspace{12mm}z_m = h(\vec x^T*\vec w^{(1)}_{m}) \\
\hspace{12mm}\vec x = (1, x_1,..., x_D)^T  \\
$$     
    
*    __第二层推导__    
$$
\hspace{4mm}\boldsymbol{\frac{\partial{E}}{\partial{w_{k,i}^{(2)}}} = \delta^{(2)}_kz_i}  \\
\hspace{8mm}其中:\\
\hspace{12mm}\delta^{(2)}_k = (y_k-t_k)\\
$$    
      
*    __第一层推导__    
$$
\hspace{4mm}\boldsymbol{\frac{\partial{E}}{\partial{w_{m,i}^{(1)}}} = \delta^{(1)}_mx_i}  \\
\hspace{8mm}其中:\\
\hspace{12mm}\delta^{(1)}_m = h^{'}(\vec x^T*\vec w^{(1)}_{m})\sum_{k=1}^{K}\delta_kw^{(2)}_{k,m}
$$    
<br />

__Canonical link functions__
----------------    
---   
不同的激活函数对应不同的loss function，其组合又称为`Canonical link functions`。下面以`linear regression`、`logistic regression`、`softmax regression`为例,且$$a=\vec w^T \vec x$$。    

*  `logistic regression`激活层函数为`sigmod`,loss function为`cross-entropy`。如下:    

$$
E = \sum_{n=1}^N{t_nlny_n + (1-t_n)ln(1-y_n)} \\ 
y=h(a) = \frac{1}{1+exp(-a)}    \\
h^{'}(a) = h(a)*(1-h(a))

$$    
     
*  `softmax regression`激活层函数为`softmax`，loss function为`multiclass cross-entropy`。如下：    

$$
E = \sum_{n=1}^{N}\sum_{k=1}^{K}t_{nk}lny_{n,k} \\
y_k=h(a_k) = \frac{exp(a_k)}{\sum_{j=1}^{K}exp(a_j)} 
$$    

*  `linear regression`激活层函数为`linear`，loss function为`squared error`。 如下：     

$$
E = \frac{1}{2}\sum_{n=1}^N（y_n-t_n）^2 \\
y=h(a) = a
$$    


1.  上面三个不同的Loss function对参数$$\vec w$$`求导的形式是一样`。即$$\frac{\partial{E}}{\partial{w_i}}=\sum_{n=1}^N(y_n-t_n)x_{n,i}$$。`数学的魅力所在`。
2.  上面三个模型都是`convex`的。以logistic regression为例。当其loss function采用squared error时，其就是non-convex模型了`(证明就留个数学家吧)`。    
3.  当logistic regression使用squared error为loss function时。其$$\frac{\partial{E}}{\partial{w_i}}$$变为如下形式:    
$$
\hspace{4mm}\frac{\partial{E}}{\partial{w_i}}=\sum_{n=1}^N(y_n-t_n)h^{'}(a_n)x_{n,i} \\
\hspace{8mm}\boldsymbol{when}\hspace{4mm} t=1 \hspace{4mm}and \hspace{4mm}y=0.00000001 \\
\hspace{8mm}\boldsymbol{then}\hspace{4mm} h^{'}(a) = （1-0.00000001）*0.00000001  \simeq 0\\
\hspace{8mm}\boldsymbol{so} \frac{\partial{E}}{\partial{w_i}} \simeq 0
$$    
因此就算`输出与真实值的误差很大`，但是由于激活函数的梯度很小，导致最终反应在参数上的梯度变化几乎没有了。
<br />    

__References__
----------------    
---    
[bishop_PRML(chapter4-5)](http://research.microsoft.com/en-us/um/people/cmbishop/prml/)
