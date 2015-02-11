---
layout: default
---

Histgram Backproject
----
---    
其主要用于查找一副图像包含指定图像中像素的概率。这里主要就OpenCV的实现来进行解释。其算法的出处见引用1。    

* __Step__    
1.  计算指定图像(ROI)的直方图H_roi     
2.  将H_roi进行归一化，如归一化到（0-255）
3.  计算查找图像中的像素属于直方图中的哪个bin，就取哪个bin中的值作为其概率值


Reference
-------
---
1.  Indexing Via Color Histograms
