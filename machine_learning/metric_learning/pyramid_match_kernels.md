---
layout: default
---

__PMK(Pyramid Match Kernels)__
----------
---    
2006年由Kristen Grauman在文章[1]中提出来的算法,其适用于 __unordered、unequal length features__   

*  __Algorithm:__    
假设特征x为d维，且每一维的长度为$$m_x$$(每个特征的长度可以不一样),即:    
$$
\hspace{4mm}X = \{x | x = {[f_1^1,...,f_d^1];...;[f_1^{m_x},...,f_d^{m_x}]}\}
$$    
<br />
需要将特征值转换成整数,假设每维特征的值在(1，D)，这里直方图bin的宽度以2的倍数增加，则直方图的分辨率为$$L=log_2D$$，那么    
$$
\hspace{4mm}H_0(x)的直方图的bin宽度为1   \\
\hspace{4mm}H_l(x)的直方图的bin宽度为2^l，其维度为(\frac{D}{2^l})^d \\
\hspace{4mm}\Psi (x) = [H_0(x),...,H_L(x)]    
$$    
<br />
则PMK的相似度定义如下:    
$$
\hspace{4mm}K(\Psi (x), \Psi (y)) = \sum_{i=0}^Lw_iN_i  \\
\hspace{8mm}其中:\\
\hspace{12mm}w_i=\frac{1}{2^i} \\
\hspace{12mm}N_i= I(H_i(x), H_i(y)) - I(H_{i-1}(x), H_{i-1}(y))  \\
$$   
其中I(H_i(x), H_i(y))为[histogram intersection](./histrogram_intersection.html).则PMK可以写成如下形式:
$$
\hspace{4mm}K(\Psi (x), \Psi (y)) = I(H_0(x), H_0(y)) + \sum_{i=1}^{L}\frac{1}{2^i}{I(H_i(x), H_i(y)) - I(H_{i-1}(x), H_{i-1}(y))}
$$

   


__Spatial Pyramid Matching__
----------
---    
2006年Svetlana Lazebnik在文章[2]中基于文章[1]提出引入空间的信息
<br />

__References__    
------
----    
1.  Pyramid Match Kernels: Discriminative Classification with Sets of Image Features
2.  Beyond bags of features: spatial pyramid matching for recognizing natural scene categories

