---
layout: default
---

__2-class Margin__
----------    
---   
*  __公式__    
$$
\hspace{4mm}E[L] = \sum\limits_{i=1}^{m} Max[0, margin - t^i*h_{\boldsymbol{\theta}}(\boldsymbol{x^i})]   \hspace{8mm}(1) \\
\hspace{8mm}\textbf{其中:}    \\
\hspace{12mm}t 采用1或-1 \\
    \\
\hspace{8mm}\textbf{检测时:}\\
\hspace{12mm}t =  \begin{cases} 
1 \hspace{8mm}h_{\boldsymbol{\theta}}(\boldsymbol{x})>0 \\ 
-1\hspace{4mm}h_{\boldsymbol{\theta}}(\boldsymbol{x})<0
\end{cases}
$$        
    
* __函数图像__     
![margin](./img/margin.png)    
<br />

__multi-class Margin__
----------    
---       
*  __公式__    
$$
\hspace{4mm}E[L] = \sum\limits_{i=1}^{m} L_i \hspace{8mm}(1) \\
\hspace{8mm}\textbf{其中:}    \\
\hspace{12mm} L_i =Max(0, \sum\limits_{l=1, l\neq t_i}^{T}(margin -h_{\boldsymbol{\theta_{t_i}}}(\boldsymbol{x^i}) +h_{\boldsymbol{\theta_l}}(\boldsymbol{x^i})]) \\
\hspace{12mm}t 采用(1,2,...T)\\
$$


__Source Code__
--------    
---    
[torch7](https://github.com/torch/nn/blob/master/)

