---
layout: default
---

数据白化whitening(也称为球化sphering)。whiten的目的是降低输入数据的冗余。更正式点说法是：    
     
1.  降低特征之间的相关性    
2.  使得所有的特征拥有相同的方差     
<br />              
     
__Whiten Experiment__
------------    
---      
[原始数据](./img/whiten.data)和[实验代码](./img/pca_2d.m)          
<br />         

__PCA_Whiten__
------------    
---         
__步骤__    
    
1.  将数据进行[PCA坐标转换](./pca.html)  
2.  使投影后的数据拥有单位方差，即    
$$
X_{Whiten,i}=\frac{X_{PCA,i}}{\sqrt{\lambda_i+\epsilon}}    \\
\hspace{8mm}其中:    \\
\hspace{12mm}\lambda是原数据协方差矩阵的特征值，也是PCA旋转后数据的每个维度上的方差 \\
\hspace{12mm}\epsilon起到一个低通滤波的功能  \\
$$     
3.  `[Optional]`在第2步的数据投射时，可以进行降维操作      
         
$$\epsilon$$__的选择__    

*   估计的方法        
1.  当数据$$X_{rot} \in [−1,1]$$时， $$\epsilon \simeq 10^{-5}$$    
2.  当数据$$X_{rot} \in [0,255]$$时， $$\epsilon \simeq 0.1$$    
*   分析的方法    
将λ按大小画出下图，其\episilon大于大多数比较小的特征值，即最好消除途中的`Long tail`    
![eigenvalues](./img/whiten_1.png)         

__注意__     
任何white的数据乘以一个`正交基的方阵`，其最终数据还是white`(TODO:附上证明)`。`必须是方阵`,这也是为什么ZCA Whiten中进行PCA不能降维的原因    
<br />    

__ZCA_Whiten__
------------    
---    
__方法__    
将PCA whiten后的数据反投射到原始的数据空间坐标，即$$X_{ZCAWhiten}=UX_{PCAWhiten}$$      
  
__Tips__   

*   U是正交矩阵，即$$U^TU=UU^T=I$$    
*   进行ZCA Whiten的时候， `在PCA Whiten步骤中不做降维操作`            
<br />        

__Reference__
-------    
--- 
1.  [Natural Image Statistics](http://www.naturalimagestatistics.net/)(Chapter 5)        
2.  [UFLDL](http://deeplearning.stanford.edu/wiki/index.php/Whitening)        
