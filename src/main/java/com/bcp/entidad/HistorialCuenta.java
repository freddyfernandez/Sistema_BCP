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
@Table(name = "historialcuenta")
public class HistorialCuenta {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idHistorialCuenta;
	private double monto;
	private String mensaje;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private String fechaRegistro;
	
	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idCuenta")
	private Cuenta cuenta;

	
	@JsonIgnoreProperties({ "hibernateLazyInitializer", "handler" })
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idTipoMovimiento")
	private TipoMovimiento tipoMovimiento;
	
	
}
