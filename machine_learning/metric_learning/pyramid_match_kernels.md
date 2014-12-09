---
layout: default
---

__PMK(Pyramid Match Kernels)__
----------
---    
2006年由Kristen Grauman在文章[1]中提出来的算法,其适用于 __unordered、unequal length features__   

*  __Algorithm:__    
假设特征$$x^{d \times m_x}$$为d维，且每一维的长度为$$m_x$$(每个特征的长度可以不一样),即:    
$$
\hspace{4mm}X = \{x | x = {[f_1^1,...,f_d^1];...;[f_1^{m_x},...,f_d^{m_x}]}\}
$$    
<br />
这里特征值必须为整数,假设特征值$$f \in (1，D)$$，这里直方图bin的宽度以 __2的倍数__ 增加，则直方图的分辨率$$L=log_2D$$，那么    
$$
\hspace{4mm}H_0(x)的直方图的bin宽度为1   \\
\hspace{4mm}H_l(x)的直方图的bin宽度为2^l，其维度为(\frac{D}{2^l})^d 
$$
<br \>
则所有分辨率组合到一起的特征为:    
$$
\Psi (x)=[H_{-1}(x),H_0(x),...,H_L(x)]
$$    
<br />
则PMK的相似度定义如下:    
$$
\hspace{4mm}K(\Psi (x), \Psi (y)) = \sum_{i=0}^Lw_iN_i  \hspace{16mm}(1)\\
\hspace{8mm}其中:\\
\hspace{12mm}w_i=\frac{1}{2^i} \\
\hspace{12mm}N_i= I(H_i(x), H_i(y)) - I(H_{i-1}(x), H_{i-1}(y))  \\
\hspace{12mm}I(H_{-1}(x), H_{-1}(y))=0 \\
$$   
<br />
Normalized Version 1:    
$$
K_{normalize}(\Psi (x), \Psi (y)) = \frac{K(\Psi (x), \Psi (y))}{min(|x|，|y||)} \hspace{16mm}(2)
$$
Normalized Version 2:    
$$
K_{normalize}(\Psi (x), \Psi (y)) = \frac{K(\Psi (x), \Psi (y))}{\sqrt{K_{normalize}(\Psi (x), \Psi (x))*K_{normalize}(\Psi (y), \Psi (y))}}\hspace{16mm}(3)
$$

*  __补充说明:__    
1.  $$I(H_i(x), H_i(y))$$为[Histogram Intersection](./histrogram_intersection.html).
2.  $$N_i$$需要减去前一层相交,因为前一层的相交在后一层中也相交 .
3.  $$w_i$$是根据直方图bin的个数来的。d维边长为$$2^i$$的超立方体点之间的最大距离为$$2^i\sqrt{d}$$ 。
因为i+1层的直方图的bin为i层的一半(即i+1层最大距离是i层的一半)，因此$$N_{i+1}$$的权重也为$$N_{i}$$的一半。
即直方图越精细其权重也越大
   
   
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

