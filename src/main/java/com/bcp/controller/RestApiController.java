package com.bcp.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import com.bcp.entidad.HistorialPublicidad;
import com.bcp.servicio.HistorialPublicidadService;

@RestController
@RequestMapping(value = "/ApiService")
public class RestApiController {
	/*
	@Autowired
	private TramiteServicio tramiteService;
	
	//API QUE LISTA TODOS LOS MEDICOS 
    @GetMapping(path = "/listadoTramites")
	@ResponseBody
	public List<Tramite> listarTramites(){		
			return medicoService.listarTodos();
					
	}*/
	@Autowired
	private HistorialPublicidadService publicidadService;
	
	//API QUE LISTA TODOS LOS MEDICOS 
    @GetMapping(path = "/listarPublicidadXCliente/{parametro}")
	@ResponseBody
	public List<HistorialPublicidad> listarPublicidadesxCliente(@PathVariable("parametro") int id){		
			return publicidadService.listarPorIDCliente(id);
					
	}
    

}
