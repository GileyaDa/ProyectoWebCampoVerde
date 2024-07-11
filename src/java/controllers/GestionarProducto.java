package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Producto;

@WebServlet("/GestionarProducto")
public class GestionarProducto extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String stockStr = request.getParameter("stock");
        String precioStr = request.getParameter("precio");
        String categoria = request.getParameter("categoria");
        String idCategoriaStr = request.getParameter("idCategoria");
        try {
            int idCategoria = Integer.parseInt(idCategoriaStr);
            double precio= Double.parseDouble(precioStr);
            int stock = Integer.parseInt(stockStr);
            Producto.insertarProducto(nombre, descripcion, stock, precio,idCategoria);
            response.sendRedirect("jsp/gestionProductos.jsp");
        } catch (SQLException | ClassNotFoundException | IllegalArgumentException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al agregar producto: " + e.getMessage());
            request.getRequestDispatcher("jsp/gestionProductos.jsp").forward(request, response);
        }
    }
}
