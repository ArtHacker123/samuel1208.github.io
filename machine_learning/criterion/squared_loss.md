---
layout: default
---

__Squared Loss__
----------    
---   
*  __离散形式__    
$$
\hspace{4mm}E[L] = \frac{1}{2}\sum_{i=0}^M |y(x)-t|^2   \hspace{8mm}(1) \\
\hspace{4mm}E[L] = \frac{1}{2M}\sum_{i=0}^M |y(x)-t|^2   \hspace{8mm}(2) \\
\hspace{4mm}E[L] = \frac{1}{2MD}\sum_{i=0}^M |y(x)-t|^2   \hspace{8mm}(3) \\
\hspace{4mm}其中:    \\
\hspace{8mm}M 为样本的个数 \\
\hspace{8mm}D 为特征x的维数
$$    
*  __说明__        
1. 上式(2)的Loss不会随着样本数的增加而增加,又称为 Mean Squared Error    
2. 上式(3)的Loss拥有(2)的属性，其不会随着特征的维数增加而增加
3. squared loss与linear regression(即$$y(\vec x)=\vec w^t\vec x$$)组合在一起为 __convex__ 的. 
与logistic regression使用squared error就是 __non-convex__ 问题了    
<br \>     

__Generalized Squared Loss__
----------    
---     
* __连续形式__     
$$
\hspace{4mm}E[L_q] = \int \int |y(x)-t|^q p(x,t)dxdt
$$   
其又称为Minkowski loss，见bishop_PRML page48。 引入了$$L-n$$ norm,以及条件概率分布p(x,t)    
<br />    

__Source Code__
--------    
---    
[torch7](https://github.com/torch/nn/blob/master/MSECriterion.lua)

__References__
----------------    
---    
[bishop_PRML](http://research.microsoft.com/en-us/um/people/cmbishop/prml/)
