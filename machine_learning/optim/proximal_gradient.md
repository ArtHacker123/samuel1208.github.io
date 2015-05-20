---
layout: page
title: Proximal Gradient 
---
---    
是一种一般化的解决 `non-differentiable convex optimization` 的方法. 即如下:    
$$
\hspace{4mm}minimize_x \hspace{8mm} f_1(x)+f_2(x)+...+f_n(x) 
$$    
其中`所有f都是convex的，但部分是不可求导的`，这样就不能用传统的Gradient Descent方法。    
Proximal gradient就是用来解决这类问题的，其主要分开求解，即每个函数独自的考虑（They a re called proximal because each non smooth function among f_1, . . . , f_n is involved via its proximity operator）， 比较典型的这类算法有: [ISTA](./fista.html)、, projected Landweber, projected gradient, alternating projections等，详细讨论见[1]

#### __Referance__
---    
1.  Combettes. "Proximal Splitting Methods in Signal Processing"

