package controllers;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import controllers.ConexionDB;

@WebServlet("/GestionarNoticia")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, 
                 maxFileSize = 1024 * 1024 * 10,      
                 maxRequestSize = 1024 * 1024 * 50)   
public class GestionarNoticia extends HttpServlet {
    private static final String SAVE_DIR = "images\\noticias";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("agregar".equals(action)) {
            String titulo = request.getParameter("titulo");
            String contenido = request.getParameter("contenido");
            String fecha = request.getParameter("fecha");
            Part part = request.getPart("imagen");
            String fileName = extractFileName(part);
            String savePath = "C:\\Users\\dayal\\Documents\\NetBeansProjects\\AppProyectoCampoVerde\\web\\" + SAVE_DIR + File.separator + fileName;
            
            File fileSaveDir = new File(savePath);
            part.write(savePath);

            Connection conn = null;
            PreparedStatement stmt = null;
            try {
                conn = ConexionDB.getConnection();
                String sql = "INSERT INTO noticia (tituloNoticia, contenido, fechaNoticia, idEmpleado, imagen) VALUES (?, ?, ?, ?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, titulo);
                stmt.setString(2, contenido);
                stmt.setDate(3, java.sql.Date.valueOf(fecha));
                stmt.setInt(4, 1);
                stmt.setString(5, fileName);
                stmt.executeUpdate();
            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                if (stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
            response.sendRedirect("gestionNoticias.jsp");
        }
    }

    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}
