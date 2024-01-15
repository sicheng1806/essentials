#!/bin/bash

cd "chap1"

titles="实数和空间线段的关系 数列、单变量函数极限和实数域的封闭性 单变量函数微分 单变量函数积分 级数"

for title in $titles ; do 
    echo -e "$title \n***************************" >> $title.rst
done

