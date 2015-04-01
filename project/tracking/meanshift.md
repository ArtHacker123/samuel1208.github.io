---
layout: page
title: Mean Shift
---
`Mean-Shift`是一种`迭代`的寻找概率密度分布中`局部极值`的方法,其步骤如下:

> step1: 寻找目标区域的概率密度的极值点    
> step2: 将目标区域的中心移之step1中的极值点位置    
> step3: 重复step1与step2，直到收敛(如位置不再变化)    

#### __Mean Shift Procedure__   
---   
参考之文章[1]，下面的核函数基于`欧氏距离`，则其概率密度函数为(常用的有`Gaussian`， `Epanechnikov`):    
$$
\hspace{4mm}p(x)=\frac{c_{k,d}}{nh^d}\sum\limits_{i=1}^{n}k(\|\frac{x-x_i}{h}\|^2)w_i \\
\hspace{4mm}\textbf{其中:} \\
\hspace{8mm}\frac{c_{k,d}}{nh^d}: \hspace{4mm} 为归一化因子\\
\hspace{8mm}w_i :\hspace{4mm} \textbf{位置}\mathbf{x_i}\textbf{处的概率值}\\ 
$$    
`导数P'(x)=0处即为极值点`，即:       
$$
\hspace{4mm}\frac{\partial p(x)}{\partial x} =\frac{2c_{k,d}}{nh^{d+2}}\sum\limits_{i=1}^{n}(x-x_i)k'(\|\frac{x-x_i}{h}\|^2)w_i 
$$    
    
设 $$\mathbf{g(z=\|\frac{x-x_i}{h}\|^2) = -k'(z)}$$,则:    
$$
\hspace{4mm}\frac{\partial p(x)}{\partial x} =\frac{2c_{k,d}}{nh^{d+2}}\sum\limits_{i=1}^{n}(x_i-x)g(z)w_i \\
\hspace{15mm} = \frac{2c_{k,d}}{nh^{d+2}}[\sum\limits_{i=1}^{n}g(z)w_i][\frac{x_i\sum\limits_{i=1}^{n}g(z)w_i}{\sum\limits_{i=1}^{n}g(z)w_i} -x] 
$$    
`则极值点的位置为`:    
$$
\hspace{4mm}\mathbf{x=\frac{x_i\sum\limits_{i=1}^{n}g(z)w_i}{\sum\limits_{i=1}^{n}g(z)w_i}}
$$    
<br />

#### __Implementation__  
---      

* __文章[2]__   
1.使用`Gaussian Kernel`，其中$$h \to \infty$$,即k(z)=1(因为$$z=||\frac{x-x_i}{h}||^2 \to \infty$$)    
2.通过[直方图反射](../../computer_vision/histgram/histgram_backproject.html)计算$$w_i$$    
<br />

* __文章[3]__   
1.建议使用`Epanechnikov Kernel`，因为当z<1时，k'(z)为常数     
2.计算$$w_i$$的方法与文章[2]不同，见文中公式10    
<br />

#### __References__        
---  
1.  Mean Shift: A Robust Approach Toward Feature Space Analysis
2.  Computer Vision Face Tracking For Use in a Perceptual User Interface
3.  Kernel-Based Object Tracking

