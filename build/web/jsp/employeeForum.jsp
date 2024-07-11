<%@ page import="java.sql.*, java.util.*, controllers.ConexionDB" %>
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        conn = ConexionDB.getConnection();

        // Obtener foros creados por administradores
        String sql = "SELECT f.idForo, f.tituloForo, f.comentario, f.fechaForo, e.nombreEmpleado " +
                     "FROM foro f JOIN empleado e ON f.idEmpleado = e.idEmpleado " +
                     "WHERE f.esAdmin = TRUE";
        ps = conn.prepareStatement(sql);
        rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Foro de discusión</title>
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/employeeStyle.css">
    <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/employeeBody.css">
    <link rel="shortcut icon" href="<%= request.getContextPath() %>/images/logo.png">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <header>
        <div class="container">
            <div class="logo">
                <a href="employeeDashboard.jsp">
                    <img src="<%= request.getContextPath() %>/images/logo.png" alt="Logo">
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
                    <img src="<%= request.getContextPath() %>/images/configuracion.png" alt="config">
                </a>
            </div>
        </div>
    </header>
    <main class="container mt-5">
        <h2 class="text-center mb-4">Foro de Discusión</h2>
        <div class="row">
            <div class="col-md-12">
                <section id="foro-contenido">
                    <h3>Temas de Discusión</h3>
                    <div id="hilos-discusion">
                        <% while (rs.next()) { %>
                            <div class="card mb-3">
                                <div class="card-body">
                                    <h5 class="card-title"><%= rs.getString("tituloForo") %></h5>
                                    <p class="card-text"><%= rs.getString("comentario") %></p>
                                    <p class="card-text"><small class="text-muted">Publicado por <%= rs.getString("nombreEmpleado") %> el <%= rs.getDate("fechaForo") %></small></p>
                                    <!-- Formulario para responder -->
                                    <form action="ResponderForo" method="post">
                                        <div class="mb-3">
                                            <label for="comentario" class="form-label">Respuesta</label>
                                            <textarea class="form-control" id="comentario" name="comentario" rows="3" required></textarea>
                                        </div>
                                        <input type="hidden" name="idForo" value="<%= rs.getInt("idForo") %>">
                                        <button type="submit" class="btn btn-primary">Responder</button>
                                    </form>
                                </div>
                            </div>
                        <% } %>
                    </div>
                </section>
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
</body>
</html>
<%
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        ConexionDB.closeConnection(conn, ps);
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
