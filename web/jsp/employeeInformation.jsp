<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Información</title>
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
        <main>
            <div class="titulo">
                <section class="textos">
                    <h1 class="titulo-principal">Grupo Campo Verde</h1>
                </section>
                <div style="height: 350px; overflow: hidden;" >
                    <svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 100%; width: 100%;">
                    <path d="M0.00,49.85 C238.71,218.79 294.01,-45.95 500.00,49.85 L500.00,149.60 L0.00,149.60 Z" style="stroke: none; fill: #fff;"></path>
                    </svg>
                </div>
            </div>
            <section class="contenedor sobre-nosotros">
                <div class="contenedor-sobre-nosotros">
                    <img src="<%= request.getContextPath() %>/images/information/nosotros.jpg" height="230" width="300"  class="imagen-1">
                    <div class="contenido-textos">
                        <h3><span>✓</span>Nosotros</h3>
                        <p>Bienvenido a Grupo Campo Verde, en donde nuestra pasión por la agricultura y la
                            ganadería se combina con innovación tecnológica, para ofrecer un servicio y 
                            productos de alta calidad</p>
                    </div>
                </div>
                <div class="contenedor-sobre-nosotros">
                    <div class="contenido-textos">
                        <h3><span>✓</span>Nuestra historia</h3>
                        <p>En Grupo Campo Verde, nuestra historia está arraigada en la pasión por la agricultura 
                            sostenible y la ganadería responsable. Desde nuestros inicios, nos hemos dedicado a 
                            combinar tradición con innovación, buscando siempre mejorar la calidad y sostenibilidad
                            de nuestros productos. Descubre cómo comenzamos nuestro viaje en el corazón de la 
                            producción agropecuaria, comprometidos con el bienestar animal y el cuidado del medio ambiente.</p>
                    </div>
                    <img src="<%= request.getContextPath() %>/images/information/historia.jpg" height=200  class="imagen-1">
                </div>
            </section>
            <section class="portafolio">
                <div class="contenedor">
                    <br>
                    <h2 class="titulo3">¿Qué ofrecemos?</h2>
                    <div class="galeria-port">
                        <div class="imagen-port">
                            <img src="<%= request.getContextPath() %>/images/information/agricola.jpg" class="imagen-2">
                            <div class="hover-galeria">
                                <p>Productos agrícolas</p>
                            </div>
                        </div>
                        <div class="imagen-port">
                            <img src="<%= request.getContextPath() %>/images/information/ganadero.jpg" class="imagen-2">
                            <div class="hover-galeria">
                                <p>Productos ganaderos</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="contenedor sobre-nosotros">
                <div class="contenedor-sobre-nosotros">
                    <img src="<%= request.getContextPath() %>/images/information/misionyvision.jpg" class="imagen-2">
                    <div class="contenido-textos">
                        <h3><span>1</span>Visión</h3>
                        <p>Ser una de las principales empresas exportadoras de frutas frescas en el Perú, Posicionada en el mercado europeo y asiático con tecnología de vanguardia, altos estándares de control de calidad, personal en constante capacitación y socios estratégicos en toda la cadena de abastecimiento nacional e internacional.</p>
                        <h3><span>2</span>Misión</h3>
                        <p>Somos una empresa que brinda productos frescos certificados a nivel nacional e internacional cumpliendo normas sanitarias y fitosanitarias en calidad e inocuidad alimentaria, manteniendo el crecimiento en ventas y utilidades, promoviendo el desarrollo de nuestros colaboradores, nuestra comunidad local y el medio ambiente.</p>
                    </div>
                </div>
            </section>
            <section class="clientescontenedor">
                <h6 class="titulo2">ㅤ</h6>
                <div class="cards">
                    <div class="card">
                        <img src="<%= request.getContextPath() %>/images/information/equipo.jpg" alt="">
                        <div class="contenido-texto-card">
                            <h4>Equipo</h4>
                            <p>El equipo detrás de Grupo Campo Verde es pieza fundamental en 
                                nuestra misión. Juntos, compartimos la misma visión.  
                                Cada uno de nosotros, incluyéndote, desempeñamos un papel clave, 
                                aportando nuestras habilidades y pasiones.</p>
                        </div>
                    </div>
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
    </body>
</html>