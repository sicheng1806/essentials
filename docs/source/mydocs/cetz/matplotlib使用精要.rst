matplotlib使用精要
***************************

本文档用于记录matplotlib的使用技巧，由其知识繁多以总结。

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
  5. ``matplotlib.rcdefaults()`` : 将rcParams恢复为Matplotlib内部默认样式
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

.. seealso:: 
  https://matplotlib.org/stable/api/matplotlib_configuration_api.html
   
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


