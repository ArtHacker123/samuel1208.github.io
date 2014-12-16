---
layout: default
---

__softmax Regression__
==========
----    
即多类的[logistic regression](./logistic_regression.html)。基于torch的[code](./img/logistic.lua)    
    
*  __Hypothesis__     
$$
\hspace{4mm}h^i_{\boldsymbol{\theta}}(\boldsymbol{x}) = \frac{exp[{\boldsymbol{(\theta^i)^Tx}}]}{\sum\limits_{j\in group}{exp[\boldsymbol{(\theta^j)^Tx}]}}\\
$$    
1.  __参数的冗余性__       
由softmax的公式可以看出，其参数减去一个常数不改变，公式的值，即:    
$$
\hspace{4mm}h^i_{\boldsymbol{\theta}}(\boldsymbol{x})=\frac{exp[{\boldsymbol{(\theta^i-c)^Tx}}]}{\sum\limits_{j\in group}{exp[\boldsymbol{(\theta^j-c)^Tx}]}}
$$    
当$$c=\theta^i_0$$时，我们发现$$\theta^i_0$$是个多余的参数,其可以设为0。    
2. __二类时与logistic regression的关系__    
$$
\hspace{4mm}h^1_{\boldsymbol{\theta}}(\boldsymbol{x})=\frac{exp[{\boldsymbol{(\theta^1)^Tx}}]}{exp[\boldsymbol{(\theta^1)^Tx}]+exp[\boldsymbol{(\theta^2)^Tx}]} \\ 
\hspace{16mm}=\frac{1}{1+exp[-\boldsymbol{(\theta^1 - \theta^2)^Tx}]} 
$$    
由上可以看出其是个参数冗余的[logistic regression](./logistic_regression.html)    
3. __实现的技巧__    
一般为了防止exp(x)的值过大，执行如下的操作:    
$$
 f_i(x) = \frac{exp(x_i-shift)}{\sum_j exp(x_j-shift)}  \hspace{8mm} shift = \max_i (x_i)
$$    
<br />
    
*  __Cost function__      
使用 __Multiclass Cross Entropy__ ,其是 __convex__ 的。其形式如下:    
$$
\hspace{4mm}E[L] =\sum\limits_{m=1}^{M}\{-\sum\limits_{j\in group}{t^j_m*ln(h^j_{\boldsymbol{\theta}}(\boldsymbol{x_m}))}\}
$$    

*  __Gradient__    
由于t只有其中一个值为1，其他为0(如[1,0,0])，设第j个值为1，则:    
$$
\hspace{4mm}L = -ln(h^j_{\boldsymbol{\theta}}(\boldsymbol{x}))
$$      
且      
$$
\hspace{4mm}\frac{\partial h^j_{\boldsymbol{\theta}}(\boldsymbol{x})}{\partial \theta^j_i} =(1- h^j_{\boldsymbol{\theta}}(\boldsymbol{x}))h^j_{\boldsymbol{\theta}}(\boldsymbol{x})*x_i (自行推导)
$$    
所以    
$$
\hspace{4mm}\frac{\partial L}{\partial \theta^j_i} = \frac{(1-h^j_{\boldsymbol{\theta}}(\boldsymbol{x}))h^j_{\boldsymbol{\theta}}(\boldsymbol{x})}{h^j_{\boldsymbol{\theta}}(\boldsymbol{x})}x_i \\
\hspace{11mm}=(1-h^j_{\boldsymbol{\theta}}(\boldsymbol{x}))x_i
$$


