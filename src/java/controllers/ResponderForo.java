package controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ResponderForo")
public class ResponderForo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String comentario = request.getParameter("comentario");
        int idForo = Integer.parseInt(request.getParameter("idForo"));
        int idEmpleado = 1; // Obtener el idEmpleado del usuario logueado

        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = ConexionDB.getConnection();

            String sql = "INSERT INTO respuestaForo (idForo, comentario, fechaRespuesta, idEmpleado) VALUES (?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idForo);
            ps.setString(2, comentario);
            ps.setDate(3, new java.sql.Date(new Date().getTime()));
            ps.setInt(4, idEmpleado);

            ps.executeUpdate();

            response.sendRedirect("employeeForum.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConexionDB.closeConnection(conn, ps);
        }
    }
}
