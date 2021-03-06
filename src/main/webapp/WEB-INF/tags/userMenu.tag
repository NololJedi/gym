<%@tag pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/lib/css/font-awesome.min.css">

<fmt:bundle basename="page_content">
    <fmt:message key="menu.title" var="title"/>
    <fmt:message key="menu.hello" var="hello"/>
    <fmt:message key="menu.hello_guest" var="hello_guest"/>
    <fmt:message key="menu.login" var="login"/>
    <fmt:message key="menu.register" var="register"/>
    <fmt:message key="menu.logout" var="logout"/>
    <fmt:message key="menu.create_training_program" var="create_training_program"/>
    <fmt:message key="menu.create_exercise" var="create_exercise"/>
    <fmt:message key="menu.show_personal_clients" var="show_personal_clients"/>
    <fmt:message key="menu.show_clients" var="show_clients"/>
    <fmt:message key="menu.find_client" var="find_client"/>
    <fmt:message key="menu.orders_history" var="orders_history"/>
    <fmt:message key="menu.my_training_program" var="my_training_program"/>
    <fmt:message key="menu.make_order" var="make_order"/>
    <fmt:message key="menu.change" var="change"/>
    <fmt:message key="menu.language" var="language"/>
</fmt:bundle>

<header class="header">
    <h1 class="top">${pageScope.title}</h1>
    <div class="change_level">
        <ul>
            <li>${pageScope.language} </li>
            <li>
                <a href="${pageContext.request.contextPath}/controller?command=common_change_language&locale=ru">RU</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/controller?command=common_change_language&locale=by">BY</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/controller?command=common_change_language&locale=en">EN</a>
            </li>
        </ul>
    </div>
    <div class="hello_message">
        <c:choose>
            <c:when test="${sessionScope.user == null}">
                <span class="hello_text">${pageScope.hello_guest}</span>
                <a class="logout_a"
                   href="${pageContext.request.contextPath}/jsp/common/login.jsp">${pageScope.login}</a>
                <a class="register_login_a"
                   href="${pageContext.request.contextPath}/jsp/common/register.jsp">${pageScope.register}</a>
            </c:when>
            <c:otherwise>
                <span class="hello_text">${pageScope.hello} ${sessionScope.user.firstName} ${sessionScope.user.lastName}</span>
                <a class="register_login_a"
                   href="${pageContext.request.contextPath}/controller?command=common_logout">${pageScope.logout}</a>
            </c:otherwise>
        </c:choose>
    </div>
</header>

<div class="user_menu">
    <ul>
        <c:if test="${sessionScope.user != null}">
            <li><a href="${pageContext.request.contextPath}/jsp/common/main.jsp"><i class="fa fa-home"
                                                                                    aria-hidden="true"></i></a></li>
            <c:choose>
                <c:when test="${sessionScope.user.userRole == 'TRAINER'}">
                    <li>
                        <a href="${pageContext.request.contextPath}/controller?command=trainer_prepare_training_program_creation">${pageScope.create_training_program}</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/jsp/trainer/create_exercise.jsp">${pageScope.create_exercise}</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/controller?command=trainer_show_personal_clients">${pageScope.show_personal_clients}</a>
                    </li>
                </c:when>
                <c:when test="${sessionScope.user.userRole == 'ADMIN'}">
                    <li>
                        <a href="${pageContext.request.contextPath}/controller?command=admin_show_all_clients">${pageScope.show_clients}</a>
                    </li>
                    <li>
                        <form id="find" name="FindForm" method="POST"
                              action="${pageContext.request.contextPath}/controller">
                            <input type="hidden" name="command" value="admin_find_client_by_name"/>
                            <label>${pageScope.find_client} <input type="text" name="name" value=""/></label>
                            <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                        </form>
                    </li>
                </c:when>
                <c:otherwise>
                    <li>
                        <a href="${pageContext.request.contextPath}/controller?command=special_show_client_orders&client_id=${sessionScope.user.id}">${pageScope.orders_history}</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/controller?command=special_show_client_training_program&client_id=${sessionScope.user.id}">${pageScope.my_training_program}</a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/controller?command=client_check_actual_order&client_id=${sessionScope.user.id}">${pageScope.make_order}</a>
                    </li>
                </c:otherwise>
            </c:choose>
        </c:if>
    </ul>
</div>