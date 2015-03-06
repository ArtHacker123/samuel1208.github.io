---
layout: page
title: CART(Classification and Regression Tree)
---    
本文主要通过回归来介绍Tree，其方法同样适用于分类    

#### __Regression__
---    
使用`Recursive Binary Spliting`基于$$Loss = RSS = \sum\limits_{j=1}^{J}\sum\limits_{i\in R_j}(y_i - \overline y_{R_j})$$进行Tree的创建，每个leaf的值为节点中所有样本的y的均值。详细过程如下:    

>  让我们用变量y表示response,用$$x_1, x_2, ..., x_p$$表示predictors。通过递归的方式把关于变量x的p维空间划分为不重叠的矩形。首先，基于minimize Loss选择一个$$x_i$$，在值th处进行分割得到两个空间: 一部分是$$x_i <= th$$, 另一部分是$$x_i > th$$。 接着再基于minimize Loss，在这两部分中的寻找一个部分并选择一个变量和该变量的划分值以相似的方式进行划分，这就形成了三个矩形区域。重复上面的步骤，只到每个leaf中的样本数小于一个阈值，这样就得到了J个区域       

<br />    

#### __Classification__
---
分类树的创建和回归树的创建大致原理是一样的，其区别：     

> 1. split的准则，即Loss不一样    
> 2. 分类树leaf节点的值使用most commonly occurring class    

分类中常用的准则有`Gini Index`与`Cross-Entropy`，不要用分类错误率`(It turns out that classification error is not sufficiently sensitive for tree-growing)`    

* __Gini-Index__    
$$
G = \sum\limits_{m=1}^{M}\sum\limits_{k=1}^{K}p_{mk}(1-p_{mk})\\
其中: \\
\hspace{4mm}M为leaf节点的个数 \\
\hspace{4mm}K为class的个数 
$$    

* __Cross-Entropy__    
$$
D = -\sum\limits_{m=1}^{M}\sum\limits_{k=1}^{K}p_{mk}ln(p_{mk})\\
其中: \\
\hspace{4mm}M为leaf节点的个数 \\
\hspace{4mm}K为class的个数 
$$    

* __Exercises__    
假设一个leaf节点有40个类1的样本，60个类2的样本。则这个节点的Gini Index与Cross-Entropy为:    
G = 0.4*(1-0.4) + 0.6*(1-0.6) = 0.48(`两类时只需计算一个即可`)    
D = 0.4*ln(0.4) + 0.6*ln(0.6) = 0.673    
<br />    

#### __Pruning__    
---    
树的剪枝一般都是在树建好以后进行    

*  __Cost complexity pruning__    
其也叫weakest link pruning，其就是在原来的Loss上面加上一项树复杂度的惩罚项以RSS为例，即    
$$
\hspace{4mm}RSS = \sum\limits_{j=1}^{|T|}\sum\limits_{i\in R_j}(y_i - \overline y_{R_j}) + \alpha|T| \\
\hspace{4mm}其中:   \\
\hspace{8mm}|T|为树中leaf的个数
$$    
其中$$\alpha$$的值可以通过`cross-validation`来选择    
<br />    

#### __References__    
---
1.  An Introduction to Statistical Learning with Applications in R
