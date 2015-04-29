---
layout: page
title: Histgram Backproject
---
见文章[1]，其主要用于计算被查找图像中的像素为目标图像中像素的概率。根据Bayes rule,即:       
$$
\hspace{4mm}P(target|pixel) = \frac{P(target)*P(pixel|target)}{P(pixel)} \\
\hspace{4mm}其中:    \\
\hspace{8mm}P(target)为目标出现的概率，可直接忽略   \\
\hspace{8mm}P(pixel|target)即目标区域的直方图(需要归一化)    \\
\hspace{8mm}P(pixel)即被查找图像的直方图(需要归一化)
$$    

__说明__   

1. 上式中的分母P(pixel)可以忽略(`认为每个像素出现的概率是一样的`)，即opencv的做法    
2. 文章[1]中，使用圆形滤波函数对计算好的概率图进行滤波平滑,即:    
$$
filter(x,y) = \begin{cases} 
1\hspace{4mm}if (x^2+y^2<r^2)\\ 
0\hspace{4mm}otherwise
\end{cases}
$$    

Reference
-------
---
1.  Indexing Via Color Histograms
