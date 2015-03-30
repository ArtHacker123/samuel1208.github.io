---
layout: page
title: Background Substraction Benchmark
---

__说明__:    
1. 下面的分析`基于单个物体跟踪`    
2. 被跟踪物体的大小对性能的影响没有考虑进来    

<table  border="1">
  <tr align="center">
    <td>Year</td><td>Name</td><td>Model</td><td>Model Update</td><td>Search Mode</td>
    <td>Adaptive Size</td><td>code</td><td>FPS</td><td>Resolution</td><td>Pros</td><td>Cons</td>
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
  <tr align="center">
    <td>1998</td><td>Camshift[5]</td><td>-</td><td>No</td><td>-</td>
    <td>No</td><td>C++</td><td>～300</td><td>-</td>
    <td align="left" valign="top">1.速度快<br/>2.原理复杂度低</td>
    <td align="left" valign="top">1.结果依赖于直方图反射的结果,效果较差。如在人脸跟踪中，其会跟踪到所有肤色<br>2.对噪声比较敏感</td>
  </tr>
</table>
    
<br />

#### __References__    
---    

