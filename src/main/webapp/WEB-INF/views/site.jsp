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

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        .app-container {
            height: 100vh;
            width: 100%;
        }
        .btn-warning, .btn-warning:hover, .btn-warning:active, .btn-warning:visited {
            color: #FFFFFF !important;
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
                        placeholder="Próxima tarefa..."
                />
            </div>
            <button type="submit" class="btn btn-primary mr-3" title="Salvar tarefa.">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-floppy" viewBox="0 0 16 16">
                    <path d="M11 2H9v3h2z"/>
                    <path d="M1.5 0h11.586a1.5 1.5 0 0 1 1.06.44l1.415 1.414A1.5 1.5 0 0 1 16 2.914V14.5a1.5 1.5 0 0 1-1.5 1.5h-13A1.5 1.5 0 0 1 0 14.5v-13A1.5 1.5 0 0 1 1.5 0M1 1.5v13a.5.5 0 0 0 .5.5H2v-4.5A1.5 1.5 0 0 1 3.5 9h9a1.5 1.5 0 0 1 1.5 1.5V15h.5a.5.5 0 0 0 .5-.5V2.914a.5.5 0 0 0-.146-.353l-1.415-1.415A.5.5 0 0 0 13.086 1H13v4.5A1.5 1.5 0 0 1 11.5 7h-7A1.5 1.5 0 0 1 3 5.5V1H1.5a.5.5 0 0 0-.5.5m3 4a.5.5 0 0 0 .5.5h7a.5.5 0 0 0 .5-.5V1H4zM3 15h10v-4.5a.5.5 0 0 0-.5-.5h-9a.5.5 0 0 0-.5.5z"/>
                </svg>
            </button>
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
            <tr class="table-light">
                <td align="center"><%= ++taskNum %>
                </td>
                <td><%=task.isFinished() ? "<del>" : "" %> <%= task.getDescription() %> <%=task.isFinished() ? "</del>" : "" %>
                </td>
                <td><%= task.isFinished() ? "Concluida" : "Em espera"%>
                </td>
                <td>
                    <form action="<%= request.getContextPath() %>/updateTask" method="post" style="display:inline;">
                        <input type="hidden" name="taskId" value="<%= task.getId() %>"/>

                        <% if (task.isFinished()) { %>
                        <button type="submit" class="btn btn-warning" title="Restaurar tarefa como pendente.">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-clockwise" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M8 3a5 5 0 1 0 4.546 2.914.5.5 0 0 1 .908-.417A6 6 0 1 1 8 2z"/>
                                <path d="M8 4.466V.534a.25.25 0 0 1 .41-.192l2.36 1.966c.12.1.12.284 0 .384L8.41 4.658A.25.25 0 0 1 8 4.466"/>
                            </svg>
                        </button>
                        <% } else { %>
                        <button type="submit" class="btn btn-success" title="Concluir tarefa.">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
                                <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
                                <path d="m10.97 4.97-.02.022-3.473 4.425-2.093-2.094a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05"/>
                            </svg>
                        </button>
                        <% } %>
                    </form>
                    <form method="post" action="/deleteTask" style="display:inline;">
                        <input type="hidden" name="taskId" value="<%= task.getId() %>"/>
                        <button type="submit" class="btn btn-danger" title="Deletar tarefa.">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5m3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0z"/>
                                <path d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4zM2.5 3h11V2h-11z"/>
                            </svg>
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
