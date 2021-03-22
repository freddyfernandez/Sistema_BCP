package com.bcp.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.bcp.entidad.Cliente;
import com.bcp.entidad.HistorialPublicidad;
import com.bcp.servicio.ClienteService;
import com.bcp.servicio.HistorialPublicidadService;
import com.bcp.servicio.TarjetaService;
import com.bcp.entidad.Opcion;
import com.bcp.entidad.Rol;
import com.bcp.entidad.Tarjeta;

@Controller
public class LoginController {

	@Autowired
	private ClienteService servicio;
	
	@Autowired
	private TarjetaService tarjetaServicio;
	
	@Autowired
	private HistorialPublicidadService publicidadServicio;

	@RequestMapping("/")
	public String ver() {
		return "login";
	}


	@RequestMapping("/login")
	public String login(Cliente cliente, HttpSession session, HttpServletRequest request) {

		Cliente objUsu = servicio.login(cliente);
		if (objUsu == null) {
			request.setAttribute("mensaje", "El usuario no existe");
			return "login";
		} else {
			List<Rol> roles = servicio.traerRolesDeUsuario(objUsu.getIdCliente());
			List<Opcion> menus = servicio.traerEnlacesDeUsuario(objUsu.getIdCliente());
			Tarjeta tarjeta=tarjetaServicio.BuscarTarjetaPorCliente(objUsu.getIdCliente());
			
			session.setAttribute("objCliente", objUsu);
			session.setAttribute("objRoles", roles);
			session.setAttribute("objMenus", menus);
			session.setAttribute("objTarjeta", tarjeta);
			
			/*LISTADO DE PUBLICIDAD SEGUN ID CLIENTE*/
			List<HistorialPublicidad> getlistado = publicidadServicio.listarPorIDCliente(objUsu.getIdCliente());
			session.setAttribute("objPublicidad", getlistado);
			
			
			return "redirect:Home";
		}
	}
	/* NO ES POSIBLE RENDERIZAR DATOS  REST EN EL SERVIDOR REST
	@RequestMapping("/Home")
	public String verHome(HttpSession sessionl) {
	
		HistorialPublicidad[] getlistado=null;
		RestTemplate rt=new RestTemplate();
		ResponseEntity<HistorialPublicidad[]>data= rt.getForEntity(
						URL+"/listarPublicidadXCliente/"+2,HistorialPublicidad[].class);
		getlistado=data.getBody();
		sessionl.setAttribute("objPublicidad", getlistado);
		return "intranetHome";
	}*/
	
	@RequestMapping("/Home")
	public String verHome() {
		return "intranetHome";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		//Destruir todos los objetos de la sesion mediante programación
		session.invalidate();

		response.setHeader("Cache-control", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "no-cache");

		request.setAttribute("mensaje", "El usuario salió de sesión");
		return "login";

	}

}
