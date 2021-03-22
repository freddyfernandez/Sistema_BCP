<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<link href="css/navbar.css" type="text/css" rel="stylesheet">
<link href="css/noti.css" type="text/css" rel="stylesheet">
href="<c:url value="/resources/css/bootstrap.min.css" />"
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Overpass:ital,wght@0,400;1,200&display=swap" rel="stylesheet">
<div class="container">
  
  <div class="navbar navbar-inverse navbar-fixed-top navbar navbar-light" id="div-nav">
    <div class="container-fluid">
      <div class="navbar-header">
      <img src="images/logoBCP2.png" width="80" height="30" style="margin-top:7px" />
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    
    <div class="collapse navbar-collapse">
    <ul class="nav navbar-nav navbar-left">

       	<li><a href="verIntranetHome">Home</a></li>
    </ul>
    
    <ul class="nav navbar-nav">
    	<li class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	          Configuraciones<b class="caret"></b>
	        </a>
	        <ul class="dropdown-menu">
	        	<c:forEach var="x" items="${sessionScope.objMenus}">
		        	<c:if test="${x.tipo == 3}">
					<li>
		        			<a href="${x.ruta}">
		        				${x.nombre}
		        			</a>
		        		</li>
	        		</c:if>
	        	</c:forEach>
	        </ul>
     	</li>
     </ul>
         
    <ul class="nav navbar-nav">
    	<li class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	          Mis Operaciones<b class="caret"></b>
	        </a>
	        <ul class="dropdown-menu">
	        	<c:forEach var="x" items="${sessionScope.objMenus}">
		        	<c:if test="${x.tipo == 1}">
					<li>
		        			<a href="${x.ruta}">
		        				${x.nombre}
		        			</a>
		        		</li>
	        		</c:if>
	        	</c:forEach>
	        </ul>
     	</li>
     </ul>
     
     <ul class="nav navbar-nav">
    	<li class="dropdown">
	        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
	          Mantenimientos<b class="caret"></b>
	        </a>
	        <ul class="dropdown-menu">
	        	<c:forEach var="x" items="${sessionScope.objMenus}">
		        	<c:if test="${x.tipo == 2}">
					<li>
		        			<a href="${x.ruta}">
		        				${x.nombre}
		        			</a>
		        		</li>
	        		</c:if>
	        	</c:forEach>
	        </ul>
     	</li>
     </ul>
     
     
      <ul class="nav navbar-nav navbar-right"> 
     	<li id="noti_Container" >
     		
     			<div id="noti_Counter"></div>   <!--SHOW NOTIFICATIONS COUNT.-->
                <a id="noti_Button" href=""><samp class="bubble"><img src='images/campana.png' width='35px' height='35px' /></samp></a>
                <div id="notifications" style="margin-right: 10px" href = "">
                    <h3>Notificaciones</h3>
                   	<div style="height:640px;" > 
                   		<div id="idNotificaciones" > <!-- ancho alto colores onclick resalta -->
                   		</div>
                   	
                   	</div>
                   <!-- <div class="seeAll"><a href="">Ver Todas las notificaciones</a></div>  -->
                   <a href="verIntranetHome" class="boton_2">Ver Todas las notificaciones</a>
                </div>
     	</li>     	   
     </ul>
     
    
     
      
     <ul class="nav navbar-nav navbar-right">
        <li><a>Bienvenido Sr(a): ${sessionScope.objCliente.nombre}</a> </li>
       	<li><a href="logout">Salir</a></li>
     </ul>
      
    </div>
  </div>
</div>  
</div>



<script>
var contador = 0;	

	$(document).ready(function () {
		
    	$.getJSON("cargaNotificaciones", {}, function(data){
    		$.each(data, function(index,item){
    			$("#idNotificaciones").append("<a href ='#'> "+"<img src = 'images/logo_bcp_icon.jpg'>" + "<h4>"+ item.mensaje +"</h4>" + "<h4>"+ item.contenido +"</h4>"+"</a>");
    			//$("#idNotificaciones").append("<h4>"+ item.mensaje +"</h4>");
    			//$("#idNotificaciones").append("<h4>"+ item.contenido +"</h4>");
    			
    			
    		});

             
    	});

    	$.getJSON("cargaNotificacionesNoVistas", {}, function(data){
    			contador=data;		
  
    		 $('#noti_Counter')
             .css({ opacity: 0 })
             .text(contador)  // A�ADIR VALOR DIN�MICO (PUEDE EXTRAER DATOS DE LA BASE DE DATOS O XML).
             .css({ top: '14px' })
             .animate({ right: '0px', opacity: 1 }, 500);
             
    	});
    	

    	
    	

    	// MOSTRAR ANIMADO EL CONTADOR DE NOTIFICACIONES
       

        $('#noti_Button').click(function () {

        	$.getJSON("cargaNotificaciones", {}, function(data){
        		$.each(data, function(index,item){
        		
        			if(item.estado==0)
            		{
        		
        				var jsonParam = {"idHistorialNotificaciones":item.idHistorialNotificaciones,
                				"mensaje":item.mensaje,"estado":1,"contenido":item.contenido,"fechaRegistro":item.fechaRegistro,
                				"cliente.idCliente":item.cliente.idCliente,"tipoMovimiento.idTipoMovimiento":item.tipoMovimiento.idTipoMovimiento};
        				
        				$.ajax({
        					url:  'actualizarVisionNotificaciones',
        					type: 'POST',
        					dataType:'json',
        					data: jsonParam,
        					success:function(data){
        					
        						if(data != null){

        							console.log(data);
        							$.each(data, function(index, item){
            							
        							});
        							
        						}else
        							swal("Error al agregar la selecci�n del producto","","error");
        							return false;
        						},
        					error: function (jqXhr) { 
        						swal("Error en la conexi�n","","error");
        					}
        			   });
            		}

        		});
                 
        	});


            

            // TOGGLE (MOSTRAR U OCULTAR) VENTANA DE NOTIFICACIONES.
            $('#notifications').fadeToggle('fast', 'linear', function () {
                if ($('#notifications').is(':hidden')) {
                    $('#noti_Button').css('background-color');
                }
                // // CAMBIAR EL COLOR DE FONDO DEL BOT�N. 
                else $('#noti_Button').css('background-color');
            });

            $('#noti_Counter').fadeOut('slow'); 
                // OCULTAR EL MOSTRADOR.
                

            return false;
        });

        // OCULTAR NOTIFICACIONES CUANDO SE HAGA CLIC EN CUALQUIER LUGAR DE LA P�GINA. 
        $(document).click(function () {
            $('#notifications').hide();

           // COMPRUEBE SI EL CONTADOR DE NOTIFICACIONES EST� OCULTO.
            if ($('#noti_Counter').is(':hidden')) {
                // // CAMBIAR EL COLOR DE FONDO DEL BOT�N.
                $('#noti_Button').css('background-color');
            }
        });

        $('#notifications').click(function () {
            return false;       // NO HACER NADA CUANDO SE HAGA CLIC EN EL CONTENEDOR
        });
    });
    </script>

