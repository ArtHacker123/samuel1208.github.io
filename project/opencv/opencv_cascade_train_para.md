---
layout: default
---

__训练参数__    
=====         
使用opencv_traincascade可执行程序进行训练.如：    
`./opencv_traincascade -data ./model/  -vec /home/samuel/data/face_train/train/opencv/face.vec -bg  /home/samuel/data/face_train/train/opencv/neg.lst -numPos 100 -numNeg 100 -numThreads 1  -numStages 10 -minHitRate 0.9 -maxFalseAlarmRate 0.5  -maxDepth 1 -weightTrimRate 0.95 -bt RAB`     

详细见[官方介绍](http://docs.opencv.org/trunk/doc/user_guide/ug_traincascade.html#cascade-training)    

#  exe para    
* __-data__    
训练模型的保存路径。 __(注意：每次训练时，opencv会检查当前模型保存路径下是否存在已近训练好的模型，有的话会现load 然后基于这个模型继续训练)__    
* __-vec__    
正样本的数据路径    
* __-bg__    
负样本列表文件的路径    
* __-numPos__    
训练中正样本的个数    
* __-numNeg__    
训练中负样本的个数    
* __-numThreads__    
训练中线程的使用个数    
* __-numStages__    
cascade的层数, default 20    

# cascade para    
* __-featureType<{HAAR(default), LBP}>__    
   在haar特征时，有一个mode参数控制是否使用斜的haar特征    
* __-w__     
   训练时的窗口宽度,default 24     
* __-h__      
   训练时的窗口高度,default 24    

# boost para
* __-bt <{DAB, RAB, LB, GAB(default)}>__    
   adaboost的类型     
* __-minHitRate__    
   即每个cascade的检测率, default 0.995    
* __-maxFalseAlarmRate__    
   即每个cascade的误检率, default 0.5     
* __-maxWeakCount__     
   即每个cascade中弱分类器的个数, default 100      
* __-maxDepth__    
   弱分类器树的深度, default 1    
* __-weightTrimRate__    
  todo 搞清楚, default 0.95



    












