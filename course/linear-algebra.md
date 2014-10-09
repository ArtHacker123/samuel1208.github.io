---
layout: default
---

__Linear Algebra__
------------------
学习的是MIT的`Introduction to Linear Algebra(Gilbert Strang)`，其[公开课的视频](http://v.163.com/special/opencourse/daishu.html)可以在网易公开课上找到
<br/>      
<br/>     

__1-4章要点__
------------
*  __A=LU分解__    
任意一个矩阵都可以进行LU分解。其中L是主对角线上元素为1的下三角矩阵，U为上三角矩阵，`其主对交线上的元素为pivot`。有时候其分解需要进行行交换，则使用PA=LU形式。Matlab中使用[L,U]=lu(A)或[L,U,P]=lu(A)。     
*  __四个空间：列空间、零空间、行空间、左零空间__    
其中行空间和零空间互为`正交补`，列空间和左零空间互为`正交补`     
*  __投影__     
主要是用来解决AX=b没有解，只能求其最优解。即两边乘以A的转置A'变成A'AX=A'b，`其实X就是b在A列空间的投影`


