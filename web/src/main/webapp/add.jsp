<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.HashMap" %>
<%@page import="java.util.Map" %>
<%@ page isELIgnored="false" %>
<html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
    function pictureImg(input){
        var file = input.files[0];  //获取第一个文件对象 （如果有多张时可使用循环files数组改变多个<img>的 src值）
        if(window.FileReader){  //判断当前是否支持使用FileReader
            var fr = new FileReader();  //创建读取文件的对象
            fr.readAsDataURL(file); //以读取文件字符串的方式读取文件 但是不能直接读取file,因为文件的内容是存在file对象下面的files数组中的,该方法结束后图片会以data:URL格式的字符串（base64编码）存储在fr对象的result中
            fr.onloadend = function(){
                document.getElementById("img").src = fr.result;
            }
        }
    }
</script>
<head>
    <title>
        <c:choose>
            <c:when test="${user.id != null && user.id != 0}">
                <fmt:message key="update"></fmt:message>
            </c:when>
            <c:otherwise>
                <fmt:message key="add"></fmt:message>
            </c:otherwise>
        </c:choose>
    </title>
</head>
<body>

<form:form action="${pageContext.request.contextPath}/users" method="POST" modelAttribute="user" enctype="multipart/form-data">
    <c:if test="${user.id != null && user.id != 0}">
        <form:hidden path="id"/>
        <input type="hidden" name="_method" value="PUT"/>
    </c:if>
    <fmt:message key="user.head"></fmt:message>:<img style="width:200px" id="img" src="${pageContext.request.contextPath}/picturePreview?id=${user.id}"><input path="head" type="file" onchange="pictureImg(this)" name="picture"><br/>
    <fmt:message key="user.name"></fmt:message>:<form:input path="name"/> <form:errors path="name"></form:errors><br/>
    <fmt:message key="user.age"></fmt:message>:<form:input path="age"/> <form:errors path="age"></form:errors><br/>
    <fmt:message key="user.sex"></fmt:message>:<form:input path="sex"/><br/>
    <fmt:message key="user.email"></fmt:message>:<form:input path="email"/> <form:errors path="email"></form:errors><br/>
    <fmt:message key="user.birtdate"></fmt:message>:<form:input path="birthdate"/> <form:errors path="birthdate"></form:errors><br/><br/>
    <input type="submit" value="<fmt:message key="submit"></fmt:message>"/>
</form:form>

</body>
</html>
