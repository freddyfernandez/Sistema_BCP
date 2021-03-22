<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<link rel="stylesheet" href="css/noti.css"/>
<link rel="stylesheet" href="css/movimientos.css"/>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.4.8/swiper-bundle.min.css"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Intranet BCP - Home</title>
</head>
<body background="images/fondoHome1.png">
       
<jsp:include page="intranetCabecera.jsp" />

<!--   <ul>
        <c:forEach var="x" items="${sessionScope.objPublicidad}">
            <li id="liHome">
                   ${x.mensaje} 
            </li>
        </c:forEach>
     </ul> -->
	
  
<div class="container" style="width: 60%;padding:10px;margin-top:50px" id="div01">
 <h1 style="color: #fff;font-family: 'Overpass', sans-serif;">Sistema BCP</h1>
        <c:forEach var="x" items="${sessionScope.objRoles}">
            <h2  id="liHome">Promociones: ${x.nombre}</h2>
        </c:forEach>
<section>

    <div class="testimonials-carousel-wrap">
        <div class="listing-carousel-button listing-carousel-button-next"><i class="fa fa-caret-right" style="color: #fff"></i></div>
        <div class="listing-carousel-button listing-carousel-button-prev"><i class="fa fa-caret-left" style="color: #fff"></i></div>
        <div class="testimonials-carousel">
            <div class="swiper-container">
                <div class="swiper-wrapper">
                
                <c:forEach var="x" items="${sessionScope.objPublicidad}">
                
                    <div class="swiper-slide">
                        <div class="testi-item">
                            <div class="testi-avatar"><img src="images/${x.imagen}"></div>
                             
                
                            <div class="testimonials-text-before"><i class="fa fa-quote-right"></i></div>
                            <div class="testimonials-text">
                                <div class="listing-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <p>${x.mensaje}</p>
                           
                                <div class="testimonials-avatar">
                                    <h3>${x.tipo_tramite}</h3>
                                    <a>Lo quiero</a>
                                </div>
                            </div>
                            <div class="testimonials-text-after"><i class="fa fa-quote-left"></i></div> 
                        </div>
                    </div>
                
                </c:forEach>
                    <!--second--->
                    <div class="swiper-slide">
                        <div class="testi-item">
                            <div class="testi-avatar"><img src="images/3.jpg"></div>
                            <div class="testimonials-text-before"><i class="fa fa-quote-right"></i></div>
                            <div class="testimonials-text">
                                <div class="listing-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <p>Lorem Ipsum is simply ded it to make a type specimen book.</p>
                                <a href="#" class="text-link"></a>
                                <div class="testimonials-avatar">
                                    <h3>Doe Boe</h3>
                                    <a>Director</a>
                                </div>
                            </div>
                            <div class="testimonials-text-after"><i class="fa fa-quote-left"></i></div> 
                        </div>
                    </div>
                    <!--third-->

                    <div class="swiper-slide">
                        <div class="testi-item">
                            <div class="testi-avatar"><img src="images/4.jpg"></div>
                            <div class="testimonials-text-before"><i class="fa fa-quote-right"></i></div>
                            <div class="testimonials-text">
                                <div class="listing-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <p>Lorem Ipsum is simply dummy text of the printing and specimen book.</p>
                    
                                <div class="testimonials-avatar">
                                    <h3>Boe Doe</h3>
                                    <a>Developer</a>
                                </div>
                            </div>
                            <div class="testimonials-text-after"><i class="fa fa-quote-left"></i></div> 
                        </div>
                    </div>

                    <!--fourth-->
                    <div class="swiper-slide">
                        <div class="testi-item">
                            <div class="testi-avatar"><img src="images/6.jpg"></div>
                            <div class="testimonials-text-before"><i class="fa fa-quote-right"></i></div>
                            <div class="testimonials-text">
                                <div class="listing-rating">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </div>
                                <p>Lorem Ipsum is simply dummy text of the prspecimen book.</p>
                          
                                <div class="testimonials-avatar">
                                    <h3>Doe John</h3>
                                    <a>Designer</a>
                                </div>
                            </div>
                            <div class="testimonials-text-after"><i class="fa fa-quote-left"></i></div> 
                        </div>
                    </div>
                    <!--testi end-->

                </div>
            </div>
        </div>

        <div class="tc-pagination"></div>
    </div>
</section>
    
</div>
  

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/6.4.8/swiper-bundle.min.js"></script>
  <script src="js/scripts.js"></script>   		
</body>
</html>