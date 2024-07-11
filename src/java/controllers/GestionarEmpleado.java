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
import models.Empleado;

@WebServlet("/GestionarEmpleado")
public class GestionarEmpleado extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String dni = request.getParameter("dni");
        String contrasena = request.getParameter("contrasena");
        String cargo = request.getParameter("cargo");
        String fechaContratacionStr = request.getParameter("fechaContratacion");
        String idRolStr = request.getParameter("idRol");

        try {
            Date fechaContratacion = Date.valueOf(fechaContratacionStr);
            int idRol = Integer.parseInt(idRolStr);
            Empleado.insertarEmpleado(nombre, telefono, correo, dni, contrasena, cargo, fechaContratacion, idRol);
            response.sendRedirect("jsp/gestionEmpleados.jsp");
        } catch (SQLException | NoSuchAlgorithmException | ClassNotFoundException | IllegalArgumentException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al agregar empleado: " + e.getMessage());
            request.getRequestDispatcher("jsp/gestionEmpleados.jsp").forward(request, response);
        }
    }
}
