---
layout: page
title: Gradient Descent
---
---    
* __Goal__       
$$
\hspace{4mm}Min \hspace{2mm}J(\theta_0, \theta_1..., \theta_n)  
$$      

* __Solution__    
$$
\hspace{4mm}\theta_0 = \theta_0 - \alpha\frac{\partial}{\partial\theta_0}J(\theta_0, \theta_1..., \theta_n)   \\
\hspace{4mm}\theta_1 = \theta_1 - \alpha\frac{\partial}{\partial\theta_1}J(\theta_0, \theta_1..., \theta_n)   \\
\hspace{4mm}... \\
\hspace{4mm}\theta_n = \theta_n - \alpha\frac{\partial}{\partial\theta_n}J(\theta_0, \theta_1..., \theta_n)   \\
$$    

* __Tips__        
1.  $$\theta_0, \theta_1..., \theta_n$$要同时更新. 即计算$$\theta_1$$时，使用的是未更新的$$\theta_0$$
2.  $$\alpha$$的取值太小，收敛速度比较慢。太大则会发散
3.  $$\alpha$$定了以后，下降的步长会越来越小， 因为梯度是越来越小的
4.  Feature Normalization可以加快收敛的速度''

* __与newton method的比较__
1.  newton method需要除以一个Hessian矩阵（即二阶偏导），即乘以其逆
$$
\theta = \theta - H^{-1}\frac{\partial}{\partial\theta}J(\theta)   
$$    
2. newton method不需要学习率参数\(\alpha\)
3. newton method收敛更快
4. newton method当特征维数较大时， 其Hessian可能不存在逆

#### __Proximal gradient method__
---  
是一种一般化的解决 `non-differentiable convex optimization` 的方法. 即如下:    
$$
\hspace{4mm}minimize_x \hspace{8mm} f_1(x)+f_2(x)+...+f_n(x) 
$$    
其中`所有f都是convex的，但部分是不可求导的`，这样就不能用传统的Gradient Descent方法。    
Proximal gradient就是用来解决这类问题的，其主要分开求解，即每个函数独自的考虑（They a re called proximal because each non smooth function among f_1, . . . , f_n is involved via its proximity operator）， 比较典型的这类算法有: [ISTA](./fista.html)、, projected Landweber, projected gradient, alternating projections等，详细讨论见[1]

#### __Referance__
---    
1.  Combettes. "Proximal Splitting Methods in Signal Processing"

