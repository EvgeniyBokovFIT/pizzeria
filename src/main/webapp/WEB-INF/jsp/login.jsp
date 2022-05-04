<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ru">
<head>
  <title>BOKOFF</title>
  <meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>
  <link rel="stylesheet" href="${contextPath}/resources/css/style.css"/>
</head>
<body>
<sec:authorize access="isAuthenticated()">
  <% response.sendRedirect("/"); %>
</sec:authorize>

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
  <div>
    <div class="fon_window_center">
      <img src="${contextPath}/resources/img/logo.png" width="270" height="270">
    </div>

    <form method="POST" action="/login">
      <div>
        <div class="container_inner">
          <p class="font_inner">Почта:</p>
          <input name="username" class="field_inner" type="text" size="15" placeholder="Username"
                 autofocus="true"/>
        </div>
        <div class="container_inner">
          <p class="font_inner">Пароль:</p>
          <input name="password" class="field_inner" type="password" size="16" placeholder="Password" />
        </div>

        <div class="fon_window_center">
          <button class="button_in" type="submit">Войти</button>
        </div>


        <div>
          <p class="no_acc">Нет аккаунта?</p>
        </div>
        <div class="fon_window_center">
          <a class="button_in2" href="/registration">Регистрация</a>
        </div>

        <div class="fon_window_center">
          <a class="button_in3" href="/">Назад</a>
        </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>
