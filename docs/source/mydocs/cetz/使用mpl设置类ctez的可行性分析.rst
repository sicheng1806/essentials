使用matplotlib设计类ctez的可行性分析
**************************************

.. contents:: 

预期用法
============

.. code:: python 

    import matplotlib.pyplot as plt 
    import pytez 

    fig = plt.figure()
    canvas = fig.subplots(projection="canvas")
    with canvas : 
        from pytez.draw import * 
        ...# Your draw

    # 或者

    cv = fig.subplots(projection="canvas")
    cv.line(data) #...

基础特性
============

1. 基本画图函数的api设计
   
   1. 画图的形状通过点和其他长度单位确定，点可以使用不同的坐标表达。对应不同的格式。
   2. 一个锚点标记系统，每个函数都具有name属性
   3. 样式的设计，采用和matplotlib一样的设置

2. 数据空间为二维或三维直角坐标系统。暂时只考虑二维，对于三维的处理日后再考虑设计。
3. 数据空间的数据输入多种多样，由统一的转换函数处理。
4. 设置图形样式的方式支持通过函数统一设置
5. 变换采用和axes同样的变化。
6. 对于画布来说没有刻度线，坐标轴等复杂的要素，所需的将是可设定背景色的空白画布以及一系列绘图的函数api。
7. 提供了一些对一组图像做处理的函数
8. 提供了一些变换函数

开发日记
============

date(2024/1/23),1
----------------------------

首先，需要精简axes类设计出canva投影类。

目前可以直接继承axes类，更改一些初始配置就行。

