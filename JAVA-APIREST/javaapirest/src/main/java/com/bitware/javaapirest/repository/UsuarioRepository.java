
package com.bitware.javaapirest.repository;
import com.bitware.javaapirest.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
}
