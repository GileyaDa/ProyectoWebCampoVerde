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
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Configuración</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/employeeStyle.css">
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/employeeBody3.css">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <div class="container">
                <div class="logo">
                    <a href="employeeDashboard.jsp">
                        <img src="${pageContext.request.contextPath}/images/logo.png" alt="Logo">
                    </a>
                </div>
                <nav>
                    <ul>
                        <li><a href="employeeInformation.jsp">Información</a></li>
                        <li><a href="employeeNews.jsp">Noticias y Eventos</a></li>
                        <li><a href="employeeProducts.jsp">Productos</a></li>
                        <li><a href="employeeReports.jsp">Reportes</a></li>
                        <li><a href="employeeForum.jsp">Foro de discusión</a></li>
                    </ul>
                </nav>
                <div class="config">
                    <a href="employeeConfig.jsp">
                        <img src="${pageContext.request.contextPath}/images/configuracion.png" alt="config">
                    </a>
                </div>
            </div>
        </header>
        <% if (error != null && !error.isEmpty()) { %>
        <div class="alert alert-danger" role="alert">
            <%= error %>
        </div>
        <% } %>
        <% String mensajeExito = (String) request.getAttribute("mensajeExito"); %>
        <% if (mensajeExito != null && !mensajeExito.isEmpty()) { %>
        <div class="alert alert-success" role="alert">
            <%= mensajeExito %>
        </div>
        <% } %>
        <main>
            <div class="container-fluid main-heading">
                <h1>Configuración</h1>
            </div>
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
                                            <p>¿Existe un error en sus datos? Contáctese con el administrador <a href="mailto:dayanalevanogiraldo@gmail.com">aquí</a>.</p>
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
        <footer>
            <section id="contacto">
                <div class="contenedor-footer">
                    <div class="content-foo">
                        <h4>Teléfono</h4>
                        <p>+51 923579117</p>
                    </div>
                    <div class="content-foo">
                        <h4>Email</h4>
                        <p>Grupocampoverde@hotmail.com</p>
                    </div>
                    <div class="content-foo">
                        <h4>Redes sociales</h4>
                        <div class="lang-social">
                            <a href="https://www.facebook.com" class="social-icon">F</a>
                        </div>
                    </div>
                </div>
            </section>
            <section id="titulo-final">
                <h2 class="titulo-final">Grupo Campo Verde &copy;</h2>
            </section>
        </footer>
        <script>
            document.getElementById('btnConfirmarCambio').addEventListener('click', function () {
                document.getElementById('confirmarCambioContrasena').style.display = 'none';
                document.getElementById('cambiarContrasenaForm').style.display = 'block';
            });
        </script>
    </body>
</html>
