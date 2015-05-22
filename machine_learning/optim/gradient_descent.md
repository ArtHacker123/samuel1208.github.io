---
layout: page
title: Gradient Descent
---
---    
梯度下降法是一个最优化算法，通常也称为`Steepest Descent(最速下降法)`。是求解无约束优化问题最简单的方法之一，许多有效算法都是以它为基础进行改进和修正而得到的。基于一维变量的解释如下:    

>求解f(x)的最小值，则通过迭代的方法为$$x_{n+1} = x_n - \lambda_n p_n$$，不同的求解$$\lambda_n$$与$$p_n$$的方法，可以衍生出不同的算法，梯度下降中$$p_n = f'(x_n)$$
  
* __Multi-Dimention__    
$$
\hspace{4mm}Min \hspace{2mm}J(\theta_0, \theta_1..., \theta_n)  \\
\textbf{Solution}    \\
\hspace{4mm}\theta_0 = \theta_0 - \alpha\frac{\partial}{\partial\theta_0}J(\theta_0, \theta_1..., \theta_n)   \\
\hspace{4mm}\theta_1 = \theta_1 - \alpha\frac{\partial}{\partial\theta_1}J(\theta_0, \theta_1..., \theta_n)   \\
\hspace{4mm}... \\
\hspace{4mm}\theta_n = \theta_n - \alpha\frac{\partial}{\partial\theta_n}J(\theta_0, \theta_1..., \theta_n)   \\
$$    

* __Tips__        
1.  $$\theta_0, \theta_1..., \theta_n$$要同时更新. 即计算$$\theta_1$$时，使用的是未更新的$$\theta_0$$
2.  $$\alpha$$的取值太小，收敛速度比较慢。太大则会发散
3.  $$\alpha$$定了以后，下降的步长会越来越小， 因为梯度是越来越小的
4.  Feature Normalization可以加快收敛的速度    
<br />    

#### __References__
---
[网上教材](http://class.htu.cn/nla/chat5/sect5_1.htm)，并提供了一种确定步长的方法
