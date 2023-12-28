MODFLOW数值模拟基本原理
==========================

MODFLOW是应用有限差分法解决地下水数值模拟的软件。目前是运用有限差分法解决
地下水数值模拟的前驱。

有限差分方程的导出
---------------------

**数学模型**

多孔介质中连续密度的地下水3维运动的偏微分方程为

.. matH:: 
    
    div(\mathbf(K)\cdot\mathrm{D}H) + W = S^s H_t \Leftrightarrow  \\
    \nabla(\mathbf(K)\cdot\nabla H) + W = S^s H_t \Leftrightarrow  \\
    (K^xH_x)_x + (K^y H_y)_y + (K^z H_z)_z + W = S^s H_t \\

* K 是渗流系数，单位(L/T)
* H 是水头,单位(L)
* W 是每单位体积的体积流量，表示源项，单位(:math:`T^{-1}`)
* :math:`S_s` 是贮水系数，参见承压水中贮水系数 :math:`\mu_s`
  
**空间离散约定**

使用矩形离散空间，划分为行、列、层。
* 行列数、层数用 NROW,NLAY,NALY 表示。
* i 表示行索引(2005 以 1 开始)， j 表示列索引， k 表示层索引
* 每一个单元中都用用于计算的 “node” ， 取单元中心
* 行列层宽度在推导中用 :math:`\Delta c_i,\Delta x_j \Delta v_k`。我采用 :math:`\Delta x_j,\Delta y_i ,\Delta v_k`



**有限差分方程**

**step 1**

.. math:: \sum Q_i = SS \frac{\Delta h}{\Delta t}\Delta V

* :math:`Q_i` 是流项
* :math:`SS`  有限差分公式的贮水系数。等同于数学模型中的 :math:`S_s`。

约定： 下标 i,j-1/2,k 表示由 i,j,k 流入 i,j,k。

**step 2**

每一时间步长：

.. math:: q_{i,j-1/2,k} = KR_{i,j-1/2,k}\Delta y_i \Delta v_k \frac{H_{i,j-1,k}-H_{i,j,k}}{\Delta x_{j-1/2}}

* :math:`q_{i,j-1/2,k}` 为这一时间步长由(i,j-1,k) 流入 (i,j,k) 的水流体积。
* :math:`KR_{i,j-1/2,k}` 为渗透系数，等于 :math:`K_x`

令 :math:`CR_{i,j-1/2,k}` 为结点 (i,j,k) 与 (i,j-1,k)直接的传导系数：

.. math:: CR_{i,j-1/2,k} = KR_{i,j-1/2,k}\frac{\Delta y_i\Delta v_k}{\Delta x_{j-1/2}}

则

.. math:: q_{i,j-1/2,k} = CR_{i,j-1/2,k}(H_{i,j-1,k}-H_{i,j,k})

同理，对每一个结点有:

.. math:: 
    
    六面流项 = 
    \left\{\begin{matrix}
     q_{i,j-1/2,k} = CR_{i,j-1/2,k}(H_{i,j-1,k}-H_{i,j,k}) \\
     q_{i,j+1/2,k} = CR_{i,j+1/2,k}(H_{i,j,k}-H_{i,j+1,k}) \\
     q_{i-1/2,j,k} = CC_{i-1/2,j,k}(H_{i-1,j,k}-H_{i,j,k}) \\
     q_{i+1/2,j,k} = CC_{i+1/2,j,k}(H_{i,j,k}-H_{i+1,j,k}) \\
     q_{i,j,k-1/2} = CV_{i,j,k-1/2}(H_{i,j,k-1}-H_{i,j,k}) \\
     q_{i,j,k+1/2} = CV_{i,j,k+1/2}(H_{i,j,k}-H_{i,j,k+1}) 
    \end{matrix}\right.

**step 3**

上式只计算了结点六个面流入的水量，对于第n项外部源：

.. math:: a_{i,j,k,n} = p_{i,j,k,n}H_{i,j,k} + q_{i,j,k,n}

* :math:`a_{i,j,k,n}` 为第n项外部源
* :math:`p_{i,j,k,n} 和 q_{i,j,k,n}` 为第n项外部源系数

总的外部源：

.. math:: \sum\limits_{n=1}{N}a_{i,j,k,n} = \sum\limits_{n=1}{N}p_{i,j,k,n}H_{i,j,k} + \sum\limits_{n=1}{N}q_{i,j,k,n}

令 :math:`P_{i,j,k} = \sum\limits_{n=1}{N}p_{i,j,k,n}` 和 :math:`Q_{i,j,k} = \sum\limits_{n=1}{N}q_{i,j,k,n}`

则

.. math:: \sum\limits_{n=1}{N}a_{i,j,k,n} = P_{i,j,k}H_{i,j,k} + Q_{i,j,k}

**step 4**

总的有限差分方程为

.. math:: 

    &\ q_{i,j-1/2,k}+q_{i,j+1/2,k}+q_{i-1/2,j,k} + q_{i+1/2,j,k}+q_{i,j,k-1/2}+q_{i,j,k+1/2} \\
    &\ + P_{i,j,k}H_{i,j,k} + Q_{i,j,k} = SS_{i,j,k}(\Delta x_j \Delta y_i \Delta v_k)\frac{\Delta H_{i,j,k}}{\Delta t}

扩写成:

.. math:: 

    &\ \quad CR_{i,j-1/2,k}(H_{i,j-1,k}-H_{i,j,k}) + CR_{i,j+1/2,k}(H_{i,j,k}-H_{i,j+1,k})\\
    &\ +  CC_{i-1/2,j,k}(H_{i-1,j,k}-H_{i,j,k}) + CC_{i+1/2,j,k}(H_{i,j,k}-H_{i+1,j,k}) \\
    &\ + CV_{i,j,k-1/2}(H_{i,j,k-1}-H_{i,j,k}) + CV_{i,j,k+1/2}(H_{i,j,k}-H_{i,j,k+1}) \\
    &\ + P_{i,j,k}H_{i,j,k} + Q_{i,j,k} \\
    &\ = SS_{i,j,k}(\Delta x_j \Delta y_i \Delta v_k)\frac{\Delta H_{i,j,k}}{\Delta t}

**step 5**

第m时间步下：

又 :math:`\frac{\Delta H_{i,j,k}}{\Delta t} = \frac{H_{i,j,k}^m - H_{i,j,k}^{m-1}}{t^m-t^{m-1}}`

有限差分方程变为：

.. math:: 

    &\ \quad CR_{i,j-1/2,k}(H_{i,j-1,k}^m-H_{i,j,k}^m) + CR_{i,j+1/2,k}(H_{i,j,k}^m-H_{i,j+1,k}^m)\\
    &\ +  CC_{i-1/2,j,k}(H_{i-1,j,k}^m-H_{i,j,k}^m) + CC_{i+1/2,j,k}(H_{i,j,k}^m-H_{i+1,j,k}^m) \\
    &\ + CV_{i,j,k-1/2}(H_{i,j,k-1}^m-H_{i,j,k}^m) + CV_{i,j,k+1/2}(H_{i,j,k}^m-H_{i,j,k+1}^m) \\
    &\ + P_{i,j,k}H_{i,j,k}^m + Q_{i,j,k} \\
    &\ = SS_{i,j,k}(\Delta x_j \Delta y_i \Delta v_k)\frac{H_{i,j,k}^m - H_{i,j,k}^{m-1}}{t^m-t^{m-1}}

**用于求解的有限差分公式**

用于求解的有限差分方程最终具有形式 :math:`[A]\mathbf{H} = \mathbf{q}`

略