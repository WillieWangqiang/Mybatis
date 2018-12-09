<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="js/jquery-1.11.1.min.js"></script>
<!-- Custom Theme files -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link rel="stylesheet" href="./layui/css/layui.css"  media="all">
<link rel="stylesheet" href="./css/app.css"/>
<!-- Custom Theme files -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!--menu-->
<link href="css/mmenu.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery.mmenu.min.js"></script>
<script type="text/javascript">
		$(function() {
			$('nav#menu').mmenu();
		});
	</script>
<script type="text/javascript">
		jQuery(document).ready(function($) {
			var username = '<%= session.getAttribute("username")%>';
			if(username != 'null' ){
				$("[href='toLog']").text(username+" 退出");
				$("[href='toLog']").attr("href","outLog");
			}else{
				$("[href='outLog']").attr("href","toLog");
			}
		  $(".scroll").click(function(event){		
			event.preventDefault();
		  $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>
<script type="text/javascript" src="js/jquery.easing.min.js"></script>	
	<script type="text/javascript" src="js/jquery.mixitup.min.js"></script>
	<script type="text/javascript">
	$(function () {
		
		var filterList = {
		
			init: function () {
			
				// MixItUp plugin
				// http://mixitup.io
				$('#portfoliolist').mixitup({
					targetSelector: '.portfolio',
					filterSelector: '.filter',
					effects: ['fade'],
					easing: 'snap',
					// call the hover effect
					onMixEnd: filterList.hoverEffect()
				});				
			
			},
			
			hoverEffect: function () {
			}

		};
		
		// Run the show!
		filterList.init();
		
		
	});	
	</script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
</head>
<body>
<div class="header">	
  <div class="container"> 
     <div id="page">
		<div id="header_nav">
			<a href="#menu"></a>
		</div>
	    <nav id="menu">
			<ul>
				<li class="Selected"><a href="index.html">Home</a></li>
				<li><a href="#contact" class="scroll">Contact</a></li>
				<li><a href="#contact" class="scroll">图床总览</a></li>
				<li><a href="toLog" class="scroll">登录</a></li>
				<li><a href="reg" class="scroll">注册</a></li>
				<li><a href="#contact" class="scroll">API</a></li>
				<li><a href="#contact" class="scroll">此处用于扩展</a></li>
			</ul>
		</nav>
	   </div>
	   <h1>云上的图片,你我共享</h1>
	   <s> </s>
	   <br/>	   <br/>	   <br/>	
	   <div class="container">
			<!--<button type="button"  class="fa-btn btn-1 btn-1e " id="test2">上传图片</button>-->
			<button type="button" class="fa-btn btn-1 btn-1e " id="testList">选择多文件</button> 
			<br class="show"/><br class="show"/><br class="show"/>
		<div class="layui-progress layui-progress-big show" lay-showpercent="true" lay-filter="demo">
            <div class="layui-progress-bar layui-bg-red show" lay-percent="0%"></div>
        </div>
	</div>
	   <div class="header_arrow">
	      <a href="#arrow" class="scroll"><span> </span></a>
	   </div>
</div>
</div>
<div class="introduct" id="arrow">
	<div class="container">
		<h2>为什么把图片存放在我们这儿</h2>
		<span> </span>
		<p>我们有一套完整的图片存储体系，而且我们图片加载速度极快，当然我们并不是提供方，只不过我们会给您提供一个方便快捷的存储空间。</p>
	</div>
</div>
<div class="create">
	<div class="container">
		<a href="#" id="back-to-top" class="fa-btn btn-1 btn-1e">我要上传</a>
		<button type="button" class="layui-btn " style="display:none;" id="testListAction">开始上传</button>
	</div>
</div>

<div class="contact" id="contact">

<div class="footer">
	<div class="container">
		<p class="copy">Copyright &copy; <a href="http://www.vrtow.com/" rel="nofollow
		" target="_blank" title="VRTOW">VRTOW</a>.Company name All rights reserved.More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></p>
	</div>
	<script type="text/javascript">

						$(document).ready(function() {
							/*
							var defaults = {
					  			containerID: 'toTop', // fading element id
								containerHoverID: 'toTopHover', // fading element hover id
								scrollSpeed: 1200,
								easingType: 'linear' 
					 		};
							*/
							
							$().UItoTop({ easingType: 'easeOutQuart' });
							
						});
					</script>
		<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
</div>
<script src="./layui/layui.js"></script>
    <script src="./js/clipboard.min.js"></script>
<script>
//一般直接写在一个js文件中
layui.use(['layer','upload','element'], function(){
  var layer = layui.layer
  ,upload = layui.upload,
  element = layui.element,
  $ = layui.jquery,
  time=0,files;
  	  var a=0;
	  var skat=0;
	  var jsonarray;
	  var array=new Array();
  

  
  //多图片上传
        upload.render({
            elem: '#test2'
            ,url: 'https://sm.ms/api/upload'
            ,multiple: false
            ,field:'smfile'
            ,before: function(obj){
               $(".show").show();
			   if(time==0){
	    sso();
	  }
            }
            ,done: function(res){

	    time=0;
		clearInterval(time);
			element.progress('demo', '100%');
			
                console.info(res)
				if(res.code=="success"){
				
				//图片加载成功,数据回放到服务器
				}else{
				layer.msg("此图片已被阻止，请联系网站管理员获取更多信息！")
				}
            }
        });
		
		
		

		
		
		
		
		
		
		function  sso(){


            //模拟loading
            var n = 0, timer = setInterval(function(){
                n = n + Math.random()*10|0;
                if(n>90){
                    n = 90;
                    clearInterval(timer);

                }
                element.progress('demo', n+'%');
            }, 300+Math.random()*1000);

time=timer;
        }
		
		 $("#back-to-top").click(function(){
                //$('body,html').animate({scrollTop:0},1000);
        if ($('html').scrollTop()) {
                $('html').animate({ scrollTop: 0 }, 1000);
				$("#testList").click();
                return false;
            }
            $('body').animate({ scrollTop: 0 }, 1000);
                 return false;            
           });  
		   
		   
		   
		   
		     //多文件列表示例
  var demoListView = $('#demoList')
  ,uploadListIns = upload.render({
    elem: '#testList'
    ,url: 'https://sm.ms/api/upload'
    ,accept: 'file'
    ,multiple: true
	 ,field:'smfile'
    ,auto: false
    ,bindAction: '#testListAction'
    ,choose: function(obj){   
      var filess = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
	element.progress('demo', '0%');

for (key in filess) {  
  
   a=a+1;
  
}  
  skat=a;
      //读取本地文件
      obj.preview(function(index, file, result){

      
        
        //单个重传

         obj.upload(index, file);

        
        //删除

         // delete files[index]; //删除对应的文件
          uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选

      });
    },done: function(res, index, upload){
	a--;
	if(a==0){
	        	clearInterval(time);
				time=0;
			element.progress('demo', '100%');
	}else{
	var ind=skat-a;
	var ss=100/skat*ind|0;
	element.progress('demo', ss+'%');
	
	}
	
	
      if(res.code=="success"){ //上传成功
	  if(jsonarray==null||jsonarray==undefined){
	  var jsonstr="[]";
	  jsonarray = eval('('+jsonstr+')');
	  }
	  jsonarray.push(res.data);
		console.info(jsonarray);

      }else{
	  console.info(res);
	  		array.push(this.files[index].name)
console.info(array.toString());
	  }
	  if(a==0){
	  var str="<div class='layui-row layui-col-space30 vip-goods-box'><p>以下为上传成功的图片</p>";
	  for(kays in jsonarray){
	  if(kays=="compare"){
	  
	  }else{
	  	  str=str+"<a class='layui-col-xs12 layui-col-sm4 layui-col-md2'><div class='vip-goods-list'><img src='"+jsonarray[kays].url+"' alt='"+jsonarray[kays].filename+"'><div class='vip-goods-footer'><button class='look layui-btn layui-btn-xs layui-bg-red flt-left '  data-url='"+jsonarray[kays].url+"'>预览</button> <button class='copy layui-btn layui-btn-xs layui-bg-red flt-right' data-url='"+jsonarray[kays].url+"'>复制</button> </div></div></a>";
		  
		  

	  }

	  }
	  for(kays in jsonarray){
	  if(kays!="compare"){
	  delete jsonarray[kays];
	  }
		   
	  }
	  str=str+"<hr/><p>以及以下上传失败的文件<br/>"+array.toString()+"<br/><br/><br/><h3>严禁上传及分享如下类型的图片：</h3><ul>"+
	"<li>含有色情、暴力、宣扬恐怖主义的图片</li>"+
	"<li>侵犯版权、未经授权的图片</li>"+
	"<li>其他违反中华人民共和国法律的图片</li>"+
	"<li>其他违反香港法律的图片</li>"+
"</ul><h2 style='color:red;'>如果您的图片没有违规但是上传失败，可能是您上传太过频繁了，请过一个小时之后再来上传吧</h2></p></div>"
	  array.length = 0;  
console.log(array); // 输出 []，空数组，即被清空了 
	  layer.open({
                title:'信息出来啦'
                ,type: 1
                //,skin: 'layui-layer-rim'
                ,shadeClose: true
                ,area: ['80%', '80%']
                ,content: '<div style="padding: 20px;">'+str+'</div>'
            });
	  }
	  return delete this.files[index]; //删除文件队列已经上传成功的文件
    }
    ,error: function(index, upload){
     console.info("网络出现问题");
		
    }
  });
	
	$(document).on('click','.look',function(){
	var url=$(this).data('url');
        window.open(url);
        });
			$(document).on('click','.copy',function(){
			var urls=$(this).data('url');
        	var clipboard = new ClipboardJS('.copy', {
                                text: function() {
                                    return urls;
                                }
                            });
                            clipboard.on('success', function(e) {
                               layer.msg("链接复制成功")
                               
                            });
                            clipboard.on('error', function(e) {
                                layer.alert('复制失败，请手动复制<br/>'+url);
                            });
        });

	
});
</script> 
</body>
</html>