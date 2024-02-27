matplotlib使用精要
***************************

本文档用于记录matplotlib的使用技巧，由其知识繁多以总结。

.. seealso:: 
  https://matplotlib.org/stable/api/matplotlib_configuration_api.html

.. contents:: 

matplotlib的组织形式
========================

理解一个库的使用方法在于理解其的组织形式和编写逻辑。

matplotlib绘画库需要解决许多问题，目前我所能接触到的方面是绘图以及绘图的显示。

matplotlib的模块组成
-------------------------------

matplotlib由许多模块构成：

- matplotlib 
- matplotlib.afm
- matplotlib.animation
- matplotlib.artist
- matplotlib.axes
- matplotlib.axis
- matplotlib.backend_bases
- matplotlib.backend_managers
- matplotlib.backend_tools
- matplotlib.backends
- matplotlib.bezier
- matplotlib.category
- matplotlib.cbook
- matplotlib.cm
- matplotlib.collections
- matplotlib.colorbar
- matplotlib.colors
- matplotlib.container
- matplotlib.contour
- matplotlib.dates
- matplotlib.docstring
- matplotlib.dviread
- matplotlib.figure
- matplotlib.font_manager
- matplotlib.ft2font
- matplotlib.gridspec
- matplotlib.hatch
- matplotlib.image
- matplotlib.layout_engine
- matplotlib.legend
- matplotlib.legend_handler
- matplotlib.lines
- matplotlib.markers
- matplotlib.mathtext
- matplotlib.mlab
- matplotlib.offsetbox
- matplotlib.patches
- matplotlib.path
- matplotlib.patheffects
- matplotlib.pyplot
- matplotlib.projections
- matplotlib.quiver
- matplotlib.rcsetup
- matplotlib.sankey
- matplotlib.scale
- matplotlib.sphinxext.mathmpl
- matplotlib.sphinxext.plot_directive
- matplotlib.sphinxext.figmpl_directive
- matplotlib.spines
- matplotlib.style
- matplotlib.table
- matplotlib.testing
- matplotlib.text
- matplotlib.texmanager
- matplotlib.ticker
- matplotlib.tight_bbox
- matplotlib.tight_layout
- matplotlib.transforms
- matplotlib.tri
- matplotlib.type1font
- matplotlib.typing
- matplotlib.units
- matplotlib.widgets
- matplotlib._api
- matplotlib._enums
- mpl_toolkits.mplot3d
- mpl_toolkits.axes_grid1
- mpl_toolkits.axisartist
- pylab

matplotlib的主要模块介绍
------------------------------------

matplotlib
^^^^^^^^^^^^^^^^^
   
matplotlib是所有其他模块的接口，同时还具有一些全局功能的设置：

* Backend 管理
 
  1. ``matplotlib.use(backend,*,force=True)`` : 选择用于渲染和GUI的后端
  2. ``matplotlib.get_backend()``  ： 返回backend的名称
  3. ``matplotlib.interactive(b)`` : 设置是否每次plot命令都重绘图像
  4. ``matplotlib.is_interactive()`` : 返回是否每次plot命令都重绘图像
* 默认值和样式设置
 
  1. ``matplotlib.rcParams`` : 返回保存Matplotlib默认值的一个 `RcParams` 实例。
  2. ``class matplotlib.RcParams(*arg,**kwargs)`` : 一个储存默认值的类字典类型，具体值请查看文档。
  3. ``matplotlib.rc_context(rc=None,fname=None)`` : 返回临时改变 rcParams 的语境管理器。 提供了在一定配置中绘图的设置。
 
     .. code:: python 

        import matplotlib as mpl 
        with mpl.rc_context({'interactive':False}): 
            fig, ax = plt.subplots()
            ... 
  4. ``matplotlib.rc(group,**kwargs)`` : 设置当前的rcParams。 提供了实时的rcParams设置。
  5. ``matplotlib.rcdefaults()`` : 将rcPa.. seealso:: 
  https://matplotlib.org/stable/api/matplotlib_configuration_api.htmlrams恢复为Matplotlib内部默认样式
  6. ``matplotlib.rc_file_defaults()`` : 按Matplotlib的默认样式文件恢复rcParams。
  7. ``matplotlib.rc_file(fname,*,use_defualt_template=True)`` : 由文件更新 rcParams。
  8. 等。
* 日志管理
* 颜色映射和颜色序列
 
  1. ``matplotlib.colormaps`` : Matplotlib颜色映射的容器。可以通过名称获得颜色映射。
  2. ``matplotlib.colorsequences`` : Matplotlib颜色序列的容器。可以通过名称获得颜色映射。
* 其他
 
  1. ``matplotlib.MatplotlibDeprecationWarning`` 
  2. ``matplotlib.get_cachedir()`` : 返回缓存目录的路径


   
