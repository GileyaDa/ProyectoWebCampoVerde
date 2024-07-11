<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gesti�n de Reportes</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/adminStyle.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/gestionStyle.css">
        <link rel="shortcut icon" href="<%= request.getContextPath() %>/images/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/8148534299.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <div class="logo">
                <img src="<%= request.getContextPath() %>/images/logo.png" alt="Logo">
            </div>
            <div class="user-icon">
                <a href="adminConfig.jsp"><img src="<%= request.getContextPath() %>/images/configuracion.png" alt="configuracion"></a>
            </div>
        </header>
        <div class="sidebar">
            <nav class="sidebar-nav">
                <ul>
                    <li><a href="adminDashboard.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoMenu.jpg" alt="Men� Principal">Men� Principal</a></li>
                    <li><hr></li>
                    <li><a href="gestionEmpleados.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoEmpleado.jpg" alt="Gesti�n de empleados">Gesti�n de empleados</a></li>
                    <li><hr></li>
                    <li><a href="gestionClientes.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoCliente.jpg" alt="Gesti�n de clientes">Gesti�n de clientes</a></li>
                    <li><hr></li>
                    <li><a href="gestionProveedores.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoProveedor.jpg" alt="Gesti�n de proveedores">Gesti�n de proveedores</a></li>
                    <li><hr></li>
                    <li><a href="gestionProductos.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoProducto.jpg" alt="Gesti�n de productos">Gesti�n de productos</a></li>
                    <li><hr></li>
                    <li><a href="gestionReportes.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoReporte.jpg" alt="Reportes">Reportes</a></li>
                    <li><hr></li>
                    <li><a href="gestionNoticias.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoPublicacion.jpg" alt="Publicaci�n de noticias">Publicaci�n de noticias y eventos</a></li>
                </ul>
            </nav>
        </div>
        <main>

        </main>
    </body>
</html>