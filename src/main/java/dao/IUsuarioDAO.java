package dao;

import entidades.Usuario;

public interface IUsuarioDAO {
	 public int insertar(Usuario usuario);
	 public boolean modificar(Usuario usuario);
}
