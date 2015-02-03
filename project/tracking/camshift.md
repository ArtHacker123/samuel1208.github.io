---
layout: default
---

本文结合opencv的代码主要就Mean-Shift、CAM-Shift进行一些简单描述

Mean-Shift
---------    
--- 
Mean-Shift是一种在数据的密度分布中寻找局部极值的方法(即给定一张概率密度图，寻找给定大小区域内的概率值最大)。




$$
高斯分布的权重 \\
\hspace{4mm}K(x-x_i) = ck\{\|\frac{x-x_i}{h}\|^2\} \\ 
其区域类的概率分布为 \hspace{4mm} \\
\hspace{4mm}P(x)=\frac{1}{n}\sum\limits_{i=1}^{n}K(x-x_i)  \\
Max\{P(x)\}, 则其导数\nabla P(x) = 0即可    \\
\nabla P(x) = \frac{1}{n}\sum\limits_{i=1}^{n}\nabla K(x-x_i) \\
\hspace{15mm}= \frac{c}{n}\sum\limits_{i=1}^{n}(x-x_i)\nabla k\{\|\frac{x-x_i}{h}\|^2\} \\
\hspace{15mm}= \frac{c}{n}[\sum\limits_{i=1}^{n} \nabla k][x-\frac{\sum\limits_{i=1}^{n}x_i\nabla k}{\sum\limits_{i=1}^{n}\nabla k}]
$$

CAM-Shift(Continuously Adaptive Mean Shift)
---------    
---   
<br />

References    
------  
---  
1.  The Estimation of the Gradient of a Density Function with Applications in Pattern Recognition    
2.  Mean Shift, Mode Seeking, and Clustering

