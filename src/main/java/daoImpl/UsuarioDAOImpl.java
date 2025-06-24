package daoImpl;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import dao.IUsuarioDAO;
import entidades.Usuario;

public class UsuarioDAOImpl implements IUsuarioDAO {

    @Override
    public int insertar(Usuario usuario) {
        int idGenerado = -1; // valor por defecto (error)
        
        Connection cn = Conexion.getConexion().getSQLConexion();
        String query = "INSERT INTO usuarios (User, Pass, Cod_TipoUsuario) VALUES (?, ?, ?)";

        try {
            // IMPORTANTE: solicitar que devuelva claves generadas
            PreparedStatement ps = cn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, usuario.getUser());
            ps.setString(2, usuario.getContrasena());
            ps.setInt(3, usuario.getTipoUsuario().getCodTipoUsuario());

            int filasAfectadas = ps.executeUpdate();

            if (filasAfectadas > 0) {
                // Recuperar el ID generado
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    idGenerado = rs.getInt(1);
                    cn.commit(); // confirmar si todo salió bien
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            try {
                cn.rollback(); // deshacer si hay error
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        return idGenerado;
    }
}



 
