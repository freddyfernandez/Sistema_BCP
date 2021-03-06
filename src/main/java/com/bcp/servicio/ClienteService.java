package com.bcp.servicio;

import java.util.List;

import com.bcp.entidad.Cliente;
import com.bcp.entidad.Opcion;
import com.bcp.entidad.Rol;


public interface ClienteService {

	public abstract Cliente login(Cliente bean);
	
	public abstract List<Opcion> traerEnlacesDeUsuario(int idUsuario);

	public abstract List<Rol> traerRolesDeUsuario(int idUsuario);
	

	public abstract Cliente actualizarCliente(Cliente bean);

	
	



}
