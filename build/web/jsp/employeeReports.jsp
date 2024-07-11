<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Reportes</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/employeeStyle.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/employeeBody3.css">
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
            <section class="reportes-banner text-center py-5">
                <div class="container">
                    <h1 class="display-3 text-light">Reportes</h1>
                </div>
            </section>
            <section class="datos-estadisticos py-5">
                <div class="container">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="card text-center">
                                <div class="card-body">
                                    <h3 class="card-title">Total de Proveedores</h3>
                                    <p class="card-text">5</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card text-center">
                                <div class="card-body">
                                    <h3 class="card-title">Total de Clientes</h3>
                                    <p class="card-text">10</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="card text-center">
                                <div class="card-body">
                                    <h3 class="card-title">Total de Empleados</h3>
                                    <p class="card-text">2</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <section class="ventas-section py-5">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-6">
                            <h2>Nuestras Ventas</h2>
                            <!-- Aquí puedes insertar tu gráfico de ventas -->
                            <div id="graficoVentas" style="height: 300px;"></div>
                        </div>
                        <div class="col-md-6 text-md-end mt-4 mt-md-0">
                            <img src="<%= request.getContextPath() %>/images/reports/flechaDerecha.png" alt="Flecha derecha">
                        </div>
                    </div>
                </div>
            </section>

            <section class="pedidos-section py-5">
                <div class="container">
                    <div class="row align-items-center">
                        <div class="col-md-6 text-md-start mt-4 mt-md-0">
                            <img src="<%= request.getContextPath() %>/images/reports/flechaIzquierda.png" alt="Flecha izquierda">
                        </div>
                        <div class="col-md-6">
                            <h2>Nuestros Pedidos</h2>
                            <!-- Aquí puedes insertar tu gráfico de pedidos -->
                            <div id="graficoPedidos" style="height: 300px;"></div>
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