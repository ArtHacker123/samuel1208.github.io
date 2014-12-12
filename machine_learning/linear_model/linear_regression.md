---
layout: default
---

__Linear Regression__
==========
----    
* __Hypothesis__    
$$
\hspace{4mm}h(x) = w_0*x_0 + w_1*x_1 + ... + w_n*x_n  \\
\hspace{8mm}其中:\\
\hspace{12mm}x_0=1，即w_0为bias
$$    
<br />    
* __Cost function__    
使用[MSE](../criterion/squared_loss.html),其是 __convex__ 的    
<br />    
* __Solve__    
可以用Gradient Descent或Normal Equation的方法求解


