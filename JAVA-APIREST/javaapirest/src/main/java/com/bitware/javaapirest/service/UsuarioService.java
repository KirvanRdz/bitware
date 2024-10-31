
package com.bitware.javaapirest.service;
import com.bitware.javaapirest.exception.ResourceNotFoundException;
import com.bitware.javaapirest.model.Usuario;
import com.bitware.javaapirest.repository.UsuarioRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class UsuarioService {

    @Autowired
    private UsuarioRepository usuarioRepository;

    public List<Usuario> obtenerTodos() {
        return usuarioRepository.findAll();
    }

    public Usuario obtenerPorId(Long id) {
        return usuarioRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Usuario no encontrado con id " + id));
    }

    public Usuario crearUsuario(Usuario usuario) {
        return usuarioRepository.save(usuario);
    }

    public Usuario actualizarUsuario(Long id, Usuario usuarioDetalles) {
        Usuario usuario = obtenerPorId(id);
        usuario.setNombre(usuarioDetalles.getNombre());
        usuario.setApellido(usuarioDetalles.getApellido());
        usuario.setCorreo(usuarioDetalles.getCorreo());
         usuario.setContraseña(usuarioDetalles.getContraseña());
        return usuarioRepository.save(usuario);
    }

    public void eliminarUsuario(Long id) {
        Usuario usuario = obtenerPorId(id);
        usuarioRepository.delete(usuario);
    }
}
