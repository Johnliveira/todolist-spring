<%--
  Created by IntelliJ IDEA.
  User: joao
  Date: 11/6/24
  Time: 7:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register</title>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h1>Registre-se</h1>
    <div class="card">
        <div class="card-body">
            <form action="<%=request.getContextPath()%>/createUser" method="post">

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Email</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="email"
                               placeholder="Digite seu Email">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Nome de usuário</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="username"
                               placeholder="Digite seu nome de usuário">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Senha</label>
                    <div class="col-sm-7">
                        <input type="text" class="form-control" name="password"
                               placeholder="Digite sua senha">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Registrar</button>

            </form>
        </div>
    </div>
</div>
</body>
</html>
