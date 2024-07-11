package models;

import controllers.ConexionDB;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Pedido {
    private int idPedido;
    private int idProveedor;
    private Date fechaPedido;
    private double totalPedido;
    private int idEmpleado;

    public Pedido(int idPedido, int idProveedor, Date fechaPedido, double totalPedido, int idEmpleado) {
        this.idPedido = idPedido;
        this.idProveedor = idProveedor;
        this.fechaPedido = fechaPedido;
        this.totalPedido = totalPedido;
        this.idEmpleado = idEmpleado;
    }

    public Pedido(int idProveedor, Date fechaPedido, double totalPedido, int idEmpleado) {
        this.idProveedor = idProveedor;
        this.fechaPedido = fechaPedido;
        this.totalPedido = totalPedido;
        this.idEmpleado = idEmpleado;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

    public Date getFechaPedido() {
        return fechaPedido;
    }

    public void setFechaPedido(Date fechaPedido) {
        this.fechaPedido = fechaPedido;
    }

    public double getTotalPedido() {
        return totalPedido;
    }

    public void setTotalPedido(double totalPedido) {
        this.totalPedido = totalPedido;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public static void insertarPedido(int idProveedor, Date fechaPedido, double totalPedido, int idEmpleado) throws SQLException, ClassNotFoundException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = ConexionDB.getConnection();
            String sql = "INSERT INTO pedido (idProveedor, fechaPedido, totalPedido, idEmpleado) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idProveedor);
            stmt.setDate(2, fechaPedido);
            stmt.setDouble(3, totalPedido);
            stmt.setInt(4, idEmpleado);
            stmt.executeUpdate();
        } finally {
            ConexionDB.closeConnection(conn, stmt);
        }
    }
}