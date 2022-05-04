<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>


<!DOCTYPE html>
<html lang="ru">
<head>
  <title>Регистрация</title>
  <meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>
  <link rel="stylesheet" href="${contextPath}/resources/css/style.css"/>
</head>
<body class="fon">
<div class="fon_header">
  <div>
    <a class="logomain" href="/"><img src="${contextPath}/resources/img/logo.png" width="75" height="75" alt="Пример"></a>
  </div>
  <div class="container">

    <h1 class="header">BOKOFF PIZZA</h1>
  </div>
</div>

<div class="indent">

</div>

<div class="fon_window">
  <div class="fon_window_center">
    <img src="${contextPath}/resources/img/logo.png" width="270" height="270">
  </div>

  <form:form method="POST" modelAttribute="userForm">
    <div class="container_inner">
      <p class="font_inner">Почта:</p>
      <form:input class="field_inner" type="text" size="15" path="mail" autofocus="true"></form:input>
      <form:errors path="mail"></form:errors>
        ${mailError}
    </div>
    <div class="container_inner">
      <p class="font_inner">Пароль:</p>
      <form:input class="field_inner" type="password" size="16" path="password" autofocus="true"></form:input>
      <form:errors path="password"></form:errors>
        ${passwordError}
    </div>
    <div class="container_inner">
      <p class="font_inner">Повторите пароль:</p>
      <form:input class="field_inner" type="password" size="16" path="passwordConfirm" autofocus="true"></form:input>
      <form:errors path="passwordConfirm"></form:errors>
        ${repasswordError}
    </div>
    <div class="fon_window_center">
      <button class="button_in" type="submit">Зарегистрироваться</button>
    </div>
  </form:form>


  <div class="fon_window_center">
    <a href="/login">
      <button class="button_in3" >Назад</button>
    </a>
  </div>


</div>
</body>
</html>