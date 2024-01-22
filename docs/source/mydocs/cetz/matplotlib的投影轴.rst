matplotlib的投影
====================

.. contents:: 

下面是官方文档 ``matplotlib.projections`` 的翻译：

matplotlib.projections的翻译
-------------------------------

从数据空间映射到屏幕空间的不可分离变换。

``projections`` 定义为 ``Axes`` 的子类。 他们包括下列元素：

* 投影： 由数据坐标系到展示坐标系的变换。
* 逆投影： 数据-展示变换的逆变换，用于，例如，转换屏幕空间上的鼠标位置转换为数据空间坐标。
* 网格线、刻度和刻度标签的变换:自定义投影常需要将这些要素放置在特定的位置， ``Matplotlib`` 有一系列工具去帮助完成这项任务。
* 设置默认值(重载 ``cla``) ， 因为默认的直角坐标系的默认值可能不再合适。
* 定义坐标轴的形状，例如，一个椭圆坐标轴，用于绘制绘图的背景和切片任何数据元素。
* 确定投影的自定义定位器 ``locator`` 和数据格式化程序 ``formatters`` 。例如，在一个地球投影中，仅管数据使用弧度制，
  但是对于展示数据来说角度制会更加便利。
* 设置交互式的移动和放缩。这留给读者作为一个高级特性，但这也提供了一个极坐标的示例 ``matplotlib.projections.polar``
* 任何其他的方法和特性

一旦投影坐标系定义好了，就可以通过两种方式使用：

* 通过定义类属性 ``name`` ， 投影轴就可以被 ``matplotlib.projections.register_projection`` 注册，然后就可以简单的使用:
  
  ``fig.add_subplot(projection="my_proj_name")``
* 对于更加复杂，需要可传递参数的投影， ``projection`` 类应该被定义，且其必需含有 ``_as_mpl_axes._as_mpl_axes`` 这个无参数，返回投影
  坐标轴子类和一个用于传递给 ``Axes.__init__`` 方法的参数字典。这样定义的投影可以通过这样调用：

  ``fig.add_subplot(projection=MyProjection(param1=param1_value))`` 

一个完整的示例见 ``Custom projection`` 。 极坐标投影函数也值得一看 ``matplotlib.projection.polar``

``GeoAxes`` 投影示例分析
---------------------------------

.. seealso:: https://matplotlib.org/stable/gallery/misc/custom_projection.html

由案例可见，自定义投影的设计较为繁多，且没有合适的文档进行叙述，打算从官方案例和源文档入手。

* GeoAxes类用于完成投影部分的基础设计，但是预留 `_get_core_transform` 接口用于添加Hammer投影变换类
* HammerAxes类继承自GeoAxes类，完成Hammer投影变换类的书写，成为可使用的Hammer投影下的GeoAxes类。
* name 属性用于标识投影轴，注册投影后可以通过 `projection="Your_projection_name"` 调用。
* _init_axis方法用于完成axis和spine的初始化
* clear方法或 cla方法用于初始化投影。
* _set_lim_and_transforms方法用于设置核心的投影变换：
  
  1. 所有的变换都继承自 `matplotlib.transforms.Transform`，这个类支持 `+` 法，表示按顺序执行变换。
  2. 设置数据空间到坐标轴空间的变换。
  3. 设置坐标轴空间到展示空间的变换。
  4. self.transData 属性用于承接整个变换（即由数据空间到屏幕空间的整体变换）
  5. 设置x轴和y轴的数据变换（设置轴的数据变换）,以x轴为例：
     1. self._xaxis_pretransform
     2. self._xaxis_transform 
     3. self._xaxis_text1_transform 
     4. self._xaxis_text2_transform 
  6. `get_*_transform` 命名格式的方法用于返回所用的变换，如果是私有的将在使用 `_get_*_transform` 
* _gen_axes_patch 方法用于绘制绘图的背景，返回一个patch对象
* _gen_axes_spines 方法用于绘制绘图的spine，返回一个字典。
* set_yscale
* set_xscale
* set_xlim
* set_ylim
* format_coord 方法返回坐标表示的字符串
* get_data_ratio 方法返回数据的aspect 
* can_zoom 方法 决定是否放缩,类似的方法还有很多，例如 `can_pan` 等。
* can_pan 方法 决定展示页面是否可以平移，如果可以，则会根据 `start_pan` ， `end_pan` 、 `drag_pan` 来设置pan的动作。   




.. include:: ./_AxesBase_Class.rst