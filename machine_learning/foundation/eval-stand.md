---
layout: page
title: Evaluating Standards 
---
主要罗列一些机器学习中常用的评估方法    

#### __Recall And Precision__     
---

<table  border="1">
  <tr align="center">
    <td></td><td>Ground Truth Pos</td><td>Ground Truth Neg</td>
  </tr>  
  <tr align="center">
    <td>Predict As Pos</td><td>True Pos</td><td>False Pos</td>
  </tr>
  <tr align="center">
    <td>Predict As Neg</td><td>False Neg</td><td>True Neg</td>
  </tr>  
</table>    
<br />
$$
Precision = \frac{True Pos}{True Pos + False Pos} \\
Recall \hspace{8mm} = \frac{True Pos}{True Pos + False Neg}  \\   
F1_{score} (or F_{score}) = 2*\frac{precision*recall}{precision+recall}
$$
