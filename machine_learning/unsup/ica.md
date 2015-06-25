---
layout: page
title: ICA(Independent Component Analysis)
---
ICA与BBS(blind source separation)比较相关，比较典型的`鸡尾酒酒会中的声音分离(从混合的声音中分离出每一个单独的声音)`。其形式如下:    
$$
\hspace{4mm}\textbf{s=Wx}    \hspace{8mm} (1)\\      
\hspace{4mm}其中:    \\
\hspace{8mm}s：为分离信号    \\
\hspace{8mm}x：为混合信号    \\
$$    
    
* __假设__    
1. Component(即公式1中的W的列向量)是独立不相关的    
2. 分离后的信号(即公式1中的s)是不符合高斯分布的    
__注意__:`x是或多或少符合高斯分布的，因为x是s的线性组合，虽然s不是高斯分布，但根据中心极限定理,多个分布的和最终是趋向高斯分布的`     
<br />

* __求解__    
通过分离后信号s的非高斯性，来求解W,常用的算法为`FastICA`      
<br />

#### __Reference__
--- 
3. Independent Component Analysis: Algorithms and Applications
