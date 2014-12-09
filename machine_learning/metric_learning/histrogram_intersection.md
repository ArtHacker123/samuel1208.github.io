---
layout: default
---

__Histrogram Intersection__
==============    
1991年文章[1]中最先提出来的一种计算直方图相似度的算法    
__Formula__         
$$
\hspace{8mm}H{(I,M)} = \sum_{j=1}^n min(I_j, M_j) = \frac{1}{2}\sum_{j=1}^n (I_j+M_j - |I_j-M_j|)  \\
\hspace{12mm}其中:   \\
\hspace{16mm}I,M是两个拥有相同bin的直方图
$$    
__Normalized Version__    
$$
\hspace{8mm}H{(I,M)} = \frac{\sum_{j=1}^n min(I_j, M_j)}{\sum_{j=1}^nM_j} 
$$




__References__    
------
----    
1.  Color Indexing
