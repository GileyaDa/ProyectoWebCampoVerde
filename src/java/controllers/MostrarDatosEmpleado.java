package controllers;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import controllers.ConexionDB;

@WebServlet("/MostrarDatosEmpleado")
public class MostrarDatosEmpleado extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nuevaPassword = request.getParameter("nuevaPassword");
        String confirmarPassword = request.getParameter("confirmarPassword");

        if (nuevaPassword.equals(confirmarPassword)) {
            try {
                String hashedPassword = hashContrasena(nuevaPassword);
                Integer idEmpleado = (Integer) request.getSession().getAttribute("idEmpleado");

                if (idEmpleado != null) {
                    actualizarContraseña(idEmpleado, hashedPassword);
                    request.setAttribute("mensajeExito", "¡Contraseña actualizada correctamente!");
                    request.getRequestDispatcher("jsp/employeeConfig.jsp").forward(request, response);
                } else {
                    response.sendRedirect("jsp/employeeConfig.jsp?error=id_empleado_no_encontrado");
                }
            } catch (NoSuchAlgorithmException | SQLException e) {
                e.printStackTrace();
                response.sendRedirect("jsp/employeeConfig.jsp?error=error_general");
            }
        } else {
            request.setAttribute("error", "Las contraseñas no coinciden");
            request.getRequestDispatcher("jsp/employeeConfig.jsp").forward(request, response);
        }
    }

    private static String hashContrasena(String contrasena) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hash = md.digest(contrasena.getBytes());
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }

    private void actualizarContraseña(Integer idEmpleado, String hashedPassword) throws SQLException {
        Connection conn = null;
        PreparedStatement pstmt = null;
        try {
            conn = ConexionDB.getConnection();
            String sql = "UPDATE empleado SET contraseñaEmpleado = ? WHERE idEmpleado = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, hashedPassword);
            pstmt.setInt(2, idEmpleado);
            pstmt.executeUpdate();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new SQLException("Error al actualizar la contraseña del empleado.");
        } finally {
            ConexionDB.closeConnection(conn, pstmt);
        }
    }
}
