---
layout: default
---

__PSD(Predictive Sparse Decomposition)__
========
今天的主题是08-11年比较火热的sparse coding。今天谈的算法是[Yann LeCun](http://yann.lecun.com)组[Koray](http://koray.kavukcuoglu.org/index.html)
的PSD(Predictive Sparse Decomposition)系列算法。其主要的贡献是在`推断过程中不需要再来求解`其稀疏表达，而是使用推断函数来得到近似的稀疏表达。

__Sparse Coding__
-------    
---   
传统Sparse Coding的求解过程如下：    
$$
\hspace{8mm}min\hspace{4mm}|Z|_0 \hspace{4mm} s.t. \hspace{4mm} Y=BZ     \hspace{8mm}(1)\\
\hspace{16mm}其中:  \\
\hspace{20mm}Y \in R^n为输入信号  \\
\hspace{20mm}Z \in R^m为稀疏编码系数  \\
\hspace{20mm}B \in R^{m\times n}为基也称为字典\\
$$    
由于$$l^0_{norm}$$求解太过复杂，因此采用$$l^1_{norm}$$替代。文章[4](__TODO__)与[Convex Optimization](http://stanford.edu/~boyd/cvxbook/)一书中证明了，$$l^1_{norm}$$具有同样的效果。因此其求解形式编程了如下形式(`Basis Pursuit Denoising`)：    
$$
\hspace{8mm}min\hspace{4mm}L(Y,Z;B) = \frac{1}{2}|Y-BZ|^2_2 + \lambda|Z|_1\hspace{8mm}(2)\\
$$    
基于样本集学习的时候，一般是先固定B学习Z，然后再固定Z学习B，如此反复迭代只到收敛。`推断时，固定B，通过式(2)求解不同样本的Z，在推断时进行求解显然性能上不允许`    
<br />    

__PSD(Predictive Sparse Decomposition)__    
-------    
---   
PSD是由[Koray](http://koray.kavukcuoglu.org/index.html)2008年在文章[1]中提出的。其主要的思想就是在式(2)后面加上一个推断函数。其形式如下：    
$$
\hspace{8mm}min\hspace{4mm}L(Y,Z;B,P_f) = |Y-BZ|^2_2 + \lambda|Z|_1 + \alpha|Z-F(Y;P_f)|^2_2 \hspace{4mm}(3)\\
\hspace{16mm}其中: \\
\hspace{20mm}F(Y;G,W,D) = Gtanh(WY+D) \\
\hspace{20mm}P_f指的是参数{G\in R^{m\times m}的对角矩阵,W\in R^{m\times n},D\in R^m}\\
$$    
__学习时__    

1.  当$$\alpha=0$$时,式(3)变成了式(2)。这样先学习得到B、Z。然后再学习得到推断函数的参数    
2.  当$$\alpha>0$$时,学习步骤先固定$$P_f$$与B，学习Z，然后在固定Z学习$$P_f$$与B。如此反复迭代只到收敛(作者使用梯度下降进行学习)。        

__推断时,有两种方法求解Z__    

1.  固定B与推断函数，根据式(3)使用梯度下降迭代的求解Z    
2.  `直接使用推断函数F(Y;G,W,D)`    
<br />       

__Topographic PSD__
-------    
---   
2009年[Koray](http://koray.kavukcuoglu.org/index.html)在文章[2]中基于文章[1]引入了地形学`(即相似的特征组织在一起)`属性。如下图所示:    
![Topographic map](./img/psd_1.png)    
其主要思想就是将式(3)中`第二项`Z的$$l^1_{norm}$$约束`变成了一种含有2维性质的约束`。如下图所示：    
![psd_2](./img/psd_2.png)     
其中有K个重叠的采样窗口(每个为$$P_i$$)，$$W_i$$是`固定的高斯分布值`。    
因此最终式(3)变成了如下式(4):    
$$
\hspace{8mm}min\hspace{4mm}L(Y,Z;B,P_f) = |Y-BZ|^2_2 + \lambda\sum_{i=1}^{K}v_i + \alpha|Z-F(Y;P_f)|^2_2 \hspace{4mm}(4)\\
$$    
学习步骤以及推断同上面的PSD。__通过作者的实验获得以下一些信息__。      
  
1.  学习得到的字典B和推断函数中的参数W，`都拥有地形学的属性`    
2.  字典B与推断函数分开学习(即上面PSD学习时的第一种情况$$\alpha=0$$)，`会导致的推断函数的近似结果不够稀疏,且训练时间加长`    
<br />    

__Convolutional PSD__
-------    
---   
2010年[Koray](http://koray.kavukcuoglu.org/index.html)在文章[3]中提出的。    
coming soon    
<br />  

__Reference__
-------    
--- 
1.  Fast Inference in Sparse Coding Algorithms with Applications to Object Recognition      
2.  Learning Invariant Features through Topographic FilterMaps     
3.  Learning Convolutional Feature Hierarchies for Visual Recognition        
4.  Optimally sparse representation in general (nonorthog- onal) dictionaries via ℓ1 minimization(DL Donoho and M Elad) 
