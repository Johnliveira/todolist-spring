<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<%--  <link href="resource/css/bootstrap.min.css" rel="stylesheet">--%>
</head>
<body>
<div class="container">
  <h1>Login</h1>
  <div class="card">
    <div class="card-body">
      <form action="<%=request.getContextPath()%>/register" method="post">

        <div class="form-group row">
          <label for="email" class="col-sm-2 col-form-label">Email</label>
          <div class="col-sm-7">
            <input type="text" class="form-control" name="firstName"
                   placeholder="Digite seu Email">
          </div>
        </div>

        <div class="form-group row">
          <label for="password" class="col-sm-2 col-form-label">Senha</label>
          <div class="col-sm-7">
            <input type="text" class="form-control" name="lastName"
                   placeholder="Digite sua senha">
          </div>
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
      </form>
    </div>
  </div>
</div>
</body>
</html>