matplotlib.pyplot
^^^^^^^^^^^^^^^^^^^^^^^^^^

matplotlib.pylot 是matplotlib基于状态的一般绘图接口。它提供了两种绘图方法： MATLIB-like 的，
一种是基于类的。 同时它也是图形GUI管理器。

* 管理图像和坐标轴

  1. ``plt.axes(arg=None,**kwargs)`` : 添加axes到当前figure且置为当前axes 
  2. ``plt.cla()``  : 清除当前axes
  3. ``plt.clf()``  ： 清除当前figure 
  4. ``plt.close()`` ： 关闭一个figure窗口
  5. ``plt.delaxes(ax=None)`` ： 从figure移除axes（默认为当前axes）
  6. ``plt.fignum_exists(num)`` : 返回给定id的figure是否存在。
  7. ``plt.figure(...)`` : 创建一个新的figure，或者激活以及存在的figure。
  8. ``plt.gca()`` : 获取当前axes
  9. ``plt.gcf()`` : 获取当前figure 
  10. ``plt.get_figlabels()`` : 返回存在figure的标签列表。 
  11. ``plt.sca(ax)`` : 将ax设为当前axes，且归属为当前figure。
  12. ``plt.subplot(*arg,**kwargs)`` : 添加一个Axes到当前figure或者找回一个已经存在的Axes。
  13. ``plt.subplot2grid(...)`` : 在一个2维网格内的特定位置创建一个子图
  14. ``plt.subplot_mosaic(...)`` : 依据ASCII art 或者一个 nested lists创建一个Figure布局
  15. ``plt.twinx(ax)`` : 制作并返回共享x-axis的新axes。
  16. ``plt.twiny(ax)`` : 制作并返回共享y-axis的新axes。

* 数据绘图

  一系列绘图函数

* Axis 配置

  1. ``plt.autoscale``
  2. ``plt.axis``
  3. ``plt.box``
  4. ``plt.grid``
  5. ``plt.locator_params``
  6. ``plt.minorticks_off``
  7. ``plt.minorticks_on``
  8. ``plt.rgrid``
  9. ``plt.thetagrids``
  10. ``plt.tick_params``
  11. ``plt.ticklabel_format``
  12. ``plt.xlabel``
  13. ``plt.xlim``
  14. ``plt.xscale``
  15. ``plt.xticks``
  16. ``plt.ylabel``
  17. ``plt.ylim``
  18. ``plt.yscale``
  19. ``plt.yticks``
  20. ``plt.suptitle``
  21. ``plt.title``

  pyplot的Axis配置综合了axes的设置和axis的设置，并且重新调整了api，并不只是简单的包装

* 布局管理

  1. ``plt.margins`` 设置或获取自动放缩的边框
  2. ``plt.subplot_adjust`` 调整布局的参数设置
  3. ``plt.subplot_tool``  注册一个figure的布局工具窗口
  4. ``plt.tight_layout``  调整子图间的padding。

* 颜色映射

  1. ``plt.clim`` 设置当前颜色范围
  2. ``plt.colorbar`` 为绘图添加一个颜色棒
  3. ``plt.gci`` 获取当前colorable artist 
  4. ``plt.sci`` 设置当前图像 
  5. ``plt.get_cmap`` 得到一个颜色映射实例，默认为rc值
  6. ``plt.set_cmap`` 设置默认的颜色映射，并且应用到当前的图像
  7. ``plt.imread`` 从一个文件读取图像到一个数列
  8. ``plt.imsave`` 颜色映射并保存一个数列为一个图像文件

* 配置

  具有一些matplotlib的配置：

  1. ``plt.rc``
  2. ``plt.rc_context``
  3. ``plt.rcdefaults``

* 输出

  1. ``plt.draw`` 重新绘制当前图像
  2. ``plt.draw_if_interactive`` 如果图像在交互模式则重绘图像
  3. ``plt.ioff`` 禁用交互模式
  4. ``plt.ion`` 开启交互模式
  5. ``plt.install_repl_displayhook`` 连接到当前shell的展示钩子
  6. ``plt.is_interactive`` 返回是否处于交互模式
  7. ``plt.pause`` 在给定间隔下运行GUI事件循环
  8. ``plt.savefig`` 保存当前的figure 
  9. ``plt.show`` 展示所有开启的图像 
  10. ``plt.switch_backend`` 设置pyplot backend 
  11. ``plt.uninstall_repl_displayhook`` 断开与当前shell的展示钩子的连接

