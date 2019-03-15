什么是AJAX？
 AJAX全称为“Asynchronous JavaScript and XML"(异步JavaScript和XML并不是新的技术而是多种老技术的集合）。

AJAX包含的技术？
1.XHTML和CSS
2.使用文档对象模型DOM（Document Object Model)做动态显示和交互。
3.使用XML和XSLY做数据交互和操作。
4.使用XMLHttpRequest将它们进行绑定在一起。
AJAX实现原理
Ajax的原理简单来说通过XmlHttpRequest对象来向服务器发异步请求,从服务器获得数据,然后用javascript来操作DOM而更新页面。

AJAX工作流程
AJAX的工作原理相当于在用户和服务器之间加了一个中间层，使用户操作与服务器相应异步化。并不是所有的用户请求都提交给服务器，像一些数据验证和数据处理等都交给AJAX引擎自己来做，只有确定需要从服务器读取新数据时再由AJAX引擎代为向服务器提交请求。

AJAX应用程序的优势在于：
1.通过异步模式，提升了用户体验。
2.优化了浏览器和服务器之间的传输，减少不必要的数据往返，减少了带宽占用。
3.AJAX引擎在客户端运行，承担了一部分本来由服务器承担的工作，从而减少了服务器负载。
AJAX几点局限性：
1.不能实时请求和响应服务器数据。
2.不支持浏览器回退功能。
3.不能提交多媒体数据，比如图片，文件等。
AJAX应用流程解析
1.先看一个简单例子
var xhr = new XMLHttpRequest();
//在地址栏输入地址  创建一个XMLHttpRequest对象1
xhr.open('get','1.txt',true);
//提交
xhr.send();
//等待服务器返回内容
xhr.onreadystatechange = function() {
　　if ( xhr.readyState == 4 ) {

　　　　if(xhr.status == 200){
　　　　　　alert( xhr.responseText );

　　　　}else{

　　　　　　alert("出错了，错误码为"+xhr.status+"0");

　　　　}
　　}
}

首先第一句ie6及以下并没有 XMLHttpRequest对象  

解决方法一

if (window.XMLHttpRequest) {
　　xhr = new XMLHttpRequest();
} else {
　　xhr = new ActiveXObject('Microsoft.XMLHTTP');
}

 解决方法二

try {
　　xhr = new XMLHttpRequest();
} catch (e) {
　　xhr = new ActiveXObject('Microsoft.XMLHTTP');
}

第二句xhr.open('get','1.txt',true);

一参：可以选择get和post     区别和表单中get post相似              //默认为get

get：通过URL传递给该脚本的变量的数组 
post：通过HTTP POST方法（表单）传递给该脚本的变量的数组      //更多区别可以自行了解

注意：前后台键名和传输方式必须一致

二参 ：后台文件或者数据所在位置 ，不可以跨域访问。

三参：异步传输还是同步传输　　　　　　　　　　　　　　　　　//默认是异步true

true： 为异步    简单理解，不阻塞后边代码        比如在传输后面使用alert调用传输的值将为空

false：同步　　 　　　　　　阻塞后边代码　　alert传输值，可以调用  因为调用完成执行后边代码

xhr.send();

提交请求，前两句并为真正提交，这句才将请求提交服务器

 
最后一块一起讲

xhr.onreadystatechange = function() {
　　if ( xhr.readyState == 4 ) {
　　　　alert( xhr.responseText );
　　}

responseText返回以文本形式存放的内容，由于非阻塞状态可能你获取xhr.responseText 值时候AJAX调用并为完成。可能值为空，这是可能大家会想做个延迟在使用该值，但由于不确定的网络状态并不能准确判断延迟时间。如何解决请看下一条属性

readyState 和onreadystatechange：官方给我们提供了更加开挂的两个方法

readyState 反应AJAX请求状态的变化

　　0 （初始化）还没有调用open()方法

　　1 （载入）已调用send()方法，正在发送请求

　　2 （载入完成）send()方法完成，已收到全部响应内容

　　3 （解析）正在解析响应内容

　　4 （完成）响应内容解析完成，可以在客户端调用了

onreadystatechange当状态改变时候触发的事件

所以可以写函数当状态改变到状态4 AJAX解析完成 ，客户端可以调用。

xhr.status   HTTP状态码 



if(xhr.status == 200)时表示请求数据成功

也可在其他的状态码的时候设置对应界面  

