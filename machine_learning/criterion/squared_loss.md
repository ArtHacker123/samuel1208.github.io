---
layout: default
---

__Squared Loss__
----------    
---   
*  __离散形式__    
$$
\hspace{4mm}E[L] = \frac{1}{2}\sum\limits_{i=1}^{m} |h_{\boldsymbol{\theta}}(\boldsymbol{x^i})-t^i|^2   \hspace{8mm}(1) \\
\hspace{4mm}E[L] = \frac{1}{2m}\sum\limits_{i=1}^{m} |h_{\boldsymbol{\theta}}(\boldsymbol{x^i})-t^i|^2   \hspace{8mm}(2) \\
\hspace{4mm}E[L] = \frac{1}{2mD}\sum\limits_{i=1}^{m} |h_{\boldsymbol{\theta}}(\boldsymbol{x^i})-t^i|^2   \hspace{8mm}(3) \\
\hspace{4mm}其中:    \\
\hspace{8mm}m 为样本的个数 \\
\hspace{8mm}D 为t的维数,在多个类的情况下，以3类为例，t为[0，0，1]
$$    
*  __说明__        
1. 上式(2)的Loss不会随着样本数的增加而增加,又称为 Mean Squared Error    
2. 上式(3)的Loss拥有(2)的属性，且不会随着类的个数增加而增加

__Generalized Squared Loss__
----------    
---     
* __连续形式__     
$$
\hspace{4mm}E[L_q] = \int \int |h(x)-t|^q p(x,t)dxdt
$$   
其又称为 __Minkowski loss__ ,见bishop_PRML page48。 引入了$$L_n$$-norm,以及条件概率分布p(x,t)    
<br />    

__Source Code__
--------    
---    
[torch7](https://github.com/torch/nn/)

__References__
----------------    
---    
[bishop_PRML](http://research.microsoft.com/en-us/um/people/cmbishop/prml/)
