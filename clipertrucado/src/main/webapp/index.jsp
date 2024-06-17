<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "https://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mi Primer Formulario</title>

<link rel="stylesheet" href="common/general.css">

<script type="text/javascript">
function compruebayenvia() {
	datos=document.iniciosesion;
	if (datos.usuario.value == '' ||
			datos.pass.value == '')
		alert ('¡Tiene que rellenar todos los campos!');
	else datos.submit();
	
}

</script>
</head>
<body>

<h1>Iniciar Sesión en la App</h1>
<form action="./LoginAuthenticator" method="post" name="iniciosesion" id="iniciosesion">
<table style="text-align: left; border: none;">
<tr><td>
<input type="hidden" name="varoculta" value="secreto"/>
Email:
	</td><td><input type="text" name="usuario" value="" class="inputgris"/>
</td></tr><tr><td>Contraseña:
	</td><td><input type="password" name="pass"  value="" class="inputgris"/>
</td></tr><tr><td>
	</td><td style="text-align: right;">
		<input type="button" name="send" value="Enviar" onclick="compruebayenvia();"/>
</td></tr></table>
</form>
</body>
</html>