package entidades;

public class ReporteResultado {
	 
	private double totalIngresos;
	private double totalEgresos;
	
	public ReporteResultado(double ingresos, double egresos){
		this.totalIngresos = ingresos;
		this.totalEgresos = egresos;
	}

	
	
	
	//GETTERS ---------------------------------------------------------------
	public double getTotalIngresos() {
		return totalIngresos;
	}

	

	public double getTotalEgresos() {
		return totalEgresos;
	}

	
	
	
	public double getDiferencia() {
		return totalIngresos - totalEgresos;
	}
	
	
	//-------------------------------------------------------------------------------	
		
	
	
	
	
	
	
	

}
