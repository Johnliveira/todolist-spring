<%@ page import="com.joaolabs.todolist.dto.TaskDTO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Lista de Tarefas</title>
    <link
            rel="stylesheet"
            href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
            integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
            crossorigin="anonymous"
    />

    <style>
        .app-container {
            height: 100vh;
            width: 100%;
        }
    </style>
</head>
<body>
<div
        class="app-container d-flex align-items-center justify-content-center flex-column"
        ng-app="myApp"
        ng-controller="myController"
>
    <h3>Lista de Tarefas</h3>
    <form action="<%= request.getContextPath() %>/createTask" method="post">
        <div class="d-flex align-items-center mb-3">
            <div class="form-group mr-3 mb-0">
                <input
                        type="text"
                        class="form-control"
                        name="taskDescription"
                        placeholder="Próximo tarefa..."
                />
            </div>
            <button type="submit" class="btn btn-primary mr-3">Salvar</button>
        </div>
    </form>
    <div class="table-wrapper">
        <table class="table table-hover table-bordered">
            <thead>
            <tr>
                <th>Número</th>
                <th>Descrição</th>
                <th>Status</th>
                <th>Ações</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<TaskDTO> taskList = (List<TaskDTO>) request.getAttribute("tasks");
                int taskNum = 0;
                for (TaskDTO task : taskList) {

            %>
            <tr class="<%= task.isFinished() ? "table-light" : "table-light" %>">
                <td><%= ++taskNum %>
                </td>
                <td><%= task.getDescription() %>
                </td>
                <td><%= task.isFinished() ? "Concluida" : "Pendente"%>
                </td>
                <td>
                    <%--                    <form action="<%=request.getContextPath()%>/updateTask" method="post" style="display:inline;">--%>
                    <%--                        <input type="hidden" name="taskId" value="<%= task.getId() %>"/>--%>
                    <%--                        <button type="submit" class="btn btn-success">--%>
                    <%--                            Atualizar--%>
                    <%--                        </button>--%>
                    <%--                    </form>--%>
                    <form action="<%= request.getContextPath() %>/updateTask" method="post" style="display:inline;">
                        <input type="hidden" name="taskId" value="<%= task.getId() %>"/>
                        <button type="submit" class="btn <%= task.isFinished() ? "btn-warning" : "btn-success" %>">
                            <%= task.isFinished() ? "Reverter" : "Concluir" %>
                        </button>
                    </form>
                    <form method="post" action="/deleteTask" style="display:inline;">
                        <input type="hidden" name="taskId" value="<%= task.getId() %>"/>
                        <button type="submit" class="btn btn-danger">
                            Excluir
                        </button>
                    </form>
                </td>
            </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