* 其他 

  1. ``plt.connect`` 绑定函数func到时间s 
  2. ``plt.disconnect`` 断开id cid callback 
  3. ``plt.findobj`` 寻找一个artist对象 
  4. ``plt.get`` 返回一个 Artist的属性，或者将他们全部print。
  5. ``plt.getp`` 返回一个 Artist的属性，或者将他们全部print。
  6. ``plt.get_current_fig_manager`` 返回当前fijgure的图像管理器
  7. ``plt.ginput`` 阻塞与一个figure的交互调用
  8. ``plt.new_figure_manager`` 创建一个新的图像管理器
  9. ``plt.set_loglevel`` 配置Matplotlib的日志等级
  10. ``plt.setp`` 设置一个Artist一个或更多的属性，或者列出允许的值
  11. ``plt.waitforbuttonpress`` 阻塞与这个figure的交互
  12. ``plt.xkcd`` 开启xkcd sketch-style drawing mode。
   
matplotlib.artist
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   
此模块完成了所有可视对象的抽象基类 ``Artist`` 。 

.. image:: https://matplotlib.org/stable/_images/inheritance-a6f73b5045eb7f51f415f1f4ec6f1dd7579a60b1.png

**Class Artist** 

``matplotlib.artist.Artist`` 

Artist 拥有许多方法

**交互**

1. ``add_callback`` 添加一个callback函数，只要Artist的属性改变就会调用其
2. ``remove_callback`` 去除一个callback函数，基于其观察id。
3. ``pchanged`` 调用所有注册后的callback函数
4. ``get_cursor_data`` 返回一个给定数据的鼠标数据
5. ``format_cursor_data`` 返回给定数据的字符串表示
6. ``set_mouseover`` 当光标掠过artist是设置是否需要该表artist。
7. ``get_mouseover`` 返回mouseover 
8. ``mouseover``  同 get_mouseover
9. ``contains`` 测试是否artist包含鼠标事件 
10. ``pick`` 进行一个pick事件
11. ``pickable`` 返回是否一个artist pickable 
12. ``set_picker`` 定义artist的picking表现
13. ``get_picker`` 返回artist的picking表现 

**Clipping** 

1. ``set_clip_on`` 设置是否artist使用clipping 
2. ``get_clip_on`` 返回是否artist使用clipping 
3. ``set_clip_box`` 设置artist的clip ``Bbox`` 
4. ``get_clip_box`` 返回 ``clipbox`` 
5. ``set_clip_path`` 设置 clip path 
6. ``get_clip_path`` 返回clip path 

**主体属性** 

1. ``update`` 更新artist的属性，通过穿入的字典。
2. ``update_from`` artist间的属性复制
3. ``properties`` 返回这个artist的属性列表 
4. ``set`` 一次性设置多种属性 

**绘制** 

1. ``draw`` 通过给定的渲染器绘制Artist
2. ``set_animated`` 设置是否artist要使用一个动画 
3. ``get_animated`` 返回是否artist使用了一个动画
4. ``set_alpha`` 设置透明度的值——并不是所有的backends都支持 
5. ``get_alpha`` 获取透明度 
6. ``set_snap`` 设置snaping表现
7. ``get_snap`` 获取snaping表现
8. ``set_visible`` 设置可见性
9. ``get_visible`` 返回可见性 
10. ``zorder`` ？
11. ``set_zorder`` 设置aritst的zorder 
12. ``get_zorder`` 返回zorder 
13. ``set_agg_filter`` 设置agg 过滤器 
14. ``set_sketch_params`` 设置sketch 参数 
15. ``get_sketch_params`` 获取sketch参数 
16. 等 

**Figure 和 Axes** 

1. ``remove`` 从figure移除artist，如果可能的话 
2. ``axes`` artist处于的Axes实例 
3. ``set_figure`` 设置artist归属的figure对象 
4. ``get_figure`` 返回artist归属的figure实例

**Children** 

1. ``get_children`` 返回这个Aritst子类的列表
2. ``findobj`` 查找artist对象 

**变换** 

1. ``set_transform`` 设置artist的变换 
2. ``get_transform`` 返回artist使用的 ``Transform`` 实例 
3. ``is_transform_set`` 返回是否Artist有一个明确的转换 

**单位** 

1. ``convert_xunits`` 
2. ``convert_yunits`` 
3. ``have_units`` 

**元数据** 

1. ``get_gid`` 返回groud id  
2. ``set_gid`` 
3. ``set_label`` 
4. ``get_label`` 返回可在图例中展示的标签
5. ``set_url`` 
6. ``get_url`` 返回url 

**Miscellaneous** 

1. ``sticky_edges`` 
2. ``set_in_layout`` 
3. ``get_in_layout`` 
4. ``stale``

**Functions** 

1. ``allow)rasterization`` 
2. ``get`` 返回或打印出Artist属性的值
3. ``getp`` 同 get 
4. ``setp`` 设置Artist属性的值 
5. ``kwdoc`` 
6. ``ArtistInspector`` 

