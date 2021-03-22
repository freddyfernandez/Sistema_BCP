package com.bcp.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import com.bcp.entidad.HistorialPublicidad;


public interface PublicidadRepository extends JpaRepository<HistorialPublicidad, Integer>{
	
	@Query("Select hp from HistorialPublicidad hp where "
			+ "hp.tipoMovimiento.idTipoMovimiento=6 "
			+ "and hp.usuario.idCliente = :var_cli "
			+ "order by hp.fechaRegistro DESC")

	public abstract List<HistorialPublicidad> listaPorCliente(@Param(value = "var_cli") int idCliente);

}
