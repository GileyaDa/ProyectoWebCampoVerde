<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    List<Map<String, Object>> eventos = new ArrayList<>();
    List<Map<String, Object>> noticias = new ArrayList<>();

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcampoverde", "root", "");

    String sqlEvento = "SELECT * FROM evento ORDER BY fechaCreacion DESC";
    PreparedStatement stmtEvento = conn.prepareStatement(sqlEvento);
    ResultSet rsEvento = stmtEvento.executeQuery();

    while (rsEvento.next()) {
        Map<String, Object> evento = new HashMap<>();
        evento.put("nombreEvento", rsEvento.getString("nombreEvento"));
        evento.put("descripcionEvento", rsEvento.getString("descripcionEvento"));
        evento.put("enlaceInvitacion", rsEvento.getString("enlaceInvitacion"));
        evento.put("fechaCreacion", rsEvento.getString("fechaCreacion"));
        evento.put("imagen", rsEvento.getString("imagen"));
        evento.put("idEmpleado", rsEvento.getInt("idEmpleado"));
        eventos.add(evento);
    }

    String sqlNoticia = "SELECT n.*, e.nombreEmpleado FROM noticia n JOIN empleado e ON n.idEmpleado = e.idEmpleado ORDER BY n.fechaNoticia DESC";
    PreparedStatement stmtNoticia = conn.prepareStatement(sqlNoticia);
    ResultSet rsNoticia = stmtNoticia.executeQuery();

    while (rsNoticia.next()) {
        Map<String, Object> noticia = new HashMap<>();
        noticia.put("idNoticia", rsNoticia.getInt("idNoticia"));
        noticia.put("tituloNoticia", rsNoticia.getString("tituloNoticia"));
        noticia.put("descripcionNoticia", rsNoticia.getString("descripcionNoticia"));
        noticia.put("contenido", rsNoticia.getString("contenido"));
        noticia.put("fechaNoticia", rsNoticia.getString("fechaNoticia"));
        noticia.put("imagen", rsNoticia.getString("imagen"));
        noticia.put("nombreEmpleado", rsNoticia.getString("nombreEmpleado"));
        noticias.add(noticia);
    }

    conn.close();
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Noticias y Eventos</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/employeeStyle.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/employeeBody2.css">
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
        <main class="main-container container-fluid mt-5">
            <video autoplay muted loop class="video-background">
                <source src="<%= request.getContextPath() %>/images/video/campoVerde.mp4" type="video/mp4">
            </video>
            <div class="overlay-text">
                <div class="row mb-4">
                    <div class="col text-center">
                        <h2 style="font-size: 70px;">Noticias y Eventos</h2>
                        <p style="font-size: 16px;">Consulta las últimas actualizaciones en la empresa</p>
                    </div>
                </div>
            </div>

            <div class="col-12 p-0">
                <div id="carouselNoticias" class="carousel slide mb-4 w-100">
                    <div class="carousel-inner">
                        <% for (int i = 0; i < noticias.size(); i++) { %>
                        <div class="carousel-item <%= i == 0 ? "active" : "" %>">
                            <img src="<%= request.getContextPath() %>/images/noticias/<%= noticias.get(i).get("imagen") %>" class="d-block w-100" alt="<%= noticias.get(i).get("tituloNoticia") %>">
                            <div class="carousel-caption d-none d-md-block">
                                <h5 style="font-size: 24px;"><%= noticias.get(i).get("tituloNoticia") %></h5>
                                <p style="font-size: 16px;"><%= noticias.get(i).get("descripcionNoticia") %></p>
                            </div>
                        </div>
                        <% } %>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselNoticias" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselNoticias" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
            <div class="row mb-4 noticias-section">
                <h2 class="titulo3">Noticias</h2>
                <% for (Map<String, Object> noticia : noticias) { %>
                <div class="col-md-4 mb-4">
                    <div class="card">
                        <img src="<%= request.getContextPath() %>/images/noticias/<%= noticia.get("imagen") %>" class="card-img-top" alt="<%= noticia.get("tituloNoticia") %>">
                        <div class="card-body">
                            <h5 class="card-title" style="font-size: 20px;"><%= noticia.get("tituloNoticia") %></h5>
                            <p class="card-text" style="font-size: 14px;">
                                <%= noticia.get("descripcionNoticia") %>
                                <a href="#" data-bs-toggle="modal" data-bs-target="#noticiaModal" 
                                   data-titulo="<%= noticia.get("tituloNoticia") %>" 
                                   data-contenido="<%= noticia.get("contenido") %>" 
                                   data-fecha="<%= noticia.get("fechaNoticia") %>" 
                                   data-imagen="<%= noticia.get("imagen") %>" 
                                   data-empleado="<%= noticia.get("nombreEmpleado") %>">
                                    Descubre más...
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
            <section class="portafolio">
                <div class="contenedor">
                    <br>
                    <h2 class="titulo3">Eventos</h2>
                    <div class="galeria-port">
                        <% for (Map<String, Object> evento : eventos) { %>
                        <div class="imagen-port">
                            <img src="<%= request.getContextPath() %>/images/eventos/<%= evento.get("imagen") %>" class="imagen-2">
                            <div class="hover-galeria">
                                <h3><%= evento.get("nombreEvento") %></h3>
                                <p><%= evento.get("descripcionEvento") %></p>
                                <a href="<%= evento.get("enlaceInvitacion") %>" class="boton">Inscribirse</a>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </section>

            <section class="contenedor sobre-nosotros">
                <div class="contenedor-sobre-nosotros">
                    <img src="<%= request.getContextPath() %>/images/noticias/boletinMes.png" height="230" width="300"  class="imagen-1">
                    <div class="contenido-textos">
                        <h3><span>✓</span>Boletín mensual</h3>
                        <p>Podrás visualizar el boletín de este mes</p>
                        <a href="<%= request.getContextPath() %>/images/noticias/boletin.pdf" class="boton">Ver Boletín</a>
                    </div>
                </div>
                <div class="contenedor-sobre-nosotros">
                    <div class="contenido-textos">
                        <h3><span>✓</span>Políticas de la empresa</h3>
                        <p>Conoce de nuestras políticas organizacionales</p>
                        <a href="<%= request.getContextPath() %>/images/noticias/politicas.pdf" class="boton">Ver Políticas</a>
                    </div>
                    <img src="<%= request.getContextPath() %>/images/noticias/politicas.png" height=200  class="imagen-1">
                </div>
            </section>
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
        <!-- Modal para detalles de noticia -->
        <div class="modal fade" id="noticiaModal" tabindex="-1" aria-labelledby="noticiaModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="noticiaModalLabel">Detalle de Noticia</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-4">
                                <img id="noticiaImagen" src="" class="img-fluid" alt="Imagen de la noticia">
                            </div>
                            <div class="col-md-8">
                                <h5 id="noticiaTitulo" class="mb-3"></h5>
                                <p id="noticiaContenido"></p>
                                <small id="noticiaFecha" class="text-muted"></small><br>
                                <small id="noticiaEmpleado" class="text-muted"></small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                var noticiaModal = document.getElementById('noticiaModal');
                noticiaModal.addEventListener('show.bs.modal', function (event) {
                    var button = event.relatedTarget; // Botón que activó el modal
                    var titulo = button.getAttribute('data-titulo');
                    var contenido = button.getAttribute('data-contenido');
                    var fecha = button.getAttribute('data-fecha');
                    var imagen = button.getAttribute('data-imagen');
                    var empleado = button.getAttribute('data-empleado');

                    // Actualizar el contenido del modal con los datos de la noticia
                    var modalTitle = noticiaModal.querySelector('.modal-title');
                    var modalBodyImage = noticiaModal.querySelector('#noticiaImagen');
                    var modalBodyTitle = noticiaModal.querySelector('#noticiaTitulo');
                    var modalBodyContent = noticiaModal.querySelector('#noticiaContenido');
                    var modalBodyFecha = noticiaModal.querySelector('#noticiaFecha');
                    var modalBodyEmpleado = noticiaModal.querySelector('#noticiaEmpleado');

                    modalTitle.textContent = 'Detalle de Noticia';
                    modalBodyImage.src = '<%= request.getContextPath() %>/images/noticias/' + imagen;
                    modalBodyTitle.textContent = titulo;
                    modalBodyContent.textContent = contenido;
                    modalBodyFecha.textContent = 'Fecha: ' + fecha;
                    modalBodyEmpleado.textContent = 'Publicado por: ' + empleado;
                });
            });
        </script>
    </body>
</html>