总的来说，Artist基类完成了Qt界面绘制的相关任务。

matplotlib.figure
^^^^^^^^^^^^^^^^^^^^^

``matplotlib.figure`` 实现了下列类：

1. ``Figure``  最顶层的Aritst，一个实例相当于一个窗口，包含所有的绘制要素。 许多方法在 ``FigureBase`` 实现。
2. ``SubFigure`` 一个子图，在3.4版本中新出现的概念，用subfigure划分figure实现更多的布局
3. ``SubplotParams`` 控制subplots间的默认间距
   
matplotlib.axes
^^^^^^^^^^^^^^^^^^^^^

实现了Axes类， ``Axes`` 类代表了一个figure中的一个绘图区域，包含了绘制数据，坐标轴刻度，标签，标题，图例，等等。

他的方法是绘制图形的主要接口。

实现一个Axes类需要设计其投影，以及其他的特性，如坐标轴、网格线，spines等等。

matplotlib.axis
^^^^^^^^^^^^^^^^^^^^

包含了与坐标轴相关的对象。分别代表一个Axes需要的坐标轴和刻度。

.. image:: https://matplotlib.org/stable/_images/inheritance-25fb1903075ad08f414a013219cfd7ce90ff701c.png

**Axis Object**

1. ``class matplotlib.axis.Axis(axes,*,pickradius=15,clear=True)`` XAxis和YAxis的基类
2. ``class matplotlib.axis.XAxis(*args,**kwargs)`` 
3. ``class matplotlib.axis.YAxis(*args,**kwargs)``
4. ``class matplotlib.axis.Ticker`` 一个定义刻度位置和格式的容器
5. ``Axis.clear`` 清除axis 
6. ``Axis.get_scale`` 返回Axis的放缩

**Formatters和Locators** 

1. ``Axis.get_major_formatter`` 获取主刻度的格式
2. ``Axis.get_major_locator`` 获取主刻度的定位器
3. ``Axis.get_minor_formatter`` 获取小刻度的格式
4. ``Axis.get_minor_locator`` 获取小刻度的定位器
5. ``Axis.set_major_formatter`` 
6. ``Axis.set_major_locator`` 
7. ``Axis.set_minor_formatter`` 
8. ``Axis.set_minor_locator`` 
9. ``Axis.remove_overlapping_locs`` 如果小刻度位置与主刻度位置冲突，那么刻度应该被修剪。
10. ``Axis.get_remove_overlapping_locs``
11. ``Axis.set_remove_overlapping_locs`` 

**Axis Label** 

1. ``Axis.set_label_coords`` 设置轴标签坐标（注意是相对于轴全长的坐标）
2. ``Axis.set_label_position`` 设置轴标签位置，顶部或是底部
3. ``Axis.set_label_text`` 
4. ``Axis.get_label`` 返回包含标签位置和文本信息
5. ``Axis.get_label_text`` 返回标签文本
6. ``Axis.get_label_position`` 返回标签位置 

**Ticks,tick labels and Offset text** 

1. ``Axis.get_major_ticks`` 返回 ``Tick`` 列表
2. ``Axis.get_majorticklabels`` 返回Axis的主刻度标签，以 ``Text`` 列表的形式。
3. ``Axis.get_majorticklines`` 返回主刻度刻度线，以 ``Line2D`` 列表的形式
4. ``Axis.get_majorticklocs`` 返回主刻度刻度位置
5. ``Axis.get_offset_text`` 返回axis的 offsetText实例 ``Text``
6. ``Axis.get_tick_padding`` 
7. ``Axis.get_tick_params`` 
8. ``Axis.get_ticklabels`` 
9. ``Axis.get_ticklines`` 
10. ``Axis.get_ticklocs`` 
11. ``Axis.get_gridlines`` 
12. ``Axis.grid`` 配置网格线 
13. ``Axis.set_tick_params`` 设置刻度、刻度标签和网格线的外观参数 
14. ``Axis.axis_date`` 

**Data and view intervals** 

1. ``Axis.get_data_interval`` 获取数据区间
2. ``Axis.get_veiw_interval`` 获取可视区间
3. ``Axis.get_inverted`` 返回是否Axis在 "inverse" 方向
4. ``Axis.set_data_interval`` 
5. ``Axis.set_view_interval`` 
6. ``Axis.set_inverted`` 

**Rendering helper** 

1. ``Axis.get_minipos``
2. ``Axis.get_tick_space``
3. ``Axis.get_tightbbox`` 

**Interactive** 

略

**Units** 

1. ``Axis.convert_units`` 
2. ``Axis.set_units`` 
3. ``Axis.get_units`` 
4. ``Axis.update_units`` 

**XAxis 特有的方法**

略

**YAxis 特有的方法** 

略

**其他**

