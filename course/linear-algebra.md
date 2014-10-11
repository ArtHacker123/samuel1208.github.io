---
layout: default
---

__Linear Algebra__
------------------
学习的是MIT的`Introduction to Linear Algebra(Gilbert Strang)`，其[公开课的视频](http://v.163.com/special/opencourse/daishu.html)可以在网易公开课上找到
<br/>      
<br/>     

__第一章要点__
------------
* __矩阵与向量的相乘用矩阵列空间的线性组合来表示__    
$$
\left(\begin{array}{c}1&2&9\\3&4&2\\2&5&0\end{array}\right)*
\left(\begin{array}{c}1\\2\\3\end{array}\right)=
1*\left(\begin{array}{c}1\\3\\2\end{array}\right)+
2*\left(\begin{array}{c}2\\4\\5\end{array}\right)+
3*\left(\begin{array}{c}9\\2\\0\end{array}\right)
$$

__第二章要点__
------------
* __高斯消元__   
将矩阵转换成上三角矩阵U
* __通过高斯消元求逆矩阵__。    
理论依据为$$A^{-1}[A\hspace{4mm}I] = [I\hspace{4mm}A^{-1}]$$
* __A=LU分解__。    
任意一个矩阵都可以进行LU分解。其中L是主对角线上元素为1的下三角矩阵，U为上三角矩阵，`其主对交线上的元素为pivot`。有时候其分解需要进行行交换，则使用PA=LU形式。Matlab中使用[L,U]=lu(A)或[L,U,P]=lu(A)。

__第三章要点__
------------
*  __零空间__    
即$$A * \vec x=0$$的所有解$$\vec x$$
*  __矩阵的秩__
行秩==列秩   
*  __$$A * \vec x= \vec b$$的所有解__
解为其特解与零空间的组合
*  __空间的基与维数__    
*  __四个空间：列空间、零空间、行空间、左零空间__    
其中行空间和零空间互为`正交补`，列空间和左零空间互为`正交补`     

__第四章要点__
------------
*  __投影__     
主要应用是来解决$$A*\vec x=\vec b$$没有解，只能求其最优解。即两边乘以$$A$$的转置$$A^T$$变成$$A^TA\vec x_*=A^T\vec b$$ ，其实 $$\vec x_*$$ 就是$$\vec b$$在`A列空间的投影`
*  __使用Gram-Schmidt方法在`独立`的空间上求其正交基的步骤__


__第五章要点__
------------

