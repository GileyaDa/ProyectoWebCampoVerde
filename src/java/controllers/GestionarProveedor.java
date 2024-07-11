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
import models.Proveedor;

@WebServlet("/GestionarProveedor")
public class GestionarProveedor extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String ruc = request.getParameter("ruc");

        try {
            Proveedor.insertarProveedor(nombre, direccion, telefono, correo, ruc);
            response.sendRedirect("jsp/gestionProveedores.jsp");
        } catch (SQLException | ClassNotFoundException | IllegalArgumentException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al agregar proveedor: " + e.getMessage());
            request.getRequestDispatcher("jsp/gestionProveedores.jsp").forward(request, response);
        }
    }
}