略

**不建议**

1. ``Axis.set_ticks``
2. ``Axis.set_ticklabels`` 


**Tick Object** 

1. ``class Tick``

   轴的刻度，网格线和标签的抽象基类

2. ``class XTick`` 
3. ``class YTick``


matplotlib.path
^^^^^^^^^^^^^^^^^^^^^^

一个使用matplotlib处理多线段的模块。

用于处理多线段主要的类是 ``Path`` 。 几乎多有的向量绘画都使用Path。另外一些使用pipeline。

Path实例本事并不能被画出。一些artist子类，例如 ``PathPatch`` 和 ``PathCollection`` 可以将Path画出。

1. ``mpath.Path(vertices,code=None,_interpolation_steps=1,closed=False,readonly=False)`` 

   一系列可能不连接，可能闭合的线或曲线段。

   用两个平行的numpy数列储存数据

   * vertices : 一个顶点的(N,2)数列
   * codes: 一个(N,1)长度的路径代码或None
   
   这些代码可以是：

   * ``stop`` : 标志整个路径结束，目前不变要求，且忽视其。
   * ``MOVETO`` : 提笔，移动到此顶点
   * ``LINETO`` : 落笔，直画到此顶点
   * ``CURVE3`` : 画一条二次贝塞尔曲线，需要一个控制点和一个终点。
   * ``CURVE$`` : 画一条三次贝塞尔曲线，需要两个控制点和一个终点。
   * ``CLOSEPOLY`` : 连接起始点使曲线闭合。
   
   Path还提供了很多便捷绘制特定形状路径的方法：

   1. ``Path.arc`` 返回一个arc路径
   2. ``Path.circle`` 返回一个circle路径
   3. ``Path.mack_compound_path(*arg)`` 将所给路径序列复合。
   4. ``Path.mack_compound_path_from_ploys(XY)``  
   5. ``Path.unit_circle()`` 返回只读单位元路径
   6. 等。
   
   Path对象有其操作的api： 

   1. ``cleaned`` 返回一个具有顶点和代码清除了的Path，根据其参数。
   2. ``clip_to_bbox`` 
   3. 等

matplotlib.patches
^^^^^^^^^^^^^^^^^^^^^

定义了一些用于绘制图案的类型。

基类是Patch，即图像的意思，是一个具有填充色以及边界线的图案。

还提供了基于patch的一些常用简单图形，如 ``Ellipse`` 、 ``Arrow`` 、 ``Polygon`` 等。

另外还有支持多线段和多曲线段路径图形的 ``PathPatch`` 等。

.. image:: https://matplotlib.org/stable/_images/inheritance-09834fa3a0889d42fd60c7db69a0a2a0863a829e.png

matplotlib.collections
^^^^^^^^^^^^^^^^^^^^^^^^^^

用于处理大量相同属性和形状的对象。

.. image:: https://matplotlib.org/stable/_images/inheritance-fb90d11950d6af523199e4ad5ea6a7cb044143d4.png

matplotlib.container
^^^^^^^^^^^^^^^^^^^^^^^^^

各种artist的容器。

matplotlib.style
^^^^^^^^^^^^^^^^^^^^^^^^^

定义了一些rcParams样板。

1. ``mstyle.context`` 短期使用style的上下文管理器
2. ``mstyle.reload_library`` 重载style库。
3. ``mstyle.use`` 使用一个样式
4. ``mstyle.library`` 储存样式的字典
5. ``mstyle.available`` 可用样式的列表

主要类及其用法
======================

``Figure`` 
----------------

``class matplotlib.figure.Figure(figsize=None,dpi=None,*,facecolor=None,
edgecolor=None,linewidth=0.0,frameon=None,subplotpars=None,tight_layout=None,
constrained_layout=None,layout=None,**kwargs)`` 

* 具有属性
  
  * patch 背景图案
  * suppressComposite 
* 调用时的参数
  
  * figsize : [6.4,4.8]
  * dpi : 100.0
  * facecolor : 'white'
  * edgecolor : 'white'
  * linewidth : 1
  * frameon : True 
  * subplotpars : 
  * tight_layout : bool or dict 
  * constrained_layout : bool 
  * layout : {'constrained', 'compressed', 'tight', 'none', LayoutEngine, None}
  * 其他参数：

    * alpha
    * animated 
    * gid 
    * 等

figure的常用方法
^^^^^^^^^^^^^^^^^^^^^

- ``add_artist(artist,clip=False)`` , 添加一个artist给figure。
- ``add_axes(*args,**kwargs)`` 
- ``add_axobserver(func)``
- ``add_callback(func)`` 
- ``add_subfigure`` 
- ``add_subplot``
- ``align_labels(axs=None)`` 
- ``clear`` 
- ``clf`` 
- ``colorbar`` 
- ``delaxes(ax)`` 
- ``draw(renderer)`` 
- ``draw_artist(a)`` 
- ``figimage`` 
- ``gca()``
- ``get_agg_filter``
- ``get_alpha``
- ``get_axes``
- ``sca``
- ``set``
- ``subplots``


