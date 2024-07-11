package models;

import controllers.ConexionDB;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Empleado {

    private int idEmpleado;
    private String nombre;
    private String telefono;
    private String correo;
    private String dni;
    private String contrasena;
    private String cargo;
    private Date fechaContratacion;
    private int idRol;

    public Empleado(String nombre, String telefono, String correo, String dni, String contrasena, String cargo, Date fechaContratacion, int idRol) {
        this.nombre = nombre;
        this.telefono = telefono;
        this.correo = correo;
        this.dni = dni;
        this.contrasena = contrasena;
        this.cargo = cargo;
        this.fechaContratacion = fechaContratacion;
        this.idRol = idRol;
    }
    
    public Empleado(String nombre, String telefono, String correo, String dni, String cargo, Date fechaContratacion, int idRol) {
        this.nombre = nombre;
        this.telefono = telefono;
        this.correo = correo;
        this.dni = dni;
        this.cargo = cargo;
        this.fechaContratacion = fechaContratacion;
        this.idRol = idRol;
    }

    public Date getFechaContratacion() {
        return fechaContratacion;
    }

    public void setFechaContratacion(Date fechaContratacion) {
        this.fechaContratacion = fechaContratacion;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getDni() {
        return dni;
    }

    public void setDni(String dni) {
        this.dni = dni;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getCargo() {
        return cargo;
    }

    public void setCargo(String cargo) {
        this.cargo = cargo;
    }

    public static void insertarEmpleado(String nombre, String telefono, String correo, String dni, String contrasena, String cargo, Date fechaContratacion, int idRol) throws SQLException, NoSuchAlgorithmException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
        conn = ConexionDB.getConnection();
        String sql = "INSERT INTO empleado (nombreEmpleado, telefonoEmpleado, correoEmpleado, dniEmpleado, contraseñaEmpleado, cargo, fechaContratacion, idRol) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, nombre);
        stmt.setString(2, telefono);
        stmt.setString(3, correo);
        stmt.setString(4, dni);
        stmt.setString(5, hashContrasena(contrasena));
        stmt.setString(6, cargo);
        stmt.setDate(7, fechaContratacion);
        stmt.setInt(8, idRol);
        stmt.executeUpdate();
    } finally {
        ConexionDB.closeConnection(conn, stmt);
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
    public static Empleado obtenerEmpleadoPorId(int idEmpleado) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Empleado empleado = null;

        try {
            conn = ConexionDB.getConnection();
            String sql = "SELECT * FROM empleado WHERE idEmpleado = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idEmpleado);
            rs = stmt.executeQuery();

            if (rs.next()) {
                empleado = new Empleado(
                    rs.getString("nombreEmpleado"),
                    rs.getString("telefonoEmpleado"),
                    rs.getString("correoEmpleado"),
                    rs.getString("dniEmpleado"),
                    rs.getString("cargo"),
                    rs.getDate("fechaContratacion"),
                    rs.getInt("idRol")
                );
            }
        } finally {
            ConexionDB.closeConnection(conn, stmt);
        }

        return empleado;
    }

    public static void actualizarContrasena(int idEmpleado, String nuevaContrasena) throws SQLException, NoSuchAlgorithmException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = ConexionDB.getConnection();
            String sql = "UPDATE empleado SET contraseñaEmpleado = ? WHERE idEmpleado = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, hashContrasena(nuevaContrasena));
            stmt.setInt(2, idEmpleado);
            stmt.executeUpdate();
        } finally {
            ConexionDB.closeConnection(conn, stmt);
        }
    }
}
