---
layout: default
---

__Logistic Regression__
==========
----    
即在[linear regression](./linear_regression.html)的基础上加上sigmod函数    
    
__Hypothesis__     
----    
---    
$$
\hspace{4mm}h(x) = sigmoid(w_0*x_0 + w_1*x_1 + ... + w_n*x_n)  \\
\hspace{4mm}其中:\\
\hspace{8mm}sigmoid(x) = \frac{1}{1+e^{-x}}
$$    
       
__Cost function__    
----    
---    
使用[Cross Entropy](../criterion/squared_loss.html),其是 __convex__ 的。
如果使用[MSE](../criterion/squared_loss.html)就是 __non-convex__    
<br />     


