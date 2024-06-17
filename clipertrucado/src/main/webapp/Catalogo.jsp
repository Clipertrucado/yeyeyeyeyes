<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="mipk.beanDB"%>
<%@page import="java.sql.SQLException"%>

<!DOCTYPE html>
<html>

<head>
<script src="assets/js/color-modes.js"></script>
<meta charset="utf-8">
<meta name="author" content="Sergio Alfonseca vallet">
<title>CLIPERTRUCADO</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/album/">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="cliper.css" rel="stylesheet">
</head>

<body class="carrito-body" onload="carrito()" onunload="">
	<header data-bs-theme="dark">
		<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="#"> <img src="imgs/logo.png"
					height="50px" alt="Clipertrucado">
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarCollapse"
					aria-controls="navbarCollapse" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse justify-content-center"
					id="navbarCollapse">
					<ul class="navbar-nav mb-2 mb-md-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="index.html">Inicio</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="catalogo.html">Catalogo</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="Colaboraciones.html">Colaboraciones</a>
						</li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="carro.html">Carrito</a></li>
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="pedidos.html">Pedidos</a></li>
					</ul>
				</div>
			</div>
		</nav>
	</header>
	<main>

		<section class="py-5 text-center container">
			<div class="row py-lg-5">
				<div class="col-lg-6 col-md-8 mx-auto">
					<h1 class="fw-light">CLIPERTRUCADO</h1>
					<br>
					<p class="lead text-body-secondary">Enciende tu estilo,
						enciende con personalidad</p>
					<p class="lead text-body-secondary">¡Mecheros a tu medida!</p>
				</div>
			</div>
		</section>

		<div class="album py-5 bg-body-tertiary">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">


					<%
					beanDB db = new beanDB();
					boolean okdb = false;
					String catalogo = "";

					try {
						db.conectarBD();
						okdb = true;
					} catch (Exception e) {
						okdb = false;
						//e.printStackTrace();
					}
					if (okdb) {
						String query = "select nombre_Producto, precio_Producto from Productos;";
						String[][] tablares = null;
						try {
							tablares = db.resConsultaSelectA3(query);
						} catch (SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						if (tablares != null) {

							
							for (int i = 0; i < tablares.length; i++) { //g es una variable tipo grupo que va recorriendo la lista
								catalogo = "<div class=\"col\">" +
						                "<div class=\"card shadow-sm\">" +
						                "<svg class=\"bd-placeholder-img card-img-top\" width=\"100%\" height=\"225\" xmlns=\"http://www.w3.org/2000/svg\" role=\"img\" aria-label=\"Placeholder: Thumbnail\" preserveAspectRatio=\"xMidYMid slice\" focusable=\"false\">" +
						                "<image href=\"imgs/"+ tablares[i][0]+".jpg\" width=\"100%\"></image>" +
						                "</svg>" +
						                "<div class=\"card-body\">" +
						                "<p class=\"card-text\">"+ tablares[i][0]+"</p>" +
						                "<div class=\"d-flex justify-content-between align-items-center\">" +
						                "<div class=\"btn-group\">" +
						                "<button type=\"button\" class=\"btn btn-sm btn-outline-secondary\" onclick=\"anyadirCarrito(3)\">Añadir al carrito</button>" +
						                "</div>" +
						                "<small class=\"text-body-secondary\">"+ tablares[i][1]+"€</small>" +
						                "</div>" +
						                "</div>" +
						                "</div>" +
						                "</div>";

						        // Imprimir el contenido HTML
						        out.println(catalogo);
							}
							

						}
						db.desconectarBD();
					} else {
						catalogo = "<div style='color: darkred; font-weight: bold;'>ERROR: No se pudo conectar con la BBDD</div>";
					}
					%>
				</div>
			</div>
		</div>

		<footer class="container">
			<p class="float-end">
				<a href="#">Back to top</a>
			</p>
			<p>
				&copy; 2024 Company, Inc. &middot; <a href="#">Privacy</a> &middot;
				<a href="#">Terms</a>
			</p>
		</footer>
	</main>

	<script src="operativa.js"></script>
	<script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>