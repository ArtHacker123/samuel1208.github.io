---
layout: page
title: Maximal Margin Classifier
---

*  __原理__    
$$
\hspace{4mm} \underbrace{Maximize}_{\beta_0,...,\beta_p} \{M\}  \\
\hspace{4mm} \textbf{Subject}\hspace{4mm} \textbf{to} :  \\
\hspace{8mm} \sum\limits_{j=1}^p\beta_j^2 = 1 \hspace{4mm}(\textbf{j从1开始，不包含}\beta_0)\\
\hspace{8mm} y_i(\beta_0 + \beta_1x_{i1}+...+\beta_px_{ip}) \geq M \hspace{4mm}\forall i=1,...,n \\
\hspace{8mm} (y_i\textbf{为-1或者1})
$$        

*  __特性__    
1. 在margine上的点称为`support vectors`
2. 只有`support vectors`会影响分类面。被margine正确分类的样本不影响分类面    
<br />
* __缺点__    
1. 很容易受到一些点的干扰，如下图右图中多了一个点以后，其分类面变化很大    
![img](./img/1.png)    
2. 不可以调整margin的大小，即在样本 `都分对的情况下` 容许M适当的变大。见下图的左图    
3. 当样本不可分的时候，其无法求解。见下图的右图    
![img](./img/2.png)


#### __Reference__ 
---    
1. An Introduction to Statistical Learning (Chapter 9) 

