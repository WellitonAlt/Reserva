<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TreisVaga</title>      
    </head>
    <body>
        <h1>Área de Site - ${requestScope.site.nome}  </h1>
        <h3>Menu: </h3>       
        <a href="ListarPromocaoServlet?tipo=2&ID=${requestScope.site.id}">Listar Promoções</a><br/>
        <a href="index.jsp">Sair</a><br/>
        <hr>
    </body>
</html>

