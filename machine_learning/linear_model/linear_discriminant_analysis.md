---
layout: page
title: LDA(Linear Discriminant Analysis)
---
#### __背景__
假设$$f_k(x)$$为k类样本基于特征x的概率密度函数，且样本来之于k类的概率为$$\pi_k$$，则根据贝叶斯理论，样本x属于k类的概率为:      
$$
\hspace{4mm}P(k|x) =  \frac{P(x|k)P(k)}{P(x)} = \frac{\pi_kf_k(x)}{\sum_l^K\pi_lf_l(x)}
$$    
<br />
    
#### __LDA__     
---
* __原理__    
LDA __假设1__ 每个类的样本分布符合Gaussian分布，则LDA使用每个类的gaussian分布函数作为这个类的概率密度函数。这里以一维特征为例，k类样本的gaussian分布函数为:    
$$
\hspace{4mm}f_k(x)= \frac{1}{(2\pi\sigma_k^2)^{1/2}}exp\{-\frac{1}{2\sigma_k^2}(x-\mu_k)^2\}
$$<br />    
LDA还 __假设2__ 每个类的协方差矩阵是一样的，即$$\sigma_1 = ... = \sigma_K = \sigma$$。则其后验概率函数为:  
$$
\hspace{4mm}p_k(x) = \frac{\pi_k\frac{1}{(2\pi\sigma^2)^{1/2}}exp\{-\frac{1}{2\sigma^2}(x-\mu_k)^2\}}{\sum_{l=1}^{K}\pi_l\frac{1}{(2\pi\sigma^2)^{1/2}}exp\{-\frac{1}{2\sigma^2}(x-\mu_l)^2\}} \\
上式中分母对于每个类都是一样的因此可以忽略，并对上式取ln函数得:  \\
\hspace{4mm}\delta_k(x) = x^2 + x\frac{u_k}{\sigma^2} - \frac{u_k^2}{2\sigma^2} + ln(\pi_k) \\
由于上式中x^2对于每个类来说是常数项，因此也可以忽略。 则\delta_k(x)为:   \\
\hspace{4mm}\delta_k(x) = x\frac{u_k}{\sigma^2} - \frac{u_k^2}{2\sigma^2} + ln(\pi_k) \\
$$      
(由于$$\delta_k(x)$$是x的线性函数， __所以这也是LDA中有linear的原因__)    
__判别标准:__ 哪个类的$$\delta_k(x)$$最大，其就属于哪个类。         
<br />
其中$$\pi_k、\sigma、\mu_k$$的求解如下:    
$$
\hspace{8mm}\pi_k = n_k/n  \\
\hspace{8mm}\mu_k = \frac{1}{n_k}\sum\limits_{i:y_i=k} x_i  \\ 
\hspace{8mm}\sigma^2 = \frac{1}{n-K}\sum\limits_{k=1}^K\sum\limits_{i:y_i=k}(x_i-\mu_k)^2  \\
\hspace{8mm}其中\sigma^2可以理解为每个类带权重的样本方差的均值
$$          
<br />
__当特征维数大于1时__ ，同理可得其$$\delta_k(\boldsymbol{x})$$为:    
$$
\hspace{4mm}\delta_k(\boldsymbol{x}) = \boldsymbol{x}^T\Sigma^{-1}\boldsymbol{u_k} - \frac{1}{2}\boldsymbol{u_k^T}\Sigma^{-1}\boldsymbol{u_k}+ ln(\pi_k) \\
$$    

* __补充__    
LDA是 __Generative Learning__ 。因为其是基于P(x,y)的(即P(x,y)可以计算出来)。    
<br />    



#### __QDA(Quardic Discriminant Analysis)__
--- 
* __原理__    
QDA与LDA的唯一区别就是没有LDA的 __假设2__ , 根据[multi-gaussian distributuin](../foundation/gauss-distribution.html#multivariate-formular),可以得到其$$\delta_k(\boldsymbol{x})$$为:    
$$
\hspace{4mm}\delta_k(\boldsymbol{x}) = -\frac{1}{2}\boldsymbol{(x-u_k)}^T\Sigma_k^{-1}\boldsymbol{(x-u_k)} - \frac{1}{2}ln|\Sigma_k|+ ln(\pi_k) \\
\hspace{16mm}=-\frac{1}{2}\boldsymbol{x}^T\Sigma_k^{-1}\boldsymbol{x} +  \boldsymbol{x}^T\Sigma_k^{-1}\boldsymbol{u_k} - \frac{1}{2}\boldsymbol{u_k^T}\Sigma^{-1}\boldsymbol{u_k} - \frac{1}{2}ln|\Sigma_k|+ ln(\pi_k) \\
$$    
从上式可以看出其包含x的二次项， __这也是其名字中有Quardic的原因__    
<br />

* __补充__    
当特征维数比较多时，其 __协方差矩阵可能不可求__ (LDA也有这个问题)，这时可以假设其协方差矩阵是对角的( __即此时使用的是Naive Bayes__ ):    
$$
\hspace{4mm}f_k(\boldsymbol{x})= \prod_{j=1}^{p}f_{jk}(x_j)    \\
\hspace{8mm} 其中 :p为特征的维数   \\
\hspace{4mm}\delta_k(\boldsymbol{x})  = ln[\pi_k\prod\limits_{j=1}^pf_{kj}(x_j)]\\
\hspace{16mm}= \frac{1}{2}\sum\limits_{j=1}^{p}\frac{(x_j-u_{kj})^2}{\sigma_{kj}^2} + ln\pi_k
$$    


#### __References__   
---    
1. An Introduction to Statistical Learning



