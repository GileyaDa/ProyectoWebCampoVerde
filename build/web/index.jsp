<!DOCTYPE html>
<html>
<head>
    <title>Bienvenida</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/stylep.css">
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/images/logo.png">
</head>
<body>
    <div class="login-container">
        <div class="login-image">
            <img src="<%= request.getContextPath() %>/images/logo.png" alt="Logo de Campo Verde">
        </div>
        <div class="login-form">
            <h2>¡Bienvenido!</h2>
            <p>Por favor, inicia sesión para acceder a nuestra plataforma.</p>
            <a href="<%= request.getContextPath() %>/jsp/login.jsp">Iniciar Sesión</a>
        </div>
    </div>
</body>
</html>
