#!/bin/bash

titles="结构面的物理力学性质 岩体的物理力学性质 岩体的赋存环境 岩体的变形与本构关系 岩体的破坏与强度理论 岩体力学介质划分 连续介质岩体力学 板裂介质岩体力学 块裂介质岩体力学 碎裂介质岩体力学"

for title in $titles ; do 
    echo -e "$title \n***************************" >> $title.rst
done