axes的常用方法
^^^^^^^^^^^^^^^^^^

Line2D
^^^^^^^^^^

其他Artist
^^^^^^^^^^^^

Patch类
------------

Patch 是定义了填充色和轮廓线的图案，和ctez中的绘图类一致。

``class Patch`` 
^^^^^^^^^^^^^^^^^^^^^^

Patch类的设计思路：

Patch也是Artist的基类，因此也是通过 ``draw(self,renderer)`` 方法绘制的。
其中renderer是绘制引擎。抽象的Artist并不可以绘制，draw方法只会返回空值。

其可绘制的子类一般都可以绘制出，也就是完成了draw方法的绘制部分，例如 ``Line2D`` 

.. code:: python 

  # 这里查看代码后有了使用标记型伪代码快速画流程图的思想，在这里使用初步想象的python伪代码写流程图
  if 不可见:return 
  if invalid需要处理 : 缓存
  if subslice需要处理 : 
    subslice 处理
  else: 
    subslice = None 
  if 如果有阴影效果: 获取有阴影效果的renderer 
    renderer 开启line2d组 
  if 需要绘制线型 : code marker: 线绘制 
  if 需要绘制标记 : code 标记绘制
  
  code 线绘制: 
    获取 tpath 和 affine : _get_transformed_path() , get_transform_path_and_affine()
    if tpath有顶点 : 
      从渲染器创建gc : gc = renderer.new_gc()
      设置gc的参数: clip,url,antialiased,linewidth 
      if dased : 
        cap 和 join 为 dash类型
      else: 
        cap 和 join 为 solid类型
      设置gc参数: cap,join 
      设置gc参数: snap 
      if 有sketch参数 : 设置sketch参数
      if 为dash类型且有gapcolor: 
        设置gc参数: 前景色,dash 
        绘制路径: render.draw_path(gc,tpath,affine.froze()) 
      设置gc参数: 前景色,dash 
      绘制路径
      gc.restore() 
  
  code 标记绘制: 
    从渲染器创建gc
    设置gc参数: clip,url,linewidth,antialiased,前景色
    if 有sketch参数: 设置gc参数: sketch 
    获取 tpath 和 affine 
    if tpath有顶点: 
      设置gc参数: snap,joinstyle,capstyle,linewidth
      获取marker path , trans,subsampled
      绘制标记: render.draw_markers(
        gc,alt_marker_path,alt_marker_trans,subsampled,
        affine.froze(),fcalt_rgba
      )
    gc.restore 


**Patch的绘制流程** 

.. code:: python 

  if 不可见: return
  获取path,transform
  由path,transform获取tpath,affine: 
    tpath = transform.transform_path_non_affine(path)
    affine = transform.get_affine()
  传入带属性绘制函数 : self._draw_paths_with_artist_properties(
    render,
    [(tpath,affine,self._facecolor if self._facecolor[3] else None)]
  )

  code _draw_paths_with_artist_properties(self,renderer,draw_path_args_list) : 
    开启渲染器组: patch  
    创建gc 
    设置gc参数 : foreground,linewidth,dash,capstyle,joinstyle,antialiased,clip,\
                url,snap,alpha,hatch,sketch_params,path_effects 
    使用draw函数传入的参数列表绘制路径 : 
      for draw_path_args in draw_path_args_list:
        renderer.draw_path(gc,*draw_path_args)
    gc.restore()
    渲染器关闭组: patch 
    self.stale = False

绘制在于调用底层的渲染器的参数设置

mpl的变换
----------------

由之前的代码可知，mpl图形的绘制是通过渲染器和若干参数完成的。

draw的过程重要的就是确定不同的渲染器参数，其中重要的有:

* gc 图形上下文管理器 
* transform 变换，基础图形经过变换成为最终图形，而且各种对figure和axes的交互或非交互式变换都是通过transform完成。
* tpath 绘制图案的路径

在Line2D的绘制过程中gc的设置略去，画线型的流程中，tpath是基于Path的，转换后的path是由path经过 TransformedPath变换而来。
变换只涉及仿射变换，是通过线的变换的 get_affine属性得来的。

所以draw的绘制过程就是控制渲染器，传入以Path为基础的tpath和TransformNode为基础的transform，加上样式设置器gc完成的。其中path和tranform都
可能由多个参数共同决定。

目前Path已经可以了解清楚，对于transform，mpl有一个框架。

.. image:: https://matplotlib.org/stable/_images/inheritance-a70c221b36fca7451171560e6e1b2d934dcb52c9.png

