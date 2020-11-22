package com.bcp.repositorio;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.bcp.entidad.Cliente;

public interface ClienteRepository extends JpaRepository<Cliente, Integer>{

	@Query("Select x from Cliente x where x.login = :#{#cli.login} and x.password = :#{#cli.password}")
	public abstract Cliente login(@Param(value = "cli") Cliente bean);
	
}
