package models;

import controllers.ConexionDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Foro {
    private int idForo;
    private String tituloForo;
    private String comentario;
    private Date fechaForo;
    private int idEmpleado;

    public Foro(int idForo, String tituloForo, String comentario, Date fechaForo, int idEmpleado) {
        this.idForo = idForo;
        this.tituloForo = tituloForo;
        this.comentario = comentario;
        this.fechaForo = fechaForo;
        this.idEmpleado = idEmpleado;
    }

    public Foro(String tituloForo, String comentario, Date fechaForo, int idEmpleado) {
        this.tituloForo = tituloForo;
        this.comentario = comentario;
        this.fechaForo = fechaForo;
        this.idEmpleado = idEmpleado;
    }

    public int getIdForo() {
        return idForo;
    }

    public void setIdForo(int idForo) {
        this.idForo = idForo;
    }

    public String getTituloForo() {
        return tituloForo;
    }

    public void setTituloForo(String tituloForo) {
        this.tituloForo = tituloForo;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public Date getFechaForo() {
        return fechaForo;
    }

    public void setFechaForo(Date fechaForo) {
        this.fechaForo = fechaForo;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public static void insertarForo(String tituloForo, String comentario, Date fechaForo, int idEmpleado) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = ConexionDB.getConnection();
            String sql = "INSERT INTO foro (tituloForo, comentario, fechaForo, idEmpleado) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, tituloForo);
            stmt.setString(2, comentario);
            stmt.setDate(3, fechaForo);
            stmt.setInt(4, idEmpleado);
            stmt.executeUpdate();
        } finally {
            ConexionDB.closeConnection(conn, stmt);
        }
    }
}