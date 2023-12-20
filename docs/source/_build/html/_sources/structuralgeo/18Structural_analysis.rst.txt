构造分析(Structural analysis)
===========================================

.. contents:: 

简介
-----------------------

尽管使用立体投影的优点现在应该是显而易见的，但涉及线与面之间角关系的问题可以用描述几何的方法来解决。
但是，如果要以图形方式解决某些结构问题，立体网的使用是必不可少的。
岩体的三维几何结构，特别是复杂岩体的三维几何结构就是其中之一。
同样的基本技术也可以应用于更简单的情况，这是一种方便的介绍方法的方式。

S-pole方法和Beta diagram方法
----------------------------------

在圆柱形褶皱中，枢纽区域可能过于光滑，或者褶皱可能太大或不完全暴露，无法对铰链线的姿态进行精确的现场测量。
如果可以测量褶皱表面上许多地方的产状，则可以通过数据的简单立体图来确定褶皱枢纽的方向。

**Problem**

* 利用下列褶皱翼部的产状，确定褶皱的轴向。::

    1. N 88 E, 16 N            4. N 41 E, 50 SE
    2. 2. N 68 E, 30 NW        5. N 35 E, 35 SE
    3. N 60 E, 45 NW           6. N 20 E, 20 E

**Methods**

1. Beta diagram : 在赤平投影图上画出所有平面。平面交于一点，这点为 :math:`\beta` 轴
2. S-pole diagram : 画出所有平面的极点，极点交于一平面，这个平面的极点为 :math:`\beta` 轴

褶皱枢纽和轴面
---------------------------

略

Lambert 等面积投影
----------------------------

如果在赤平投影上绘制在下半球的均匀分布，会发现点的分布并不均匀，点会向网格中心汇聚，这样造成了与面积
相关方法的使用困难，为了解决这个问题，通常使用 *Lambert equal-area projection* 。

.. image:: ./images/等面积投影.png
    :align: center
    :alt: Lambert 投影

考虑一个单位参考球体的过直径的铅垂面，在这个面上倾伏角为 p 的直线 P。作角 :math:`\theta = 90 - p`。
。投影面是由过极轴最低点Z'的水平面，这个点的投影P’，是由旋转Z'P得到的。如上图。

.. math:: 

    &\ r = 2sin\frac{1}{2}\theta \\
    &\ r_max = 2sin45^\circ = \sqrt{2} \\
    &\ 修正投影圆为单位圆 = r' = \sqrt{2}sin\frac{1}{2}\theta \\

微分法证明等面积：

.. image:: ./images/等面积投影证明.png
    :align: center
    :alt: 等面积投影证明

.. math:: 

    &\ 证明图中两个阴影区域相等 \\
    &\ r = 2sin\frac{1}{2}\theta \\
    &\ dA_q = d\theta t(\theta) \\
    &\ t(0) = 0 , t(\pi/2) = dt \\
    &\ t(\theta) = \frac{sin\theta}{sin(\pi/2)} = sin\theta \\
    &\ dA_q = d\theta dt sin\theta \\
    \\
    &\ rdr = d\theta sin\theta \\
    &\ dA_q = rdrdt \\
    \\
    &\  dA_t = \frac{1}{r}dtdr \\
    &\ dA_q = dA_t \\
    &\ 证明完毕

Schmidt 网
^^^^^^^^^^^^^^^^^^^^

.. image:: ./images/等面积投影网.png
    :align: center
    :alt: Schmidt net




极点网
^^^^^^^^^^^^^^^^^^^^


