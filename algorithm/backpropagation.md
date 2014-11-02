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
\hspace{8mm}E = \frac{1}{2}\sum_{k=1}^K（y_k-t_k）^2 \\ 
\hspace{16mm}其中:\\
\hspace{20mm}y_k = \vec z^T*\vec w^{(2)}_{k}   \\
\hspace{20mm}\vec z = (1, z_1,..., z_M)^T  \\
\hspace{20mm}z_m = h(\vec x^T*\vec w^{(1)}_{m}) \\
\hspace{20mm}\vec x = (1, x_1,..., x_D)^T  \\
$$     
    
*    __第二层推导__    
$$
\hspace{8mm}\boldsymbol{\frac{\partial{E}}{\partial{w_{k,i}^{(2)}}} = \delta^{(2)}_kz_i}  \\
\hspace{16mm}其中:\\
\hspace{20mm}\delta^{(2)}_k = (y_k-t_k)\\
$$    
      
*    __第一层推导__    
$$
\hspace{8mm}\boldsymbol{\frac{\partial{E}}{\partial{w_{m,i}^{(1)}}} = \delta^{(1)}_mx_i}  \\
\hspace{16mm}其中:\\
\hspace{20mm}\delta^{(1)}_m = h^{'}(\vec x^T*\vec w^{(1)}_{m})\sum_{k=1}^{K}\delta_kw^{(2)}_{k,m}
$$    
<br />

__Canonical link functions__
----------------    
---   
下面以`linear regression`、`logistic regression`、`softmax regression`为例。    

*  `logistic regression`激活层函数为`sigmod`,loss function为`cross-entropy`。如下:    

$$
E = \sum_{n=1}^N{t_nlny_n + (1-t_n)ln(1-y_n)}
$$    
     
*  `softmax regression`激活层函数为`softmax`，loss function为`multiclass cross-entropy`。如下：    

$$
E = \sum_{n=1}^{N}\sum_{k=1}^{K}t_{nk}lny_{n,k}
$$    

*  `linear regression`激活层函数为`linear`，loss function为`squared error`。 如下：     

$$
E = \frac{1}{2}\sum_{n=1}^N（y_n-t_n）^2
$$    

上面三个不同的Loss function对参数$$\vec w$$`求导的形式是一样`。即$$\frac{\partial{E}}{\partial{w_i}}=\sum_{n=1}^N(y_n-t_n)x_{n,i}$$。其中$$y_k=h(\vec w^T \vec x)$$
  `数学的魅力所在`。每个不同的激活函数对应不同的loss function的组合又称为`Canonical link functions`
<br />    

__References__
----------------    
---    
[bishop_PRML(chapter4-5)](http://research.microsoft.com/en-us/um/people/cmbishop/prml/)
