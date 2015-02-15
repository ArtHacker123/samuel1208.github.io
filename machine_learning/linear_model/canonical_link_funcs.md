---
layout: page
title: Canonical link functions
---
不同的Active Function对应不同的Loss Function，其组合称为`Canonical link functions`。以[linear regression](linear_regression.html)、[logistic regression](./logistic_regression.html)、[softmax regression](softmax_regression.html)来说，对其Loss Function求导，他们有一个共同的梯度形式，即:    
$$
\hspace{4mm}\frac{\partial L}{\partial \theta_i} = (t-h_{\boldsymbol{\theta}}(\boldsymbol{x}))*x_i
$$    
且上面3个模型都是convex的。    


当[logistic regression](./logistic_regression.html)使用[squared error](../criterion/squared_loss.html)时。其梯度变成如下形式:    
$$
\hspace{4mm}\frac{\partial{L}}{\partial{\theta_i}}=[t-h_{\boldsymbol{\theta}}(\boldsymbol{x})]h^{'}_{\boldsymbol{\theta}}(\boldsymbol{x})*x_i \\
\hspace{4mm}\boldsymbol{when}\hspace{4mm} t=1 \hspace{4mm}and \hspace{4mm}h=0.00000001 \\
\hspace{4mm}\boldsymbol{then}\hspace{4mm} h^{'} = （1-0.00000001）*0.00000001  \simeq 0\\
\hspace{4mm}\boldsymbol{so} \frac{\partial{L}}{\partial{\theta_i}} \simeq 0
$$    
因此就算`输出与真实值的误差很大`，但是由于激活函数的梯度很小，导致最终反应在参数上的梯度变化几乎没有了。
<br />    

#### __References__  
---    
[bishop_PRML(chapter4)](http://research.microsoft.com/en-us/um/people/cmbishop/prml/)
