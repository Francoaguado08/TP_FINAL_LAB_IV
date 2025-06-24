package entidades;

public class TipoUsuario {

	 private int codTipoUsuario;
	 private String descripcion;
	
	 
	 // Constructor con parámetros
	    public TipoUsuario(int codTipoUsuario, String descripcion) {
	        this.codTipoUsuario = codTipoUsuario;
	        this.descripcion = descripcion;
	    }
	 
	
	 
	 public int getCodTipoUsuario() {
		return codTipoUsuario;
	}
	public void setCodTipoUsuario(int codTipoUsuario) {
		this.codTipoUsuario = codTipoUsuario;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	 
	
	
	
}
