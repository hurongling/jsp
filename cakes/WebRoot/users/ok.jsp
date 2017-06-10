<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
        <meta http-equiv="refresh" content="3;url=/cakes/index.jsp" />  
    <title>支付</title>
		<link rel="stylesheet" type="text/css" href="/cakes/css/public.css"/>
		<link rel="stylesheet" type="text/css" href="/cakes/css/proList.css" />
  </head>
  
  <body>
		<div class="order mt cart">
			<div class="site">
				<p class="wrapper clearfix">
					<span class="fl">支付成功</span>
					<img class="top" src="/cakes/image/cartTop03.png">
				</p>
			</div>
			<p class="ok">支付成功！剩余<span  class="second">3</span>秒<a href="/cakes/index.jsp">返回订单页</a></p>
		</div>  
  
		<script src="/cakes/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>  

    <script type="text/javascript">  
        $(function() {  
            var wait = $(".second").html();  
            timeOut();  
            /**  
             * 实现倒计时  
             */  
            function timeOut() {  
                if(wait != 0) {  
                    setTimeout(function() {  
                        $('.second').text(--wait);  
                        timeOut();  
                    }, 1000);  
                }  
            }  
        });  
    </script>    

  </body>
</html>
