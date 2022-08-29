<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>
<html>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.6.0.min.js"></script>
<head>
    <title><fmt:message key="list"></fmt:message></title>
    <script type="text/javascript">
        $(function () {
            $(".delete").click(function () {
                var href = $(this).attr("href");
                $("#del").attr("action", href).submit();
                return false;
            });

            $("#lang").change(function () {
                var lang = $("#lang").val();
                window.location.href = "i18n?locale=" + lang;
            });
        });
    </script>
</head>
<body>
<select onchange="i18n()" id="lang">
    <option value="zh_CN" <c:if test="${lang == 'zh_CN'}">selected="selected"</c:if>>中文</option>
    <option value="en_US" <c:if test="${lang == 'en_US'}">selected="selected"</c:if>>英语</option>
</select>

<br/>
<a href="${pageContext.request.contextPath}/users"><fmt:message key="add"></fmt:message></a>

<form action="" method="POST" id="del">
    <input type="hidden" name="_method" value="DELETE"/>
</form>

<c:if test="${!empty requestScope.list }">
    <table border="1" cellpadding="10" cellspacing="0">
        <tr>
            <th><fmt:message key="user.id.number"></fmt:message></th>
            <th><fmt:message key="user.head"></fmt:message></th>
            <th><fmt:message key="user.name"></fmt:message></th>
            <th><fmt:message key="user.sex"></fmt:message></th>
            <th><fmt:message key="user.age"></fmt:message></th>
            <th><fmt:message key="user.email"></fmt:message></th>
            <th><fmt:message key="user.birtdate"></fmt:message></th>
            <th><fmt:message key="edit"></fmt:message></th>
        </tr>
        <c:forEach items="${requestScope.list }" var="l">
            <tr>
                <th>${l.id}</th>
                <th><img src='${pageContext.request.contextPath}/picturePreview?id=${l.id}' width='40%'/></th>
                <th>${l.name}</th>
                <c:choose>
                    <c:when test="${lang == 'en_US'}">
                        <td>${l.sex == 0 ? 'Girl' : 'Man' }</td>
                    </c:when>
                    <c:otherwise>
                        <td>${l.sex == 0 ? '女' : '男' }</td>
                    </c:otherwise>
                </c:choose>

                <th>${l.age}</th>
                <th>${l.email}</th>
                <th>${l.birthdate}</th>
                <th>
                    <a class="delete" href="${pageContext.request.contextPath}/users/${l.id}"><fmt:message key="delete"></fmt:message></a>
                    <a href="${pageContext.request.contextPath}/users/${l.id}"><fmt:message key="update"></fmt:message></a>
                </th>
            </tr>
        </c:forEach>
    </table>
</c:if>

<br/>


</body>
</html>
