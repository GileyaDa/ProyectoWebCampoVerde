package models;

import controllers.ConexionDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Noticia {
    private int idNoticia;
    private String tituloNoticia;
    private String contenido;
    private Date fechaNoticia;
    private int idEmpleado;

    public Noticia(int idNoticia, String tituloNoticia, String contenido, Date fechaNoticia, int idEmpleado) {
        this.idNoticia = idNoticia;
        this.tituloNoticia = tituloNoticia;
        this.contenido = contenido;
        this.fechaNoticia = fechaNoticia;
        this.idEmpleado = idEmpleado;
    }

    public Noticia(String tituloNoticia, String contenido, Date fechaNoticia, int idEmpleado) {
        this.tituloNoticia = tituloNoticia;
        this.contenido = contenido;
        this.fechaNoticia = fechaNoticia;
        this.idEmpleado = idEmpleado;
    }

    public int getIdNoticia() {
        return idNoticia;
    }

    public void setIdNoticia(int idNoticia) {
        this.idNoticia = idNoticia;
    }

    public String getTituloNoticia() {
        return tituloNoticia;
    }

    public void setTituloNoticia(String tituloNoticia) {
        this.tituloNoticia = tituloNoticia;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }

    public Date getFechaNoticia() {
        return fechaNoticia;
    }

    public void setFechaNoticia(Date fechaNoticia) {
        this.fechaNoticia = fechaNoticia;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public static void insertarNoticia(String tituloNoticia, String contenido, Date fechaNoticia, int idEmpleado) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = ConexionDB.getConnection();
            String sql = "INSERT INTO noticia (tituloNoticia, contenido, fechaNoticia, idEmpleado) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, tituloNoticia);
            stmt.setString(2, contenido);
            stmt.setDate(3, fechaNoticia);
            stmt.setInt(4, idEmpleado);
            stmt.executeUpdate();
        } finally {
            ConexionDB.closeConnection(conn, stmt);
        }
    }
}