---
layout: page
title: HOG (Histograms of Oriented Gradients)
---
Hog是一种__局部特征__，由Dalal和Triggs在文章[1]中提出，并使用在行人检测中.

#### __步骤__
---

> 1. 图像灰度化
> 2. gamma矫正(影响不大可省略, 即$$I(x,y)=I(x,y)^{gamma}$$) 
> 3. 将图像划分成小的cell(如6x6)单元，统计其梯度方向的直方图(9个bin,且0-180最佳)
> 4. 基于cell组成block，相邻的block之间的cell可以有重叠,将block内所有cell的直方图并在一起，即为block的特征



#### __实验细节__    
--- 

* 求梯度前不要进行模糊操作，`如Gaussian、Median等，其会严重影响性能`    
* 求梯度模板越简单越好，文章中使用`[-1, 0, 1]`效果最好,即
$$
G_x (x,y)=I (x+1,y)-I (x-1,y)  \\
G_y (x,y)=I (x,y+1)-I (x,y-1)
$$

* 在进行方向统计时(`使用二次插值`)，可以用梯度幅值直接作为权重，或幅值的函数如（`取平方根，平方, 取整, 实验表明：梯度幅值最好`）


* 划分成不同的block,对每一个block内的特征向量进行归一化    
(注意此处是向量归一化，即$$\vec{v}/\sqrt{|\vec{v}|^2}  \hspace{8mm}  \sqrt{|\vec{v}|^2} = \sqrt{x_0^2+x_1^2+... +x_n^2}$$)

# L1-norm : $$\vec{v}/(|\vec{v}|_1+\epsilon)$$ 基数1表示进行1次归一化操作     
# L1-sqrt : $$\sqrt{\vec{v}/(|\vec{v}|_1+\epsilon)}$$ 基数1表示进行1次归一化操作     
# L2-norm : $$\vec{v}/\sqrt{|\vec{v}|^2_2+\epsilon^2}$$ 基数2表示进行2次归一化操作     
# L2-Hys : 进行L2-norm操作，并第一次操作中：设一个（如threshold=0.2）， 大于threshold的都设为0.2    
L2-Hys效果最好


#### __References__
---
1. Histograms of Oriented Gradients for Human Detection
