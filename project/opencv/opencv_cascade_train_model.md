---
layout: default
---

__准备训练数据 __    
=====         
[官方介绍](http://docs.opencv.org/trunk/doc/user_guide/ug_traincascade.html)    


__Positives__    
----- 
---    
这里只介绍一种正样本的生成方法， 即在一个文件夹中有n各只有人脸的图像数据,如：    
1. 生成数据的命令    
`./opencv_createsamples  -w 24 -h 24  -num 100 -info  /path/info.dat  -vec face.vec`    
__num__ : 图片的张数    
__info.dat__ 中的数据如下:     

         \img\img_1.bmp  1 0 0 24 24    
         \img\img_2.bmp  1 0 0 24 24
2. 显示生成的样本，\<key_N\>查看下一张    
`./opencv_createsamples -show -vec face.vec`     


__Negatives__    
-----
---    
需要一个负样本图片数据路径的列表，其列表文件与图像数据的相对路径关系见[OpenCV文档](http://docs.opencv.org/trunk/doc/user_guide/ug_traincascade.html#negative-samples)    











