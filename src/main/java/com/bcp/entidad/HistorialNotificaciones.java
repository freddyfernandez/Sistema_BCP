package com.bcp.entidad;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "historialnotificaciones")
public class HistorialNotificaciones {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idHistorialNotificaciones;
	private String mensaje;
	private String contenido;
	private int estado;
	

	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private String fechaRegistro;
	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idCliente")
	private Cliente cliente;
	
	
	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idTipoMovimiento")
	private TipoMovimiento tipoMovimiento;
	
	


}
