Rust摘要
################

本文档按照个人主观记录一些rust相关的内容。学习Rust请转到 `Rust程序设计语言
<https://kaisery.github.io/trpl-zh-cn/>`_ 

这次学习Rust，主要是用Rust实现一个小的操作系统作为Rust和操作系统的练习。

由于网络问题，Rust并没有使用官网方法安装，使用aptitude 安装了 cargo

笔记1——Rust的基本语法
****************************

Rust 为静态强类型语言，Python是动态弱类型语言。Rust以安全和快速著称，Python以
快速开发，且优雅闻名，但速度不佳。两者刚好互补。

Rust 的语言类型意味着 需要进行类型标注 以及 编译

Rust的工作流程
==================

编辑-编译-运行：编写.rs代码，使用rustc编译生成二进制文件，运行即可。

或者使用cargo，按工程的视角管理项目，如下：

1. cargo new proj_name [optional]
2. 在scr/ 编写源代码
3. cargo build 编译 生成 目标文件 保存在 target/文件夹。
4. cargo run 运行

Rust的数据类型
==================

以下是基本数据类型：

1. 整型

如：i32 默认整型。 用i/u+size 表示 size可取2^(3-7):8,16,32,64,128

2. 浮点型

f32 and f64

3. bool
4. char

5. tuple and array

.. code-block:: rust

    fn main() {
        let tup: (i32,f64,char) = (500,1.0,'a');
        let a = [1,2,3,4,5];
        let a:[i32;5] = [1,2,3,4,5];
    }

Rust的函数定义和使用
=========================

.. code-block:: rust

    fn func_name(x:i32) -> i32 {
        // pass
        return 1;
    }

1. 当没有return语句时默认为最后一句为返回值。
2. 同python的类型注释

Rust的注释
==============

同C语言

Rust的控制流
================

1. if 语句

else if 

.. code-block:: rust

    if condition {
        //pass
    } else if condition {
        //pass
    } else {
        //pass
    }

python的if

.. code-block:: python

    if condition :
        pass
    elif condition :
        pass
    else:
        pass


2. loop 语句

等于 while True {}

可以通过 break expression; 返回值

可以通过 'loop_name' : loop {} 为循环取名，并通过 break 'loop_name'指定退出的循环。

3. while condition {}
4. for element in iterable {}


笔记2——Rust的内存管理机制——所有权系统
******************************************

``let a = 1`` 表示不可变变量，存在栈中

``let mut a = 1`` 则是可变变量，存在堆中

基于所有权系统的内存管理
================================

所有权规则：

1. Rust的每一个值都有一个所有者，且任意时刻一个值只能有一个所有者。
2. 但所有者离开作用域后，这个值将被回收。
3. 所有权通过赋值建立，在传递值中传递，在所有者离开作用域后被丢弃。

解释一下第3条，个人总结的：

根据数据类型不同同一类型的语句会发生不同的结果，这取决与该数据类型在传递中被浅拷贝（移动）还是被深拷贝。
如果是浅拷贝则会传递所有值，如果是深拷贝，则相当于复制了一个样本，是新的所有权的建立。如：

.. code-block:: rust

    let s = String::from("hello");  // s开始拥有其值的所有权
    takes_ownersips(s);             // s将所有权转换给函数，因为字符串在使用浅拷贝策略
    // println!(s)                  // 由于s没有其值的所有权，实际上s已经回收了，这里通不过编译
    let s = takes_ownersips(s);     // 如果函数返回s的值的话，所有权会再次回到s中
    let a = 1;
    make_copys(a);                  // 数值类型由于数据块少，不可变,使用直接复制的策略
    println!(a)                     // a 依然保有所有权

所有权在函数中的传递——引用与借用
======================================

函数调用中使用 ``&s1`` 来引用变量的值,在函数定义中使用 ``&type`` 来声明参数是对函数的引用

使用引用来保留所有权
---------------------

.. code-block:: rust

    let s1 = String::from("hello");

    let len = calculate_length(&s1);//calculate_length 不改变s1的值。

使用可变引用保留所有权的同时来修改变量的值
-------------------------------------------------

.. code-block:: rust

    fn main() {
        let mut s = String::from("hello");

        change(&mut s);
    }

    fn change(some_string: &mut String) {
        some_string.push_str(", world");
    }

如果一个变量如果有一个可变引用，则不能再有其他引用，如果要有多个可变引用（但不是同时），可以使用
{}来使前面的可变引用者离开作用域。