下面进入transform教程翻译：

Transformations Tutorial理解性翻译
========================================

matplotlib的绘图过程是通过基础图形+图形变换+样式配置完成的。

这里的绘图过程既包括了figure和axes中由数据坐标转换到屏幕坐标的过程，也指在绘图过程中，
可以传入transform参数，使其再变换。

mpl具有一个变换框架。变换的本质就是一个坐标变换的函数。由于性能要求将变换分为非仿射部分和仿射部分。
为了方便变换之间的衔接还设计了管道机制，变换一般还会设置逆变换，用于反向操作。

变换框架介绍
----------------

为了正确高效的使用变换，必需理解变换的框架。

``class TransformNode``
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

TransformNode是所有变换的基类，由其衍射出三种类型：TransformedPath，Bbox方向和Transform方向。

其中Transform是所有变换的基类，所有仿射变换都是其子类 Affine2D的子类，所有非仿射变换是Transform非Affine2D的子类。

Bbox方向用于完成边框机制

TransformedPath 按其文档说是，用于缓存Path的非仿射变换拷贝，缓存的拷贝在transform的非仿射部分变换时自动更新，用于将变换中的非仿射部分(往往计算量比仿射大很多)缓存下来用于单独计算。

``TransformNode`` 

* 提供了froze()接口，用于在子类改变时也保存原来的变换。
* 提供了invalidate()接口，可以使变换无效。


``Transform``
^^^^^^^^^^^^^^^^^^^^^^^

是所有仿射变换和非仿射变换的基类。

