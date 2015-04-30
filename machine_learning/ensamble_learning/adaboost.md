---
layout: page
title: Adaboost
---    
这里主要介绍一下`Discrete Adaboost`和`Real Adaboost` 的实现，其一些注意点如下:    
   
> 1. Adaboost中更新每一层的权重可以用所有层的弱分类器吗? `不可以，那就多次叠加了`

#### __Discrete Adaboost__
---    
详细见文章[1], 其适合`多类分类`， 详细步骤如下:    

* __Input__     
$$(x_1,y_1)... (x_n, y_n) ,  y_i\in Y(1, 2, ...K) $$


* __初始化权重值w(也是概率分布D)__     
$$w_{c_i} = \frac{1}{Cn_c} \hspace{8mm}(n_c$$为第c类样本的个数 ，C为类数，这样可以使每一类的权重和相等$$     

* __For t=0, 1...T:__    
1. 归一化权重值    
$$ w_{t,i} = \frac{w_{t,i}}{\sum_{j=1}^nw_{t,j}}$$    
2. 对不同的特征训练若干弱分类器$$h_j$$,寻找最小的误差值$${err}_t$$的弱分类器作为$$h_t$$      
$$ {err}_t = \sum_i^nw_i|h_j(x_i)-y_i|$$    
$${err}_t$$(`是所有的错误率，所以多类也是0.5`)必须小于0.5,`大于0.5需要退出循环`。因为大于0.5 则下一步$$\beta_t$$就会大于1，无法正确更新权重    
3. 更新权重    
减小分对的权重,  增大分错的权重(或不变)     
$$
w_{t+1,i} =w_{t,i}*\beta_t \hspace{8mm} if \hspace{4mm}  h_t(x_i)=y_i \\
w_{t+1,i} =w_{t,i}*\beta_t^{-1} \hspace{8mm} if\hspace{4mm}   h_t(x_i)!=y_i \\
\beta_t = \frac{err_t}{(1-{err}_t)}
$$

* __最终的强分类器__     
$$
y = argmax(h_{final}(x))   \\
其中:  \\
\hspace{8mm}h_{final}(x) = \sum\alpha_t h_t(x)  \\
\hspace{8mm}\alpha_t = log(1/\beta_t) \\
\hspace{8mm}h_t(x)为[0,0,1,0]_K的形式, 即当前样本被第t个分类器判给了哪个类
$$    
`二类情况下大于`$$\frac{1}{2}\sum\alpha_t$$即可    
<br />    

#### __Real Adaboost__
---    
详细见文章[2], 其只适合`二类分类`， 详细步骤如下:    

* __Input__     
$$(x_1,y_1)... (x_n, y_n) , \hspace{8mm}y_i\in Y(1, -1)$$    

* __初始化权重值w(也是概率分布D)__    
$$wp_i = \frac{1}{2m}, wn_i=\frac{1}{2l}\hspace{4mm} (m,l分别为正负样本的个数)$$    

* __For t=0, 1...T:__    
1. 在每个特征维上, 将样本特征分为n个空间    
2. 在每个空间中计算正负样本的权重和         
$$ {W}^j_l = P(x_i \in X_j , y_i=l) = \sum_{i}D_t(i)  \hspace{4mm}其中: l \in(1,-1)$$    
3. 其空间上的判决函数为h     
$$  
x \in X_j, h(x) =\frac{1}{2}ln(\frac{W_{+1}^j+\epsilon}{W_{-1}^j+\epsilon})\\     
其中:  \\
\hspace{4mm}\epsilon 为一个小整数。防止除0 \\
\hspace{4mm}判决函数前面的系数1/2是公式上的意义
$$    
4. 计算归一化因子    
$$
Z=2\sum_j\sqrt{W_{+1}^jW_{-1}^j} \\ 
其中:  \\
\hspace{4mm}系数2是公式形式上的需要，没有实际意义
$$    
5. 挑选最小的$$Z_t$$的分类函数作为这一层的$$h_t$$    
6. 更新权重     
$$ D_{t+1}(i) = D_t(i)exp[-y_ih_t(x_j)]$$   
7. 归一化权重    
$$ w_{t,i} = \frac{w_{t,i}}{\sum_{j=1}^nw_{t,j}}$$  

* __最终分类器__    
$$H(x) = sign[\sum_{t=1}^Th_t(x)-b]$$     b是个阈值默认为0           
`或者写成自信度函数`    
$$
{Conf}_H(x) = |\sum_{t=1}^Th_t(x)-b|
$$    
<br />    


#### __References__    
---
1.  Robust Real-Time Face Detection
2.  Fast Rotation Invariant Multi-View Face Detection Based on Real Adaboost
