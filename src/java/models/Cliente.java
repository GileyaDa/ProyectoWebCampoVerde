package models;

import controllers.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Cliente {
    private int idCliente;
    private String nombreCliente;
    private String direccionCliente;
    private String telefonoCliente;
    private String correoCliente;
    private String dniCliente;

    public Cliente(int idCliente, String nombreCliente, String direccionCliente, String telefonoCliente, String correoCliente, String dniCliente) {
        this.idCliente = idCliente;
        this.nombreCliente = nombreCliente;
        this.direccionCliente = direccionCliente;
        this.telefonoCliente = telefonoCliente;
        this.correoCliente = correoCliente;
        this.dniCliente = dniCliente;
    }

    public Cliente(String nombreCliente, String direccionCliente, String telefonoCliente, String correoCliente, String dniCliente) {
        this.nombreCliente = nombreCliente;
        this.direccionCliente = direccionCliente;
        this.telefonoCliente = telefonoCliente;
        this.correoCliente = correoCliente;
        this.dniCliente = dniCliente;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getDireccionCliente() {
        return direccionCliente;
    }

    public void setDireccionCliente(String direccionCliente) {
        this.direccionCliente = direccionCliente;
    }

    public String getTelefonoCliente() {
        return telefonoCliente;
    }

    public void setTelefonoCliente(String telefonoCliente) {
        this.telefonoCliente = telefonoCliente;
    }

    public String getCorreoCliente() {
        return correoCliente;
    }

    public void setCorreoCliente(String correoCliente) {
        this.correoCliente = correoCliente;
    }

    public String getDniCliente() {
        return dniCliente;
    }

    public void setDniCliente(String dniCliente) {
        this.dniCliente = dniCliente;
    }

    public static void insertarCliente(String nombreCliente, String direccionCliente, String telefonoCliente, String correoCliente, String dniCliente) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = ConexionDB.getConnection();
            String sql = "INSERT INTO cliente (nombreCliente, direccionCliente, telefonoCliente, correoCliente, dniCliente) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, nombreCliente);
            stmt.setString(2, direccionCliente);
            stmt.setString(3, telefonoCliente);
            stmt.setString(4, correoCliente);
            stmt.setString(5, dniCliente);
            stmt.executeUpdate();
        } finally {
            ConexionDB.closeConnection(conn, stmt);
        }
    }
}