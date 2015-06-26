---
layout: page
title: Adaboost
---    
这里主要介绍一下`Discrete Adaboost`、`Real Adaboost`以及`Gentle Adaboost` 的实现，详细见文章[3]

__说明__:   
   
> 1. Adaboost中更新每一层的权重可以用所有层的弱分类器吗? `不可以，那就多次叠加了`

#### __Discrete Adaboost__
---    
详细见文章[3], 其弱分类器的设计可以见文章[1],或决策树等， 详细步骤如下:    

* __Input__     
$$(x_1,y_1)... (x_n, y_n) ,  \hspace{8mm}y_i\in \{-1,1\} 或者 \{0, 1\} $$


* __初始化权重值w(也是概率分布D)__     
$$w_{i} = \frac{1}{N} \hspace{8mm}(N为第样本的个数)$$     

* __For t=0, 1...T:__    
1. 使用拥有最小$${err}_t$$的弱分类器作为$$h_t$$， $$h_t(x)\in\{-1,1\},或者\{0,1\}$$     
$${err}_t = \sum_i^nw_i|h_j(x_i)-y_i|$$    
$${err}_t$$必须小于0.5,`大于0.5需要退出循环`。因为大于0.5 则下一步$$\beta_t$$就会大于1，无法正确更新权重    
2. 更新权重    
减小分对的权重,  增大分错的权重(或不变)     
$$
\begin{cases}
w_{t+1,i} =w_{t,i}*\beta_t \hspace{8mm} &if \hspace{4mm}  h_t(x_i)=y_i \\
w_{t+1,i} =w_{t,i}*\beta_t^{-1} \hspace{6mm} &if\hspace{4mm}   h_t(x_i)!=y_i \\
\end{cases}
\beta_t = \frac{err_t}{(1-{err}_t)}
$$
3. 归一化权重值    
$$ w_{t,i} = \frac{w_{t,i}}{\sum_{j=1}^nw_{t,j}}$$    

* __最终的强分类器__     
$$
y = \begin{cases}
sign[\sum\limits_{t=0}^{T}\alpha_th_t(x)]  & if \hspace{4mm} h_t(x) \in \{-1, 1\} \\
sign[\sum\limits_{t=0}^{T}\alpha_th_t(x)-\frac{1}{2}\sum\alpha_t]  & if \hspace{4mm} h_t(x) \in \{0, 1\} 
\end{cases} \\
其中:  \\
\hspace{8mm}\alpha_t = log(1/\beta_t)
$$
<br />    

#### __Real Adaboost__
---    
__步骤__    
详细见文章[3]    

* __Input__     
$$(x_1,y_1)... (x_n, y_n) , \hspace{8mm}y_i\in Y(1, -1)$$    

* __初始化权重值w(也是概率分布D)__    
$$w_{i} = \frac{1}{N} \hspace{8mm}(N为第样本的个数)$$         

* __For t=0, 1...T:__    
1. 基于一个`Criteria`挑选最佳的弱分类器$$h_t$$    
$$
h_t = \frac{1}{2}log[p(y=1|x)/(1-p(y=1|x))] \\
$$
2. 更新权重     
$$ w_{t+1}(i) = w_t(i)exp[-y_ih_t(x)]$$   
3. 归一化权重    
$$ w_{t+1,i} = \frac{w_{t,i}}{\sum_{j=1}^nw_{t,j}}$$  

* __最终分类器__    
$$H(x) = sign[\sum_{t=1}^Th_t(x)-b]$$     b是个阈值默认为0           
`或者写成自信度函数`    
$$
{Conf}_H(x) = |\sum_{t=1}^Th_t(x)-b|
$$    
<br />    

__弱分类器的设计__

*  文章[2]中的设计     
1. 在每个特征维上, 将样本特征分为n个空间    
2. 计算每个空间中计算正负样本的权重和         
$$
W_j^+ = \sum D(x| y=1),  W_j^- = \sum D(x| y=-1)\\
p(x|y=1) = \frac{W_j^+}{W_j^+ + W_j^-} \hspace{4mm}当x在空间j上时\\
h(x) =\frac{1}{2}ln(\frac{p(y=1|x)}{1-p(y=1|x)}) \\
\hspace{9mm}=\frac{1}{2}ln(\frac{\frac{W^{+1}_j}{W^{-1}_j+W^{+1}_j}}{1-\frac{W^{+1}_j}{W^{-1}_j+W^{+1}_j}})\\     
\hspace{9mm}=\frac{1}{2}ln(\frac{W^{+1}_j+\epsilon}{W^{-1}_j+\epsilon})\\     
其中:  \\
\hspace{4mm}\epsilon 为一个小整数。防止除0 \\
$$    
3. 寻找最佳弱分类器的`Criteria`如下：  
$$
Min[Z]=Min[2\sum_j\sqrt{W^{+1}_jW^{-1}_j}] \\ 
其中:  \\
\hspace{4mm}系数2是公式形式上的需要，没有实际意义
$$    

#### __Gentle Adaboost__
---    
__步骤__    
详细见文章[3]，其实就是基于weight MSE的线性回归    

* __Input__     
$$(x_1,y_1)... (x_n, y_n) , \hspace{8mm}y_i\in Y(1, -1)$$    

* __初始化权重值w(也是概率分布D)__    
$$w_{i} = \frac{1}{N} \hspace{8mm}(N为第样本的个数)$$         

* __For t=0, 1...T:__    
1. 基于最小化`weighted MSE`挑选最佳的弱分类器$$h_t$$    
$$
h_t = p(y=1|x) - p(y=-1|x) \\
MSE = \sum\limits_{i=1}^n ((h_t-y_i)*w_i))^2
$$
2. 更新权重     
$$ w_{t+1}(i) = w_t(i)exp[-y_ih_t(x)]$$   
3. 归一化权重    
$$ w_{t+1,i} = \frac{w_{t,i}}{\sum_{j=1}^nw_{t,j}}$$  

* __最终分类器__    
$$H(x) = sign[\sum_{t=1}^Th_t(x)-b]$$     b是个阈值默认为0           
`或者写成自信度函数`    
$$
{Conf}_H(x) = |\sum_{t=1}^Th_t(x)-b|
$$    

* __效果__    
在人脸检测上，与`Real Adaboost`相比较，其`Recal`要好`Real Adaboost`,但是误检也会高一点
<br />    


#### __References__    
---
1.  Robust Real-Time Face Detection
2.  Fast Rotation Invariant Multi-View Face Detection Based on Real Adaboost
3.  Additive Logistic Regression: A statistic view of boosting
