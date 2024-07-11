<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú Principal</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/adminStyle.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/adminBody.css">
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
                <li><a href="adminDashboard.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoMenu.jpg" alt="Menú Principal">Menú Principal</a></li>
                <li><hr></li>
                <li><a href="gestionEmpleados.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoEmpleado.jpg" alt="Gestión de empleados">Gestión de empleados</a></li>
                <li><hr></li>
                <li><a href="gestionClientes.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoCliente.jpg" alt="Gestión de clientes">Gestión de clientes</a></li>
                <li><hr></li>
                <li><a href="gestionProveedores.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoProveedor.jpg" alt="Gestión de proveedores">Gestión de proveedores</a></li>
                <li><hr></li>
                <li><a href="gestionProductos.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoProducto.jpg" alt="Gestión de productos">Gestión de productos</a></li>
                <li><hr></li>
                <li><a href="gestionReportes.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoReporte.jpg" alt="Reportes">Reportes</a></li>
                <li><hr></li>
                <li><a href="gestionNoticias.jsp"><img src="<%= request.getContextPath() %>/images/icons/iconoPublicacion.jpg" alt="Publicación de noticias">Publicación de noticias y eventos</a></li>
            </ul>
        </nav>
    </div>
    <main>
        <h1>Bienvenido al Dashboard de Administración</h1>
        <p>Aquí puede gestionar todos los aspectos del sistema.</p>
        <div class="dashboard-widgets">
            <div class="widget">
                <h2>Resumen de empleados</h2>
                <p>Administre y vea el estado de los empleados de la empresa.</p>
                <a href="gestionEmpleados.jsp" class="btn">Ir a Gestión de Empleados</a>
            </div>
            <div class="widget">
                <h2>Resumen de clientes</h2>
                <p>Administre y vea la información de los clientes.</p>
                <a href="gestionClientes.jsp" class="btn">Ir a Gestión de Clientes</a>
            </div>
            <div class="widget">
                <h2>Resumen de proveedores</h2>
                <p>Administre y vea la información de los proveedores.</p>
                <a href="gestionProveedores.jsp" class="btn">Ir a Gestión de Proveedores</a>
            </div>
            <div class="widget">
                <h2>Resumen de productos</h2>
                <p>Administre y vea la información de los productos.</p>
                <a href="gestionProductos.jsp" class="btn">Ir a Gestión de Productos</a>
            </div>
            <div class="widget">
                <h2>Reportes</h2>
                <p>Genere y vea reportes detallados.</p>
                <a href="reportes.jsp" class="btn">Ir a Reportes</a>
            </div>
            <div class="widget">
                <h2>Noticias</h2>
                <p>Publique y vea las noticias y actualizaciones.</p>
                <a href="publicacionNoticias.jsp" class="btn">Ir a Publicación de Noticias</a>
            </div>
        </div>
    </main>
</body>
</html>