* 提供了input_dims和outputdims属性，用于返回输入输出的维度
* 提供了Transform(value)接口，是执行变换的函数
* 提供了inverted()接口，如果存在逆变换，则返回逆变换，类型也是tranform类。
* 提供了is_separable和has_inverse属性用于确定变换是否可以单独分解为x部分和y部分以及是否具有逆变换
* 提供了transform_path接口，如果需要对Path对象做额外的操作，例如添加一段曲线，transfrom_path(path)将会被运用于获得新的Path用于变换。
* 以供了管道机制：
  
  ::
    # In general:
    A - B == A + B.inverted()
    # (but see note regarding frozen transforms below).

    # If A "ends with" B (i.e. A == A' + B for some A') we can cancel
    # out B:
    (A' + B) - B == A'

    # Likewise, if B "starts with" A (B = A + B'), we can cancel out A:
    A - (A + B') == B'.inverted() == B'^-1    

.. seealso:: https://matplotlib.org/stable/users/explain/artists/transforms_tutorial.html#transforms-tutorial

``CompositeGenericTransform(a,b,**kwargs)`` 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

通过运用两个变换的组合形成的符合变换，这个符合版本变换可以掌控两个任意的变换。你可以通过变换a，b的组合构建一个复合变换： :math:`a + b` 。

坐标系统间的变换
------------------

所有坐标系统的数据要想正确的显示必需转换为屏幕上的坐标，完成这一工作的底层就是设计好的transform对象，\
可以通过对象属性获取不同坐标系到屏幕坐标的变换对象： 

获取对象的变换
^^^^^^^^^^^^^^^^^^

**数据坐标系** 

Axes中数据的坐标系统: ``ax.transData`` 

**axes坐标系**

axes坐标系是一个单位矩形，左下角为 (0,0),右上角为 (1,1) : ``ax.transAxes`` 

**subfigure** 

子图的坐标系，和axes类似的单位矩形 : ``subfigure.transSubfigure`` 

**figure** 

figure坐标系，和axes类似的单位矩形 : ``fig.transFigure`` 

**figure-inches** 

用英寸表达的Figure坐标系，矩形， 左下角为 (0,0) 右上角为 (width,height) 。 : ``fig.dpi_scale_trans``

**xaxis和yaxis** 

混杂的坐标系统，使用数据坐标系在一个方向，另一个方向采用axes坐标系。 : ``ax.get_xaxis_transform(),ax.get_yaxis_tansform``

**display** 

输出的自然坐标系，(0,0)是窗口的左下角，(width,height)在右上角，使用屏幕单位。 : ``None`` 或者 ``IdentityTransform()`` 。

使用实例
^^^^^^^^^^^^

**轴坐标系数据填入**

使用轴坐标系数据设置一些绘图元素的好处是不会随着数据的变化而变换，因此适合用来天街一些和轴相关的样式

例如： 添加轴字符 

.. code:: python

  for i, label in enumerate(('A', 'B', 'C', 'D')):
    ax = fig.add_subplot(2, 2, i+1)
    ax.text(0.05, 0.95, label, transform=ax.transAxes,
            fontsize=16, fontweight='bold', va='top')

.. image:: https://matplotlib.org/stable/_images/sphx_glr_transforms_tutorial_003_2_00x.png

例如： 添加一个占图幅的固定的圆 

.. image:: https://matplotlib.org/stable/_images/sphx_glr_transforms_tutorial_004_2_00x.png

**混合变换** 

使用混合变换可以设计一个方向由数据决定的元素，如

一个x区间: 

.. code:: python 

  x = np.random.randn(1000)

  ax.hist(x, 30)
  ax.set_title(r'$\sigma=1 \/ \dots \/ \sigma=2$', fontsize=16)

  # the x coords of this transformation are data, and the y coord are axes
  trans = transforms.blended_transform_factory(
      ax.transData, ax.transAxes)
  # highlight the 1..2 stddev region with a span.
  # We want x to be in data coordinates and y to span from 0..1 in axes coords.
  rect = mpatches.Rectangle((1, 0), width=1, height=1, transform=trans,
                            color='yellow', alpha=0.5)
  ax.add_patch(rect)

.. image:: https://matplotlib.org/stable/_images/sphx_glr_transforms_tutorial_005_2_00x.png

**物理坐标系** 

有时候需要按照屏幕坐标系绘制一些图案，例如logo图形，这样的图形不会随着figure的变换而变换。需要注意坐标要显示需要在
figure-inches坐标系统中。

.. code:: python 

  x, y = 10*np.random.rand(2, 1000)
  ax.plot(x, y*10., 'go', alpha=0.2)  # plot some data in data coordinates
  # add a circle in fixed-coordinates
  circ = mpatches.Circle((2.5, 2), 1.0, transform=fig.dpi_scale_trans,
                        facecolor='blue', alpha=0.75)
  ax.add_patch(circ)

另一个用法是在坐标轴上的数据点周围反之一个具有固定物理尺寸的图案。这需要用到两个变换的组合，一个是
确定其形状的屏幕坐标系上的数据，另一个是将其移动到数据点的平移变换。

.. code:: python 

  xdata, ydata = (0.2, 0.7), (0.5, 0.5)
  ax.plot(xdata, ydata, "o")
  ax.set_xlim((0, 1))

  trans = (fig.dpi_scale_trans +
          transforms.ScaledTranslation(xdata[0], ydata[0], ax.transData))

  # plot an ellipse around the point that is 150 x 130 points in diameter...
  circle = mpatches.Ellipse((0, 0), 150/72, 130/72, angle=40,
                            fill=None, transform=trans)
  ax.add_patch(circle)

.. image:: https://matplotlib.org/stable/_images/sphx_glr_transforms_tutorial_008_2_00x.png

**使用一个平移变换创建阴影效果** 

.. code:: python 

  # make a simple sine wave
  x = np.arange(0., 2., 0.01)
  y = np.sin(2*np.pi*x)
  line, = ax.plot(x, y, lw=3, color='blue')

  # shift the object over 2 points, and down 2 points
  dx, dy = 2/72., -2/72.
  offset = transforms.ScaledTranslation(dx, dy, fig.dpi_scale_trans)
  shadow_transform = ax.transData + offset

  # now plot the same data with our offset transform;
  # use the zorder to make sure we are below the line
  ax.plot(x, y, lw=3, color='gray',
          transform=shadow_transform,
          zorder=0.5*line.get_zorder())

  ax.set_title('creating a shadow effect with an offset transform')

.. image:: https://matplotlib.org/stable/_images/sphx_glr_transforms_tutorial_009_2_00x.png

**变换管道** 

简单而言就是所有变换支持 + - 法，+法即管道符，而-法则是取逆变换后加管道符，使用加减法的底层是
``CompositeGenericTransform(a,b,**kwargs)`` 。

绘图时的变换
---------------

绘图设置变换矩阵可以绘制变换后的图形，这里主要使用仿射变换，其他的变换也是一样的。

放缩
^^^^^^^

见仿射变换

平移
^^^^^^

``transforms.ScaledTranslation(xt,yt,scale_trans)`` 类返回一个按scale_trans坐标系平移xt，yt的变换。

旋转
^^^^^^

见仿射变换

使用仿射矩阵变换
^^^^^^^^^^^^^^^^^^^^^

``class Affine2D(matrix=None,**kwargs)``

设置 3x3仿射变换矩阵用于变换。

除了设置矩阵的形式还可以使用其方法快速创建: 

* rotate(theta) 弧度制
* rotate_around(x,y,theta)
* rotate_deg(degrees) 
* rotate_deg_around(x,y,degrees)
* scale(sx,sy=None)
* set_matrix(mtx)  直接设置仿射矩阵

混合变换
^^^^^^^^^^

``BlendeAffine2D(x_transform,y_transform,**kwargs)`` 返回将x和y分别按照两种变换的变换



