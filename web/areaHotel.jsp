<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TreisVaga</title>      
    </head>
    <body>
        <h1>Area de Hotel - ${requestScope.hotel.nome}  </h1>
        <h3>Menu: </h3>
        <a href="CadastroPromocaoServlet?hotel=${requestScope.hotel.id}">Cadastro Promocao</a><br/>        
        <a href="ListarPromocaoServlet?tipo=1&ID=${requestScope.hotel.id}">Listar Promocao</a><br/>
        <a href="index.jsp">Sair</a><br/>
        <hr>
    </body>
</html>
