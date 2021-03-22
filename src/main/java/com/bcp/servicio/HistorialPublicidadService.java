package com.bcp.servicio;

import java.util.List;

import com.bcp.entidad.HistorialPublicidad;


public interface HistorialPublicidadService {
	
	public HistorialPublicidad insertaHistorialPublicidad(HistorialPublicidad obj);
	
	public List<HistorialPublicidad> listarPorIDCliente(int id);

}
