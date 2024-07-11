<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    List<Map<String, Object>> animales = new ArrayList<>();
    List<Map<String, Object>> productos = new ArrayList<>();
    List<Map<String, Object>> insumos = new ArrayList<>();
    List<Map<String, Object>> tipoProductos = new ArrayList<>();
    Map<Integer, Map<String, Object>> proveedores = new HashMap<>();

    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbcampoverde", "root", "");

    String sqlAnimales = "SELECT * FROM animal";
    PreparedStatement stmtAnimales = conn.prepareStatement(sqlAnimales);
    ResultSet rsAnimales = stmtAnimales.executeQuery();
    while (rsAnimales.next()) {
        Map<String, Object> animal = new HashMap<>();
        animal.put("idAnimal", rsAnimales.getInt("idAnimal"));
        animal.put("razaAnimal", rsAnimales.getString("razaAnimal"));
        animal.put("cantidadAnimal", rsAnimales.getInt("cantidadAnimal"));
        animal.put("imagenAnimal", rsAnimales.getString("imagenAnimal"));
        animales.add(animal);
    }

    String sqlProductos = "SELECT * FROM producto";
    PreparedStatement stmtProductos = conn.prepareStatement(sqlProductos);
    ResultSet rsProductos = stmtProductos.executeQuery();
    while (rsProductos.next()) {
        Map<String, Object> producto = new HashMap<>();
        producto.put("idProducto", rsProductos.getInt("idProducto"));
        producto.put("nombreProducto", rsProductos.getString("nombreProducto"));
        producto.put("descripcionProducto", rsProductos.getString("descripcionProducto"));
        producto.put("stockProducto", rsProductos.getInt("stockProducto"));
        producto.put("precioProducto", rsProductos.getDouble("precioProducto"));
        producto.put("idCategoria", rsProductos.getInt("idCategoria"));
        productos.add(producto);
    }

    String sqlInsumos = "SELECT * FROM insumo";
    PreparedStatement stmtInsumos = conn.prepareStatement(sqlInsumos);
    ResultSet rsInsumos = stmtInsumos.executeQuery();
    while (rsInsumos.next()) {
        Map<String, Object> insumo = new HashMap<>();
        insumo.put("idInsumo", rsInsumos.getInt("idInsumo"));
        insumo.put("nombreInsumo", rsInsumos.getString("nombreInsumo"));
        insumo.put("descripcionInsumo", rsInsumos.getString("descripcionInsumo"));
        insumo.put("unidadMedida", rsInsumos.getString("unidadMedida"));
        insumo.put("precioInsumo", rsInsumos.getDouble("precioInsumo"));
        insumo.put("imagenInsumo", rsInsumos.getString("imagenInsumo"));
        insumo.put("idProveedor", rsInsumos.getInt("idProveedor"));
        insumos.add(insumo);
    }

    String sqlProveedores = "SELECT * FROM proveedor";
    PreparedStatement stmtProveedores = conn.prepareStatement(sqlProveedores);
    ResultSet rsProveedores = stmtProveedores.executeQuery();
    while (rsProveedores.next()) {
        Map<String, Object> proveedor = new HashMap<>();
        proveedor.put("nombreProveedor", rsProveedores.getString("nombreProveedor"));
        proveedor.put("direccionProveedor", rsProveedores.getString("direccionProveedor"));
        proveedor.put("telefonoProveedor", rsProveedores.getString("telefonoProveedor"));
        proveedor.put("correoProveedor", rsProveedores.getString("correoProveedor"));
        proveedor.put("rucProveedor", rsProveedores.getString("rucProveedor"));
        proveedor.put("imagenProveedor", rsProveedores.getString("imagenProveedor"));
        proveedores.put(rsProveedores.getInt("idProveedor"), proveedor);
    }

    String sqlTipos = "SELECT * FROM tipoProducto";
    PreparedStatement stmtTipos = conn.prepareStatement(sqlTipos);
    ResultSet rsTipos = stmtTipos.executeQuery();
    while (rsTipos.next()) {
        Map<String, Object> tipo = new HashMap<>();
        tipo.put("idTipo", rsTipos.getInt("idTipo"));
        tipo.put("nombreTipo", rsTipos.getString("nombreTipo"));
        tipo.put("descripcionTipo", rsTipos.getString("descripcionTipo"));

        List<Map<String, Object>> categorias = new ArrayList<>();
        String sqlCategorias = "SELECT * FROM categoriaProducto WHERE idTipo = ?";
        PreparedStatement stmtCategorias = conn.prepareStatement(sqlCategorias);
        stmtCategorias.setInt(1, rsTipos.getInt("idTipo"));
        ResultSet rsCategorias = stmtCategorias.executeQuery();
        while (rsCategorias.next()) {
            Map<String, Object> categoria = new HashMap<>();
            categoria.put("idCategoria", rsCategorias.getInt("idCategoria"));
            categoria.put("nombreCategoria", rsCategorias.getString("nombreCategoria"));
            categoria.put("descripcionCategoria", rsCategorias.getString("descripcionCategoria"));
            categorias.add(categoria);
        }
        tipo.put("categorias", categorias);
        tipoProductos.add(tipo);
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Productos</title>
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/employeeBody2.css">
        <link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/employeeStyle.css">
        <link rel="shortcut icon" href="<%= request.getContextPath() %>/images/logo.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <style>
            .productos {
                background-color: #FDEBD0;
                padding: 20px;
                height: 750px;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .productos h2 {
                font-size: 2.5rem;
                text-align: center;
                font-family: 'Arial Black', sans-serif;
                color: #5D4037;
                text-shadow: 4px 4px 8px white;
                margin-bottom: 20px;
            }
            .productos .container {
                display: flex;
                justify-content: space-around;
                align-items: center;
                width: 100%;
            }
            .productos .list-group {
                width: 100%;
            }
            .tipo-card, .category-card, .product-card {
                cursor: pointer;
                background-color: #F5F5F5; /* Fondo gris claro */
                margin-bottom: 10px;
                border: none;
                border-radius: 5px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                transition: transform 0.2s, box-shadow 0.2s;
            }
            .tipo-card:hover, .category-card:hover, .product-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            }
            .category-container, .product-container {
                display: none;
            }
            .fixed-column {
                width: 30%;
                padding: 10px;
            }
        </style>
        <script>
            function showCategories(idTipo) {
                document.querySelectorAll('.category-container').forEach(function (container) {
                    container.style.display = 'none';
                });
                document.getElementById('categories-' + idTipo).style.display = 'block';
            }

            function showProducts(idCategoria) {
                document.querySelectorAll('.product-container').forEach(function (container) {
                    container.style.display = 'none';
                });
                document.getElementById('products-' + idCategoria).style.display = 'block';
            }
        </script>
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
            <div class="portada">
                <div class="overlay-text2">
                    <h2 style="font-size: 70px;"> Nuestros Productos</h2>
                    <p>Conoce todo lo que tenemos para ofrecer, y qué necesitamos para conseguirlo.</p>
                </div>
                <div class="image-content">
                    <img src="<%= request.getContextPath() %>/images/products/portada.png" alt="Vaca, Cerdo y Quinua">
                </div>
            </div>
            <div class="container-fluid p-4" style="background-color: lightgoldenrodyellow;">
                <section class="mb-4">
                    <div class="animals row justify-content-center">
                        <div class="overlay-text3">
                            <h2 class="text-center mb-4">Criamos a nuestros animales de la mejor manera</h2>
                        </div>
                        <%
                            for (Map<String, Object> animal : animales) {
                        %>
                        <div class="col-md-3 mb-4">
                            <div class="card">
                                <div class="circle-image">
                                    <img src="<%= request.getContextPath() %>/images/products/<%= animal.get("imagenAnimal") %>" class="card-img-top" alt="<%= animal.get("razaAnimal") %>">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><%= animal.get("razaAnimal") %></h5>
                                    <p class="card-text">Cantidad: <%= animal.get("cantidadAnimal") %></p>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </section>
                <section id="productos" class="productos">
                    <div class="container">
                        <h2>¿Qué ofrecemos?</h2>
                        <div class="fixed-column">
                            <ul class="list-group">
                                <% for (Map<String, Object> tipo : tipoProductos) { %>
                                <li class="list-group-item tipo-card" onclick="showCategories(<%= tipo.get("idTipo") %>)">
                                    <%= tipo.get("nombreTipo") %>
                                </li>
                                <% } %>
                            </ul>
                        </div>
                        <div class="fixed-column">
                            <% for (Map<String, Object> tipo : tipoProductos) { %>
                            <div class="category-container" id="categories-<%= tipo.get("idTipo") %>">
                                <ul class="list-group">
                                    <% List<Map<String, Object>> categorias = (List<Map<String, Object>>) tipo.get("categorias"); %>
                                    <% for (Map<String, Object> categoria : categorias) { %>
                                    <li class="list-group-item category-card" onclick="showProducts(<%= categoria.get("idCategoria") %>)">
                                        <%= categoria.get("nombreCategoria") %>
                                    </li>
                                    <% } %>
                                </ul>
                            </div>
                            <% } %>
                        </div>
                        <div class="fixed-column">
                            <% for (Map<String, Object> tipo : tipoProductos) { %>
                            <% List<Map<String, Object>> categorias = (List<Map<String, Object>>) tipo.get("categorias"); %>
                            <% for (Map<String, Object> categoria : categorias) { %>
                            <div class="product-container" id="products-<%= categoria.get("idCategoria") %>">
                                <ul class="list-group">
                                    <% for (Map<String, Object> producto : productos) { %>
                                    <% if ((int) producto.get("idCategoria") == (int) categoria.get("idCategoria")) { %>
                                    <li class="list-group-item">
                                        <strong><%= producto.get("nombreProducto") %></strong><br>
                                        <%= producto.get("descripcionProducto") %><br>
                                        Stock: <%= producto.get("stockProducto") %><br>
                                        Precio: S/ <%= producto.get("precioProducto") %>
                                    </li>
                                    <% } %>
                                    <% } %>
                                </ul>
                            </div>
                            <% } %>
                            <% } %>
                        </div>
                    </div>
                </section>
                <section>
                    <div class="overlay-text3">
                        <h2 class="text-center mb-4">Nuestros insumos</h2>
                    </div>
                    <div class="row justify-content-center">
                        <%
                            for (Map<String, Object> insumo : insumos) {
                                Map<String, Object> proveedor = proveedores.get(insumo.get("idProveedor"));
                        %>
                        <div class="col-md-3 mb-4">
                            <div class="card">
                                <div class="circle-image">
                                    <img src="<%= request.getContextPath() %>/images/products/<%= insumo.get("imagenInsumo") %>" class="card-img-top" alt="<%= insumo.get("nombreInsumo") %>">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title"><%= insumo.get("nombreInsumo") %></h5>
                                    <p class="card-text"><%= insumo.get("descripcionInsumo") %></p>
                                    <p class="card-text">Precio: S/ <%= insumo.get("precioInsumo") %> por <%= insumo.get("unidadMedida") %></p>
                                    <a href="#" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#proveedorModal<%= insumo.get("idInsumo") %>">Ver Proveedor</a>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="proveedorModal<%= insumo.get("idInsumo") %>" tabindex="-1" aria-labelledby="proveedorModalLabel<%= insumo.get("idInsumo") %>" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="proveedorModalLabel<%= insumo.get("idInsumo") %>">Proveedor: <%= proveedor.get("nombreProveedor") %></h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <p>Dirección: <%= proveedor.get("direccionProveedor") %></p>
                                        <p>Teléfono: <%= proveedor.get("telefonoProveedor") %></p>
                                        <p>Correo: <%= proveedor.get("correoProveedor") %></p>
                                        <p>RUC: <%= proveedor.get("rucProveedor") %></p>
                                        <img src="<%= request.getContextPath() %>/images/products/<%= proveedor.get("imagenProveedor") %>" alt="<%= proveedor.get("nombreProveedor") %>" class="img-fluid">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </section>
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
    // Cerrar conexiones
    rsAnimales.close();
    stmtAnimales.close();
    rsProductos.close();
    stmtProductos.close();
    rsInsumos.close();
    stmtInsumos.close();
    rsProveedores.close();
    stmtProveedores.close();
    conn.close();
%>
