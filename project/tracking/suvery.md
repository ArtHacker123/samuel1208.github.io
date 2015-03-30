---
layout: page
title: Tracking Benchmark
---
2013年[Visual Tracker Benchmark](https://sites.google.com/site/trackerbenchmark/benchmarks/v10)对多种算法进行了一些评测，本文主要是在它的基础上进行了一些总结。    

__说明__    
1. 下面的分析`基于单个物体跟踪`    
2. 被跟踪物体的大小对性能的影响没有考虑进来    

#### __Mean Shift__    
1. [基于meanshift的一个中文blog](http://blog.csdn.net/gxf1027/article/details/8693515)    

<table  border="1">
  <tr align="center">
    <td>Year</td><td>Name</td><td>Model</td><td>Model Update</td><td>Search Mode</td>
    <td>Adaptive Size</td><td>code</td><td>FPS</td><td>Size</td><td>Pros</td><td>Cons</td>
  </tr>  
  <tr align="center">
    <td>1998</td><td>Camshift[6]</td><td>-</td><td>No</td><td>-</td>
    <td>No</td><td>C++</td><td>～300</td><td>-</td>
    <td align="left" valign="top">1.速度快<br/>2.原理复杂度低</td>
    <td align="left" valign="top">1.结果依赖于直方图反射的结果,效果较差。如在人脸跟踪中，其会跟踪到所有肤色<br>2.对噪声比较敏感</td>
  </tr>
  <tr align="center">
    <td>2003</td><td>KMS[5]</td><td>-</td><td>No</td><td>-</td>
    <td>No</td><td>C++</td><td>～3000</td><td>-</td>
    <td align="left" valign="top">1.速度快<br/>2.原理复杂度低</td>
    <td align="left" valign="top"></td>
  </tr>  
</table>

#### __Tracking by detection__    

<table  border="1">
  <tr align="center">
    <td>Year</td><td>Name</td><td>Model</td><td>Model Update</td><td>Search Mode</td>
    <td>Adaptive Size</td><td>code</td><td>FPS</td><td>Size</td><td>Pros</td><td>Cons</td>
  </tr>  
  <tr align="center">
    <td>2015</td><td><a href="http://home.isr.uc.pt/~henriques/circulant/">KCF[1]</a></td>
    <td>-</td><td>Yes</td><td>-</td>
    <td>No</td><td>Matlab</td><td>200+</td><td>-</td>
    <td align="left" valign="top">1.基于CSK改善了被遮挡时跟踪失败的问题<br>2.效果与StrucK和TLD可比较</td>
    <td align="left" valign="top">1.目标消失以后，无法找回来</td>
  </tr>  
  <tr align="center">
    <td>2012</td><td><a href="http://home.isr.uc.pt/~henriques/circulant/">CSK[2]</a></td>
    <td>-</td><td>Yes</td><td>-</td>
    <td>No</td><td>Matlab</td><td>250+</td><td>-</td>
    <td align="left" valign="top">1.速度快<br/>2.原理复杂度低<br/>3.抗噪声</td>
    <td align="left" valign="top">1.被遮挡时，容易导致跟踪失败<br/>2.目标消失以后，无法找回来</td>
  </tr>  
  <tr align="center">
    <td>2011</td><td><a href="http://www.samhare.net/research/struck">Struck[3]</a></td><td>-</td><td>Yes</td><td>-</td>
    <td>No</td><td>C++</td><td>20.2</td><td>-</td>
    <td>-</td>
    <td align="left" valign="top">1.速度慢<br/>2.原理复杂度高</td>
  </tr>
  <tr align="center">
    <td>2010</td><td>TLD[4]</td><td>-</td><td>Yes</td><td>-</td>
    <td>No</td><td>C++</td><td>28.1</td><td>-</td>
    <td>-</td>
    <td align="left" valign="top">1.速度慢<br/>2.原理复杂度高</td>
  </tr>  
</table>
    
<br />

#### __References__    
---    
1. High-Speed Tracking with Kernelized Correlation Filters
2. Exploiting the Circulant Structure of Tracking-by-detection with Kernels
3. Struck: Structured Output Tracking with Kernels
4. P-N Learning: Bootstrapping Binary Classifiers by Structural Constraints 
5. D. Comaniciu, V. Ramesh, and P. Meer. Kernel-Based Object Tracking 
6. Computer Vision Face Tracking For Use in a Perceptual User Interface 

