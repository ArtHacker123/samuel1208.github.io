---
layout: page
title: Newton Method
---
---    
* __原理__    
其方法是使得$$x_0$$收敛于$$x_*$$，其中$$f'(x_*) = 0$$。函数的二阶泰勒公式展开为:    
$$
\hspace{4mm}f_T(x_{n+1}) = f(x_n) + f'(x_n)(x_{n+1}-x_n) + \frac{1}{2}f''(x_n)(x_{n+1}-x_n)^2
$$<br />        
当$$f_T'(x_{n+1})=0$$时，$$x_{n+1}$$为极值点，即:    
$$
\hspace{4mm}f_T'(x_{n+1}) = f'(x_n) + f''(x_n)(x_{n+1}-x_n)=0 \\
\hspace{8mm}=>x_{n+1} = x_n - \frac{f'(x_n)}{f''(x_n)}
$$    
    
* __与Gradient Descent的比较__
1.  newton method需要除以一个Hessian矩阵（即二阶偏导），即乘以其逆
$$
\theta = \theta - H^{-1}\frac{\partial}{\partial\theta}J(\theta)   
$$    
2. newton method不需要学习率参数$$\alpha$$
3. newton method收敛更快,`当f(x)在`$$x_n$$`附近接近于二次函数时，其只需要一步更新就可以到达极值点`
4. newton method当特征维数较大时， 其Hessian可能不存在逆    
<br />    
