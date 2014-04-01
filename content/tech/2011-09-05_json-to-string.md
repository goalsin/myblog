Title: 非常好用的JsonToString方法
Tags: html, javascript, jQuery, plugin

2011-09-05 13:12 (分类:默认分类)

非常好用的JsonToString方法

//'

 

Jsontostring代码 

function JsonToString(o) {     
    var arr = [];  
    var fmt = function(s) {  
        if (typeof s == 'object' && s != null) return JsonToStr(s);  
        return /^(string|number)$/.test(typeof s) ? "'" + s + "'" : s;  
    }  
    for (var i in o)  
         arr.push("'" + i + "':" + fmt(o[i]));  
    return '{' + arr.join(',') + '}';  
}  
 

 

 

我反正用的很爽，哈哈

另外: 如果不想json中的数字也被字符串化. 可以改造: return /^(string|number)$/.test(typeof s) ? '"' + s + '"' : s; 为 : return /^(string)$/.test(typeof s) ? '"' + s + '"' : s; (其实就是把number类型的忽略掉而已)