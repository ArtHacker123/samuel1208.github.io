---
layout: default
---

__Chi-Square Distribution__
==============    
是gamma distribution的特例。http://www.statlect.com/subon2/ucdchi1.htm

<div class="bproof"><span class="bproof" onclick="openClose('idn1')">Proof</span></div>
<div id="idn1" class="clps"><div class="proofline">
<p>It
   can be derived as
   follows:<span class="displayed"><img class="sp" width="441px" height="372px" src="http://images2.statlect.com/ucdgam1__20.png" alt="[eq8]" /></span></p></div></div>


*  __Univariate Fomular__    
$$
\hspace{4mm}\mathcal{N}(x|\mu, \sigma^2) = \frac{1}{(2\pi\sigma^2)^{1/2}}exp\{-\frac{1}{2\sigma^2}(x-\mu)^2\}
$$     
![gaussian-distribution](./img/gaussian-distribution.png)    
*  __Properties__    
$$
\hspace{4mm}\int_{-\infty}^{\infty} \mathcal{N}(x|\mu, \sigma^2)dx=1 \\
\hspace{4mm}E[x] = \int_{-\infty}^{\infty} \mathcal{N}(x|\mu, \sigma^2)xdx = \mu  \\
\hspace{4mm}E[x^2] = \int_{-\infty}^{\infty} \mathcal{N}(x|\mu, \sigma^2)x^2dx = \mu^2 + \sigma^2 \\ 
\hspace{4mm}var[x] = E[x^2] - E[x]^2 = \sigma^2
$$

