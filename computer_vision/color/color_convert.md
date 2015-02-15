---
layout: page
title: Color Convert
---
---

#### __RGB2YCbCr__
---
YCbCr其中Y是指亮度分量，Cb指蓝色色度分量，而Cr指红色色度分量。注意 __其与YUV是不一样的__ (转换可以参照torch的源代码)，下面的转换3个通道都在(0~255)的范围内<br />    
$$
\hspace{4mm}Y=0.299*R + 0.587*G + 0.114*B    \\
\hspace{4mm}Cr=(R-Y)*0.713 + 128      \\
\hspace{4mm}Cb=(B-Y)*0.564 + 128      
$$
     

#### __RGB2HSV__     
---
这里采用opencv的变换规则<br />    
$$
\hspace{4mm}V=max(R, G, B)    \\
\hspace{3mm}S=\begin{cases} 
\frac{V-min(R,G,B)}{V}  \hspace{4mm}if\hspace{2mm} V \neq 0\\ 
0  \hspace{30mm}otherwise
\end{cases} \\
\hspace{2mm}H=\begin{cases} 
60(G − B)/(V − min(R, G, B)) \hspace{18mm}if\hspace{2mm} V = R\\ 
120 + 60(B − R)/(V − min(R, G, B))  \hspace{4mm}if\hspace{2mm} V = G\\
240 + 60(R − G)/(V − min(R, G, B))  \hspace{4mm}if\hspace{2mm} V = B 
\end{cases}\\
\hspace{2mm}If\hspace{2mm}H<0\hspace{2mm} then\hspace{2mm} H=H+360
$$<br />     
经过上面的转换以后，HSV的范围为:    
$$
\hspace{4mm}0≤V≤1, 0 ≤S≤1, 0≤H≤360
$$<br />     
Opencv中转换为0-255，其转换如下:    
$$
\hspace{4mm}V=255V, S=255S, H=H/2
$$
