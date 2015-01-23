---
layout: default
---

__注意点__
----
---
1. 每次训练时，opencv会检查当前模型保存路径下是否存在已近训练好的模型，有的话会现load 然后基于这个模型继续训练    

2. 当FP=0.5， stage=10时，其 __整体的误检率__ 为$$0.5^{10}$$. OpenCV中又在这个基础上除以weakerdepth（不清楚）

3. 在训练时，当opencv发现达到整体误检率时（假设需要100个样本，通过寻找1000个负样本才找到，这时cascade的整体误检率为100/1000），退出训练



__训练数据的更新__    
--------
---    
      
### __Positives__ 
当训练时完一个stage以后，正样本会减少，opencv会进行补偿,再加入一些能够被判别为正样本的正样本数据

### __Negatives__   
opencv的负样本的bootstrape由以下几个参数决定：    

* __scaleFactor__     
opencv现将图片缩小到最小尺寸上( __最小尺寸为offset.x+winSize.W, offset.y+winSize.H__)，然后再使用scaleFactor一步步将图片放大    
* __stepFactor__    
在尺寸上oepncv使用stepFactor*winSize作为步长，进行扫描    
* __offset, round__         
假设图像在round等于0时，offset.x=0, offset.y=0, 所有的图像都扫描一边以后，round+1，offset先在x方向进行偏移，等到offset.x>winSize.width时，y方向再偏移，然后再按照x方向,最后知道offset.y>winSize.height。 当round>winSize.width*winSize.height时，round从0开始。__(这种方式是有问题的，opencv是在外面根据整体的FP来决定是否结束训练的)__













