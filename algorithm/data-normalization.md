---
layout: default
---

__Data Normalization__
==============    
本篇主要讨论一些常用的数据归一化方法，以及即相应的影响。这里全部基于2-d的图像来讨论。          
<br />    

__DC Removal__
------    
---
*  __原理__    
DC(dirrect current)来源于电子工程中的直流电。简单点的说就是移除本身的均值，其使得`整张图像的均值为0`，如下:    
$$
\hspace{8mm}I(x,y) = I(x,y) - \frac{1}{W \times H}\sum_{x^{'},y^{'}}I(x^{'},y^{'}) \\
\hspace{16mm}其中:    \\ 
\hspace{20mm}公式中的第二项就是整张图像的均值
$$   
* __作用__    
coming soon    
<br />    

__Mean Normalizetion__
------    
---
*  __原理__    
均值归一化就是使`每个位置的像素的均值为0`(注意其和DC Removal的区别)。如下:    
$$
\hspace{8mm}I(x,y) = I(x,y) - \mu(x,y) \\
\hspace{16mm}其中:    \\ 
\hspace{20mm}\mu(x,y) = \frac{1}{N}\sum_{n=1}^{N}I_n(x,y)
$$   
* __作用__    
coming soon    
<br />    

__STD Normalizetion__
------    
---
*  __原理__    
标准差归一化就是使`每个位置的像素的均值为0且其每个位置像素的方差为1`(其就是在均值归一化后再除以每个位置像素的标准差)。如下:    
$$
\hspace{8mm}I(x,y) = \frac{I(x,y) - \mu(x,y)}{\sigma(x,y)} \\
\hspace{16mm}其中:    \\ 
\hspace{20mm}\sigma(x,y) = \sqrt{\frac{1}{N}\sum_{n=1}^{N}(I_n(x,y) - \mu(x,y))^2}
$$   
* __作用__    
coming soon    
<br />    
