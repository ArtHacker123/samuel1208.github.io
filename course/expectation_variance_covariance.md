---
layout: default
---

最近总是碰到期望、方差、协方差等概念。遂下定决心整理一下。参考之[bishop_PRML](http://research.microsoft.com/en-us/um/people/cmbishop/prml/)(page 20)
<br/>         

__期望(Expectation)__    
--------
也称为均值。$$f(x)$$在概率分布$$p(x)$$下的期望$$E[f]$$的定义如下：    
1.  离散形式:$$E[f] = \sum_x{f(x)p(x)}$$     
2.  连续形式:$$E[f] = \int f(x)p(x)dx$$      
当概率分布为`均匀分布`时，其与我们平常用的`算术平均值一样`（或者当`样本数无限多时`也是等于算术平均值的,__TODO给出证明__）。一般实际使用中概率分布也是取均匀分布
<br/>     

__方差(Variance)__        
--------
用来度量随机变量和其数学期望（即均值）之间的偏离程度。$$f(x)$$的方差的定义如下：    
$$var[f] = E[(f(x)-E[f(x)])^2]   \\
\hspace{14mm}= E[(f(x)^2 - 2f(x)E[f(x)] + E[f(x)]^2)]  \\    
\hspace{14mm}= E[f(x)^2] - 2E[f(x)]E[f(x)] + E[f(x)]^2  \\ 
\hspace{14mm}= E[f(x)^2] - E[f(x)]^2$$    
__要点:__当样本数为N时，求方差时除以(N-1)得到无偏移方差。`详细见bishop_PRML的Exercise1.12`    
<br/>     

__协方差(Covariance)__        
--------
用来度量两个变量之间的相关性。如果两个变量的变化趋势相同，则值为正，反之则为负。其公式如下：    
__two random variables x and y__    
$$cov(x,y) = E_{x,y}[(x-E[x])(y-E[y])]   \\
\hspace{19mm}= E_{x,y}[xy]-E[x]E[y]   
$$    
__two `vectors` of random variables x and y__    
$$    
cov(\vec x,\vec y) = E_{\vec x,\vec y}[(\vec x-E[\vec x])(\vec y-E[\vec y])]   \\
\hspace{19mm}= E_{\vec x,\vec y}[\vec x\vec y]-E[\vec x]E[\vec y]
$$    
__注意__：两个变量`相互独立`，则其协方差为0。`反之不成立`，协方差为0，只能说明两个变量`不相关`
<br/>  
<br/>     
