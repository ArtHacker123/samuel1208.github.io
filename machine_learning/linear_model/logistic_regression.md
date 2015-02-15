---
layout: page
title: Logistic Regression
---
即在[linear regression](./linear_regression.html)的基础上加上sigmod激活函数, 用于二分分类,基于torch的[th linear_model.lua](./img/linear_model.lua)     
    
#### __原理__
--- 
* __Hypothesis__        
$$
\hspace{4mm}h_{\boldsymbol{\theta}}(\boldsymbol{x}) = \frac{1}{1+exp[-(\boldsymbol{\theta}^T\boldsymbol{x})]} 
$$    
       
* __Cost function__   
使用 `Cross Entropy`，其是 `convex` (使用[MSE](../criterion/squared_loss.html)则为 __nonconvex__ )，如下:
$$
\hspace{4mm}E[L]＝ \frac{1}{m}\sum\limits_{i=1}^{m}-\{t^iln[h_{\boldsymbol{\theta}}(\boldsymbol{x}^i)]+(1-t^i)ln[1-h_{\boldsymbol{\theta}}(\boldsymbol{x}^i)]\} \\
$$     
其其实是 `Log Maximum Likehood` ， 推导如下：    
$$ 
\hspace{4mm}\boldsymbol{Max}: \hspace{2mm}E[L] = \prod_{i:t^i=1}h(\boldsymbol{x}^i)\prod_{i:t^i=0}(1-h(\boldsymbol{x}^i)) \\
\hspace{4mm}\boldsymbol{Max}: \hspace{2mm}ln(E[L]) = \sum_{i:t^i=1}ln[h(\boldsymbol{x}^i)] + \sum_{i:t^i=0}ln[1-h(\boldsymbol{x}^i)] \\
\hspace{4mm}\boldsymbol{Min}: \hspace{2mm}-ln(E[L]) = -\{\sum_{i:t^i=1}ln[h(\boldsymbol{x}^i)] + \sum_{i:t^i=0}ln[1-h(\boldsymbol{x}^i)]\} \\
$$

* __Gradient__    
由于    
$$
\hspace{5mm}\frac{\partial h_{\boldsymbol{\theta}}(\boldsymbol{x})}{\theta_i} = h_{\boldsymbol{\theta}}(\boldsymbol{x})(1-h_{\boldsymbol{\theta}}(\boldsymbol{x}))*x_i\\
\hspace{4mm}\frac{\partial ln(h_{\boldsymbol{\theta}}(\boldsymbol{x}))}{\partial \theta_i} = \frac{h_{\boldsymbol{\theta}}(\boldsymbol{x})(1-h_{\boldsymbol{\theta}}(\boldsymbol{x}))}{h_{\boldsymbol{\theta}}(\boldsymbol{x})}*x_i \\
\hspace{24mm}=(1-h_{\boldsymbol{\theta}}(\boldsymbol{x}))*x_i \\
\hspace{4mm}\frac{\partial ln(1-h_{\boldsymbol{\theta}}(\boldsymbol{x}))}{\partial \theta_i} = \frac{-h_{\boldsymbol{\theta}}(\boldsymbol{x})(1-h_{\boldsymbol{\theta}}(\boldsymbol{x}))}{1-h_{\boldsymbol{\theta}}(\boldsymbol{x})}*x_i \\
\hspace{28mm}=-h_{\boldsymbol{\theta}}(\boldsymbol{x})*x_i \\
$$    
因此    
$$
\hspace{4mm}\frac{\partial L}{\partial \theta_i} = [t(1-h_{\boldsymbol{\theta}}(\boldsymbol{x})) - (1-t)h_{\boldsymbol{\theta}}(\boldsymbol{x})]*x_i  \\ 
\hspace{11mm}=[t-h_{\boldsymbol{\theta}}(\boldsymbol{x})]*x_i
$$

* __Properties__    
1.  当样本线性可分时，其会严重过拟合    
当所有样样本的$$P(C_k|x)=1$$，意味着$$\boldsymbol{w^Tx}$$是$$\infty$$或$$-\infty$$,则w的量级为$$\infty$$
(`由于计算机的进度问题，一般exp(700)左右就无法表达了,因此不会出现太严重的过拟合`)。可以通过weight decay来限制w的量级
2.  当样本线性可分时，其有多个解    
任何一条将所有样本分开的分类线都是其解( `参数的初始值不同，其结果就可能不同` )，可以通过weight decay解决
3.  远离分类面的点(`被正确分类的样本`)对分类面的影响不是很大    

#### __References__  
---    
1. [bishop_PRML(chapter4.3.2)](http://research.microsoft.com/en-us/um/people/cmbishop/prml/)
2. A comparison of numerical optimizers for logistic regression

