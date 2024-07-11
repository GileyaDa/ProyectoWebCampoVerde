<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inicio</title>
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
            <div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="<%= request.getContextPath() %>/images/carrusel/carrusel1.png" class="d-block w-100" alt="Inicio">
                    </div>
                    <div class="carousel-item">
                        <img src="<%= request.getContextPath() %>/images/carrusel/carrusel2.png" class="d-block w-100" alt="Agrícola">
                    </div>
                    <div class="carousel-item">
                        <img src="<%= request.getContextPath() %>/images/carrusel/carrusel3.png" class="d-block w-100" alt="Ganadero">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
            <div class="containerBienvenida mt-5 mb-5">
                <div class="row rowB">
                    <div class="col-md-6">
                        <h1 class="text-with-color" id="textoTransformar">¡Bienvenido a Campo Verde!</h1>
                    </div>
                    <div class="col-md-6 d-flex align-items-center">
                        <div>
                            <p>Únete a nosotros en la producción y distribución líder de productos agrícolas 
                                y ganaderos en Perú. Explora, colabora y crece con nosotros para promover 
                                la excelencia y sostenibilidad en cada paso.
                            </p>
                            <div class="botonB text-center">
                                <a href="employeeInformation.jsp" class="btnB">Sobre nosotros</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <section id="videoFuncionalidad" class="py-5 bg-light">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="embed-responsive embed-responsive-16by9">
                                <video id="videoPlayer" class="embed-responsive-item" controls>
                                    <source src="<%= request.getContextPath() %>/images/video/Prueba.mp4" type="video/mp4">
                                </video>
                            </div>
                        </div>
                        <div class="col-md-6 d-flex align-items-center">
                            <div>
                                <p class="lead">Este video es una guía esencial para familiarizarte con la aplicación y maximizar su uso en tu día a día laboral.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section id="imagenFondo">
                <div class="container">
                    <p></p>
                </div>
            </section>

            <section id="accesosDirectos" class="py-5">
                <h2 class="text-center mb-5">¿Qué podrás ver aquí?</h2>
                <div class="container">                    
                    <div class="row row-cols-1 row-cols-md-3 g-4">
                        <div class="col">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h5 class="card-title">Información</h5>
                                    <p class="card-text">Accede a toda la información relevante de la empresa</p>
                                    <a href="employeeInformation.jsp" class="btn btn-success">Ir a Información</a>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h5 class="card-title">Noticias y Eventos</h5>
                                    <p class="card-text">Mantente actualizado con las últimas noticias y eventos empresariales</p>
                                    <a href="employeeNews.jsp" class="btn btn-success">Ir a Noticias y Eventos</a>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h5 class="card-title">Productos</h5>
                                    <p class="card-text">Consulta nuestra variedad de productos agrícolas y ganaderos</p>
                                    <a href="employeeProducts.jsp" class="btn btn-success">Ir a Productos</a>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h5 class="card-title">Reportes</h5>
                                    <p class="card-text">Accede a los reportes y análisis clave para la toma de decisiones</p>
                                    <a href="employeeReports.jsp" class="btn btn-success">Ir a Reportes</a>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h5 class="card-title">Foro de Discusión</h5>
                                    <p class="card-text">Participa y comparte ideas con tus colegas</p>
                                    <a href="employeeForum.jsp" class="btn btn-success">Ir a Foros</a>
                                </div>
                            </div>
                        </div>
                        <div class="col">
                            <div class="card h-100">
                                <div class="card-body">
                                    <h5 class="card-title">Configuración</h5>
                                    <p class="card-text">Personaliza tu experiencia en la plataforma</p>
                                    <a href="employeeConfig.jsp" class="btn btn-success">Ir a Configuración</a>
                                </div>
                            </div>
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