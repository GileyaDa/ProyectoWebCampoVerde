package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet("/ProcesarLogin")
public class ProcesarLogin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("password");
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            String hashedPassword = hashContrasena(contrasena);
            conn = ConexionDB.getConnection();
            String sql = "SELECT idEmpleado, idRol FROM empleado WHERE correoEmpleado = ? AND contraseñaEmpleado = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, correo);
            stmt.setString(2, hashedPassword);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                int idEmpleado = rs.getInt("idEmpleado");
                int idRol = rs.getInt("idRol");
                HttpSession session = request.getSession();
                session.setAttribute("idEmpleado", idEmpleado);
                if (idRol == 1) {
                    response.sendRedirect("jsp/adminDashboard.jsp");
                } else if (idRol == 2) {
                    response.sendRedirect("jsp/employeeDashboard.jsp");
                } else {
                    request.setAttribute("error", "Rol no reconocido");
                    request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "Nombre de usuario o contraseña incorrectos");
                request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException | SQLException | NoSuchAlgorithmException e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al procesar inicio de sesión: " + e.getMessage());
            request.getRequestDispatcher("jsp/login.jsp").forward(request, response);
        } finally {
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
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
}
