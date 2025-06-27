package entidades;

public class TipoCuenta {
	
	private int codTipoCuenta;
    private String nombre;

    public TipoCuenta() {}

    public TipoCuenta(int codTipoCuenta, String nombre) {
        this.codTipoCuenta = codTipoCuenta;
        this.nombre = nombre;
    }

    public int getCodTipoCuenta() {
        return codTipoCuenta;
    }

    public void setCodTipoCuenta(int codTipoCuenta) {
        this.codTipoCuenta = codTipoCuenta;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

}
