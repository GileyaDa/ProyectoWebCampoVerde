<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*, java.util.*" %>
<% String error = (String) request.getAttribute("error"); %>
<% 
    Integer idEmpleado = (Integer) request.getSession().getAttribute("idEmpleado");
    String nombreEmpleado = "";
    String telefonoEmpleado = "";
    String correoEmpleado = "";
    String dniEmpleado = "";
    String cargo = "";
    if (idEmpleado != null) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcampoverde", "root", "");
            String sql = "SELECT nombreEmpleado, telefonoEmpleado, correoEmpleado, dniEmpleado, cargo FROM empleado WHERE idEmpleado = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idEmpleado);
            rs = stmt.executeQuery();

            if (rs.next()) {
                nombreEmpleado = rs.getString("nombreEmpleado");
                telefonoEmpleado = rs.getString("telefonoEmpleado");
                correoEmpleado = rs.getString("correoEmpleado");
                dniEmpleado = rs.getString("dniEmpleado");
                cargo = rs.getString("cargo");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
            if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
            if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Configuración</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/adminStyle.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/adminBody.css">
        <link rel="shortcut icon" href="<%= request.getContextPath() %>/images/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/8148534299.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
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
            <div class="container main-container">
                <div >
                    <div class="col-md-8">
                        <div class="accordion" id="configuracionAccordion">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="datosEmpleadoHeader">
                                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#datosEmpleadoCollapse" aria-expanded="true" aria-controls="datosEmpleadoCollapse">
                                        Datos Personales
                                    </button>
                                </h2>
                                <div id="datosEmpleadoCollapse" class="accordion-collapse collapse show" aria-labelledby="datosEmpleadoHeader" data-bs-parent="#configuracionAccordion">
                                    <div class="accordion-body">
                                        <form action="MostrarDatosEmpleado">
                                            <div class="mb-3">
                                                <label for="nombreEmpleado" class="form-label">Nombre</label>
                                                <input type="text" class="form-control" id="nombreEmpleado" name="nombreEmpleado" value="<%= nombreEmpleado %>" disabled>
                                            </div>
                                            <div class="mb-3">
                                                <label for="telefonoEmpleado" class="form-label">Teléfono</label>
                                                <input type="text" class="form-control" id="telefonoEmpleado" name="telefonoEmpleado" value="<%= telefonoEmpleado %>" disabled>
                                            </div>
                                            <div class="mb-3">
                                                <label for="correoEmpleado" class="form-label">Correo Electrónico</label>
                                                <input type="email" class="form-control" id="correoEmpleado" name="correoEmpleado" value="<%= correoEmpleado %>" disabled>
                                            </div>
                                            <div class="mb-3">
                                                <label for="dniEmpleado" class="form-label">DNI</label>
                                                <input type="text" class="form-control" id="dniEmpleado" name="dniEmpleado" value="<%= dniEmpleado %>" disabled>
                                            </div>
                                            <div class="mb-3">
                                                <label for="cargo" class="form-label">Cargo</label>
                                                <input type="text" class="form-control" id="cargo" name="cargo" value="<%= cargo %>" disabled>
                                            </div>
                                            <p>¿Existe un error en sus datos? Puede modificarlo en  <a href="gestionEmpleados.jsp">Gestión de Empleados</a>.</p>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="cambiarContrasenaHeader">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#cambiarContrasenaCollapse" aria-expanded="false" aria-controls="cambiarContrasenaCollapse">
                                        Configuración de la Cuenta
                                    </button>
                                </h2>
                                <div id="cambiarContrasenaCollapse" class="accordion-collapse collapse" aria-labelledby="cambiarContrasenaHeader" data-bs-parent="#configuracionAccordion">
                                    <div class="accordion-body">
                                        <div id="confirmarCambioContrasena">
                                            <p>¿Desea cambiar su contraseña?</p>
                                            <button class="btn btn-primary" id="btnConfirmarCambio">Aceptar</button>
                                        </div>
                                        <form id="cambiarContrasenaForm" action="<%= request.getContextPath() %>/MostrarDatosEmpleado" method="post" style="display: none;">
                                            <div class="mb-3">
                                                <label for="nuevaPassword" class="form-label">Nueva Contraseña</label>
                                                <input type="password" class="form-control" id="nuevaPassword" name="nuevaPassword" required>
                                            </div>
                                            <div class="mb-3">
                                                <label for="confirmarPassword" class="form-label">Confirmar Nueva Contraseña</label>
                                                <input type="password" class="form-control" id="confirmarPassword" name="confirmarPassword" required>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Guardar Cambios</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="cerrarSesionHeader">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#cerrarSesionCollapse" aria-expanded="false" aria-controls="cerrarSesionCollapse">
                                        Cerrar Sesión
                                    </button>
                                </h2>
                                <div id="cerrarSesionCollapse" class="accordion-collapse collapse" aria-labelledby="cerrarSesionHeader" data-bs-parent="#configuracionAccordion">
                                    <div class="accordion-body">
                                        <form action="<%= request.getContextPath() %>/ProcesarLogout" method="post">
                                            <p>¿Estás seguro de que deseas cerrar sesión?</p>
                                            <button type="submit" class="btn btn-danger">Cerrar Sesión</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <script>
            document.getElementById('btnConfirmarCambio').addEventListener('click', function () {
                document.getElementById('confirmarCambioContrasena').style.display = 'none';
                document.getElementById('cambiarContrasenaForm').style.display = 'block';
            });
        </script>
    </body>
</html>