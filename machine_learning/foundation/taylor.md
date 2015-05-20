---
layout: page
title: Taylor Fromula
---
---
泰勒公式`是一个用函数在某点的信息描述其附近取值的公式`。如果函数足够平滑的话，在已知函数在某一点的各阶导数值的情况之下，泰勒公式可以用这些导数值做系数构建一个多项式来近似函数在这一点的邻域中的值。`泰勒公式还给出了这个多项式和实际的函数值之间的偏差`    

* __原理__    
对于正整数`n`，若函数f(x)在闭区间[a,b]上`n`阶连续可导，且在(a,b)上`n+1`阶可导,对任意$$x\in[a,b]$$,有如下公式:    
$$
\hspace{4mm}f(x) = \frac{f(a)}{0!} + \frac{f'(a)}{1!}(x-a)+\frac{f''(a)}{2!}(x-a)^2+...+\frac{f^n(a)}{n!}(x-a)^n+R_n(x)    \\
\hspace{8mm}其中:     \\
\hspace{12mm}R_n(x)是泰勒公式的余项，其是(x-a)^n的高阶无穷小
$$    
其泰勒公式余项$$R_n(x)$$可以有多种形式[wiki](http://baike.baidu.com/link?url=VBJ6TAYv5K1pzc2OsCCMY_-VfNu6Hy7jHB5JVS43xnaCBvwJbxuo_0EUb8Qhck1obnLaho6gpE5MfL4kL7glqq)，如拉格朗日余项：    
$$
\hspace{4mm}R_n(x) = f^{n+1}(a+\theta(x-a))\frac{(x-a)^{n+1}}{(n+1)!}
$$
