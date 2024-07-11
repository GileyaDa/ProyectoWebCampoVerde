package models;

import controllers.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Proveedor {
    private int idProveedor;
    private String nombreProveedor;
    private String direccionProveedor;
    private String telefonoProveedor;
    private String correoProveedor;
    private String rucProveedor;

    public Proveedor(int idProveedor, String nombreProveedor, String direccionProveedor, String telefonoProveedor, String correoProveedor, String rucProveedor) {
        this.idProveedor = idProveedor;
        this.nombreProveedor = nombreProveedor;
        this.direccionProveedor = direccionProveedor;
        this.telefonoProveedor = telefonoProveedor;
        this.correoProveedor = correoProveedor;
        this.rucProveedor = rucProveedor;
    }

    public Proveedor(String nombreProveedor, String direccionProveedor, String telefonoProveedor, String correoProveedor, String rucProveedor) {
        this.nombreProveedor = nombreProveedor;
        this.direccionProveedor = direccionProveedor;
        this.telefonoProveedor = telefonoProveedor;
        this.correoProveedor = correoProveedor;
        this.rucProveedor = rucProveedor;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public String getNombreProveedor() {
        return nombreProveedor;
    }

    public void setNombreProveedor(String nombreProveedor) {
        this.nombreProveedor = nombreProveedor;
    }

    public String getDireccionProveedor() {
        return direccionProveedor;
    }

    public void setDireccionProveedor(String direccionProveedor) {
        this.direccionProveedor = direccionProveedor;
    }

    public String getTelefonoProveedor() {
        return telefonoProveedor;
    }

    public void setTelefonoProveedor(String telefonoProveedor) {
        this.telefonoProveedor = telefonoProveedor;
    }

    public String getCorreoProveedor() {
        return correoProveedor;
    }

    public void setCorreoProveedor(String correoProveedor) {
        this.correoProveedor = correoProveedor;
    }

    public String getRucProveedor() {
        return rucProveedor;
    }

    public void setRucProveedor(String rucProveedor) {
        this.rucProveedor = rucProveedor;
    }

    public static void insertarProveedor(String nombreProveedor, String direccionProveedor, String telefonoProveedor, String correoProveedor, String rucProveedor) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = ConexionDB.getConnection();
            String sql = "INSERT INTO proveedor (nombreProveedor, direccionProveedor, telefonoProveedor, correoProveedor, rucProveedor) VALUES (?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, nombreProveedor);
            stmt.setString(2, direccionProveedor);
            stmt.setString(3, telefonoProveedor);
            stmt.setString(4, correoProveedor);
            stmt.setString(5, rucProveedor);
            stmt.executeUpdate();
        } finally {
            ConexionDB.closeConnection(conn, stmt);
        }
    }
}