
---
#采用 JSP JSTL MVC设计模式开发的蛋糕店
-------------
> 关于我，欢迎关注  
  博客：[胡荣玲的博客](https://hurongling.github.io/) <br>
  邮箱：huhurongling@gmail.com<br>
  
###一、项目介绍： 
本项目使用MVC框架和MySQL数据库。目前实现功能：</br>
（1）前台功能：用户注册、商品展示(css动画效果)、购物车功能(商品进行添加、删除、查看操作)，订单提交。</br>
![商品展示](http://oi1ylq4ab.bkt.clouddn.com/%E5%95%86%E5%93%81%E5%B1%95%E7%A4%BA.gif)[http://oi1ylq4ab.bkt.clouddn.com/%E5%95%86%E5%93%81%E5%B1%95%E7%A4%BA.gif]</br>不知是不是gif太大，显示不了图片，看效果图直接复制链接，哈哈~<br>
![加入购物车](http://oi1ylq4ab.bkt.clouddn.com/%E5%8A%A0%E5%85%A5%E8%B4%AD%E7%89%A9%E8%BD%A6.gif)</br>[http://oi1ylq4ab.bkt.clouddn.com/%E5%8A%A0%E5%85%A5%E8%B4%AD%E7%89%A9%E8%BD%A6.gif]</br>
![个人信息](http://oi1ylq4ab.bkt.clouddn.com/%E4%B8%AA%E4%BA%BA%E4%BF%A1%E6%81%AF.gif)<br>[http://oi1ylq4ab.bkt.clouddn.com/%E4%B8%AA%E4%BA%BA%E4%BF%A1%E6%81%AF.gif]</br>
（2）后台功能：类别信息的插入和查询;商品信息的插入和查询</br>
![后台](http://oi1ylq4ab.bkt.clouddn.com/%E5%90%8E%E5%8F%B0.gif)</br>[http://oi1ylq4ab.bkt.clouddn.com/%E5%90%8E%E5%8F%B0.gif]</br>
（3）使用过滤器 Filter 过滤乱码及不合法访问

###二、项目部署：
本项目使用MyEclipse2014 + Tomcat7.0+ MySql5.7的开发环境。</br>
1、安装 MyEclipse2014、Tomcat、MySql软件。</br>
2、MySql数据库中创建cakes数据库。 </br>
(1)CREATE DATABASE cakes CHARACTER SET utf8 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT COLLATE utf8_general_ci ;</br>
(2）本项目中执行cake.sql，SQL语句创建各种表单，和默认管理员用户 ，默认普通用户。管理员用户名：a1,密码：a1.普通用户的用户名：u1,密码 u1. </br>
3、本网站源码导入Eclipse中，网站就可以运行。</BR>

###三、原理说明
1. 数据库</br>
![数据库](http://oi1ylq4ab.bkt.clouddn.com/%E6%95%B0%E6%8D%AE%E5%BA%93.JPG)</br>
2. 商品显示</br>
![商品显示](http://oi1ylq4ab.bkt.clouddn.com/%E5%95%86%E5%93%81%E5%B1%95%E7%A4%BA.JPG)</br>
3. 添加购物车</br>
![添加购物车](http://oi1ylq4ab.bkt.clouddn.com/%E6%B7%BB%E5%8A%A0%E8%B4%AD%E7%89%A9%E8%BD%A6.JPG)</br>
###TODO LIST
- 完善管理员界面  
- 管理员作废订单功能  
- 更新购买数量  
- 项目部署、申请域名  
- 在线支付  
- 数据保密  
