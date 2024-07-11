<%@ page import="java.sql.*" %>
<%@ page import="controllers.ConexionDB" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de Noticias</title>
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
            <div class="agregarNuevo">
                <h2>Agregar Noticia</h2>
                <form action="<%= request.getContextPath() %>/GestionarNoticia" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="action" value="agregar">
                    <div>
                        <label for="titulo">Título:</label>
                        <input type="text" id="titulo" name="titulo" required>
                    </div>
                    <div>
                        <label for="contenido">Contenido:</label>
                        <textarea id="contenido" name="contenido" rows="4" required></textarea>
                    </div>
                    <div>
                        <label for="fecha">Fecha:</label>
                        <input type="date" id="fecha" name="fecha" required>
                    </div>
                    <div>
                        <label for="imagen">Imagen:</label>
                        <input type="file" id="imagen" name="imagen" required>
                    </div>
                    <button type="submit">Agregar</button>
                </form>
            </div>
            <div class="lista">
                <h2>Lista de Noticias</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Título</th>
                            <th>Contenido</th>
                            <th>Fecha</th>
                            <th>Imagen</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            Connection conn = null;
                            PreparedStatement stmt = null;
                            ResultSet rs = null;
                            try {
                                conn = ConexionDB.getConnection();
                                String sql = "SELECT idNoticia, tituloNoticia, contenido, fechaNoticia, imagen FROM noticia";
                                stmt = conn.prepareStatement(sql);
                                rs = stmt.executeQuery();
                                while (rs.next()) {
                                    int idNoticia = rs.getInt("idNoticia");
                                    String titulo = rs.getString("tituloNoticia");
                                    String contenido = rs.getString("contenido");
                                    Date fecha = rs.getDate("fechaNoticia");
                                    String imagen = rs.getString("imagen");
                        %>
                        <tr>
                            <td><%= titulo %></td>
                            <td><%= contenido %></td>
                            <td><%= fecha %></td>
                            <td><img src="<%= request.getContextPath() %>/images/noticias/<%= imagen %>" alt="<%= titulo %>" style="width:100px;"></td>
                            <td>
                                <a href="ModificarNoticia.jsp?id=<%= idNoticia %>" class="btn btn-small"><i class="fa-solid fa-pen-to-square"></i></a>
                                <a href="EliminarNoticia.jsp?id=<%= idNoticia %>" class="btn btn-small btn-danger"><i class="fa-solid fa-trash"></i></a>
                            </td>
                        </tr>
                        <%
                                }
                            } catch (SQLException | ClassNotFoundException e) {
                                e.printStackTrace();
                            } finally {
                                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    </body>
</html>
