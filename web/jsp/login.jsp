<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de sesión</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/stylep.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo.png">
</head>
<body>
    <div class="login-container">
        <div class="login-image">
            <img src="<%= request.getContextPath() %>/images/logo.png" alt="Logo">
        </div>
        <div class="login-form">
            <h2>Inicio de sesión</h2>
            <form action="<%= request.getContextPath() %>/ProcesarLogin" method="post">
                <div class="input-group">
                    <label for="correo">Correo electrónico</label>
                    <input type="text" id="correo" name="correo" required>
                </div>
                <div class="input-group">
                    <label for="password">Contraseña</label>
                    <input type="password" id="password" name="password" required>
                </div>
                <div class="options">
                    <label>
                        <input type="checkbox" name="remember-me"> Recuérdame
                    </label>
                    <a href="#">¿Olvidé mi contraseña?</a>
                </div>
                <button type="submit">Ingresar</button>
                <% if (request.getAttribute("error") != null) { %>
                    <div style="color: red;">
                        <p><%= request.getAttribute("error") %></p>
                    </div>
                    <% } %>
            </form>
        </div>
    </div>
</body>
</html>