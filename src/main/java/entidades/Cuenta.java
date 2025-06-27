package entidades;

import java.util.Date;

public class Cuenta {
    private int nroCuenta;            // Si lo usás para consultas
    private int idCliente;
    private int codTipoCuenta;
    private String cbu;
    private Date fechaCreacion;
    private double saldo;

    // Constructor vacío
    public Cuenta() {
    }

    // Constructor con todos los campos
    public Cuenta(int nroCuenta, int idCliente, int codTipoCuenta, String cbu, Date fechaCreacion, double saldo) {
        this.nroCuenta = nroCuenta;
        this.idCliente = idCliente;
        this.codTipoCuenta = codTipoCuenta;
        this.cbu = cbu;
        this.fechaCreacion = fechaCreacion;
        this.saldo = saldo;
    }

    // Constructor sin nroCuenta (si lo genera la base)
    public Cuenta(int idCliente, int codTipoCuenta, String cbu, Date fechaCreacion, double saldo) {
        this.idCliente = idCliente;
        this.codTipoCuenta = codTipoCuenta;
        this.cbu = cbu;
        this.fechaCreacion = fechaCreacion;
        this.saldo = saldo;
    }

    // Getters y setters
    public int getNroCuenta() {
        return nroCuenta;
    }

    public void setNroCuenta(int nroCuenta) {
        this.nroCuenta = nroCuenta;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public int getCodTipoCuenta() {
        return codTipoCuenta;
    }

    public void setCodTipoCuenta(int codTipoCuenta) {
        this.codTipoCuenta = codTipoCuenta;
    }

    public String getCbu() {
        return cbu;
    }

    public void setCbu(String cbu) {
        this.cbu = cbu;
    }

    public Date getFechaCreacion() {
        return fechaCreacion;
    }

    public void setFechaCreacion(Date fechaCreacion) {
        this.fechaCreacion = fechaCreacion;
    }

    public double getSaldo() {
        return saldo;
    }

    public void setSaldo(double saldo) {
        this.saldo = saldo;
    }
}
