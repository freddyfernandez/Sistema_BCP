package com.bcp.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bcp.entidad.HistorialNotificaciones;

public interface HistorialNotificacionesRepository  extends JpaRepository<HistorialNotificaciones, Integer>{

	@Query("Select h from HistorialNotificaciones h, Mensaje m where "
			+ " m.historialnotificacion.idHistorialNotificaciones = h.idHistorialNotificaciones and "
		       + " h.cliente.idCliente = :var_cli")

	public abstract List<HistorialNotificaciones> listaPorCliente(@Param(value = "var_cli") int idCliente);
	
	//invertir  las sentencias  de p.atributo = m.tabla.atributo --> m.tabla.atributo = p.atributo
	
}
