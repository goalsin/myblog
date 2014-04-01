Title: 云计算的一点想法
Tags: html, javascript, jQuery, plugin

2011-07-11 09:38 (分类:默认分类)

云计算4个领域：管理，虚拟化，计算，存储 

其实，归结起来云计算的本质在于管理模式的变更。

虚拟化，计算，存储最终的落点仍是管理，一种更为友好合理的方式，

虚拟化实现了资源更为合理的使用和调配，计算能力则是结合分布式应用和nosql存储，利用map/reduce等算法简化计算及作业划分方式，存储上由传统的rdbms转化为使用于特定场景的NoSQL这样键值对方式的数据库，提高了访问速度，降低了其事务性，nosql存储为云计算中的计算能力提供了基础设施。

 

我们要做的是一个分布式管理平台。主要用于管理：资源，虚拟化，计算(其实是作业管理或调度管理)，存储

 

云里另一个概念即弱终端的云端。

我们希望通过一个简单的页面，可以完成对云中资源的管理，而不需要ssh连接到对应主机上进行操作。

1）资源管理

2）作业调度

3）虚拟主机建立

4）远程管理

 

我们希望做到：

1）知道ip地址，可以在远程主机上建立用户

2）在该用户上可以虚拟化，建立n个虚拟主机，采用拖拽方式，把虚拟主机图标拖到当前IP上，然后双击虚拟主机图标进行个性化设置。

3）创建和管理作业任务，让作业任务管理到对应虚拟主机上，控制其所用资源和执行情况。主要可以完成以下3个方面

     3。1）远程执行命令，主机监控等

     3。2）资源管理

     3。3）软件的安装部署

任务是我们自己定义的，可以很容易的扩展，进而实现各种用途。

4）收集所有元数据，以可定制报表的方式展现出来。

 

 

可行性分析

1、目前部署需要web可视化部署

2、江苏电力有主机监控的需求，虽然他们有IBM的Trivos，但是这东西启动太慢，5分钟，所以他们需要用，但很少用，

其实对于我们很容易扩展它，可远程执行命令，返回执行结果，这就是很好的监控。

3、为以后的虚拟化等产品做好准备。扩展云平台各种管理都极其容易。

 

从战略角度讲，获得［集群节点信息］就获得了云计算的制高点。

无论主机，虚拟主机，作业，资源等都是可控的，上层应用的扩展价值极大。

 

 

实现方式：暂分为3个阶段

 

初步阶段：

1。实现web终端，远程执行命令

 

基本完成阶段：完成自动部署

2。完成自动部署步骤：

     1÷上传资源，只允许上传tar文件，tar tvf查看内容

     2÷创建用户

     3÷任务管理，拷贝到对应主机，解压，安装，返回日志

     4÷远程多主机的执行顺序启动命令

     5÷远程监控

 

可扩展阶段：

3。管理虚拟化，计算任务，存储安装与设置

 

 

 

主要工作：

主机上资源管理

ant作业配置(依赖上面的资源管理)

作业调度管理

主机用户创建，以用户作为角色，管理作业任务

 

 

 

 

1.0版本规划

目标：尽快实现一个原型，提供可移植扩展的api

jquery＋jsp＋servlet＋jdbc

数据库：hsqldb

tomcat

 

2.0版本规划

目标：产品化

采用portal，和主流框架

 

 

 

 

 

 

 

＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝＝

说明：上面的思考源于此次安装过程的再总结

 

 

1安装baserpm     

2安装gccinstall

3安装mysql

4安装datacell

5安装tomcat

6安装logmonitor

7测试是否安装成功

 

 

回顾一下整个过程

 

项目

install logmonitor project

 

文件列表－－资源

dist/:

     doc            使用文档

     install         系统安装软件

     yoyosys     友友公司软件

     README   光盘说明文件

 

 

 

 

部署项－－ant对应的target

1安装baserpm

2安装gccinstall

3安装mysql

4安装datacell

5安装tomcat

6安装logmonitor

 

主机信息－－集群节点

 IP                    hostname          OS        版本号

172.16.88.47

172.16.88.48

 

是否需要创建用户

172.16.88.47－－yoyoadm/pass123!

172.16.88.48－－yoyoadm/pass123!

 

 

主机－部署对应关系－－scp和ssh的target配置信息

 

【主机】         【部署项】     【用户】          【安装目录】

172.16.88.47－－1baserpm－－yoyoadm－－/home/yoyoadm/yoyo

172.16.88.47－－2gccinstall－－yoyoadm－－/home/yoyoadm/yoyo

172.16.88.47－－4datacell－－yoyoadm－－/home/yoyoadm/yoyo

172.16.88.47－－5tomcat－－yoyoadm－－/home/yoyoadm/yoyo

172.16.88.47－－6logmonitor－－yoyoadm－－/home/yoyoadm/yoyo

 

172.16.88.48－－1baserpm－－yoyoadm－－/home/yoyoadm/yoyo

172.16.88.48－－2gccinstall－－yoyoadm－－/home/yoyoadm/yoyo

172.16.88.48－－3mysql－－yoyoadm－－/home/yoyoadm/yoyo

172.16.88.48－－4datacell－－yoyoadm－－/home/yoyoadm/yoyo

 

【主机172.16.88.47任务】－－执行target

部署项 －－1安装baserpm－－安装脚本install.sh－－记录日志baserpm.install.log－－确认是否执行成功

部署项 －－2安装gccinstall－－安装脚本install.sh－－记录日志gccinstall.install.log－－确认是否执行成功

部署项 －－4安装datacell－－安装脚本install.sh－－记录日志datacell.install.log－－确认是否执行成功

部署项 －－5安装tomcat－－安装脚本install.sh－－记录日志tomcat.install.log－－确认是否执行成功

部署项 －－6安装logmonitor－－安装脚本install.sh－－记录日志logmonitor.install.log－－确认是否执行成功

 

【主机172.16.88.48任务】－－执行target

部署项 －－1安装baserpm－－安装脚本install.sh－－记录日志baserpm.install.log－－确认是否执行成功

部署项 －－2安装gccinstall－－安装脚本install.sh－－记录日志gccinstall.install.log－－确认是否执行成功

部署项 －－3安装mysql－－安装脚本install.sh－－记录日志mysql.install.log－－确认是否执行成功

部署项 －－4安装datacell－－安装脚本install.sh－－记录日志datacell.install.log－－确认是否执行成功

 

 

【My任务】－－自定义target，负责启动停止等

－【启动】

          启动datacell

                －172.16.88.47 ：/home/yoyoadm/datacell/bin/run.sh

                －172.16.88.48 ：/home/yoyoadm/datacell/bin/run.sh

          启动mysql

                －172.16.88.48 ：service mysqld start

          启动tomcat

                －172.16.88.47 ：/home/yoyoadm/tomcat/bin/startup.sh

－【停止】

          停止datacell

                －172.16.88.47 ：/home/yoyoadm/datacell/bin/stop.sh

                －172.16.88.48 ：/home/yoyoadm/datacell/bin/stop.sh

          停止mysql

                －172.16.88.48 ：service mysqld stop

          停止tomcat

                －172.16.88.47 ：/home/yoyoadm/tomcat/bin/shutdown.sh

 

 

 

172.16.88.47－－yoyoadm/pass123!

可登录，查看，执行，创建task

 

webShell

webBrowser

ftp

 

 

监控问题

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

 

