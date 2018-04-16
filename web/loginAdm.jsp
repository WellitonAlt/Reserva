<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TreisVaga</title>      
    </head>
    <body>
        <h1>Login ADM</h1>
        <h3>Menu:</h3>
        <a href="index.jsp">Pagina Inicial</a><br/>
        <a href="ListaHoteisServlet?cidade=">Ver Hotéis</a><br/>        
        <a href="#">Area dos Hotéis</a><br/>
        <a href="#">Area dos Site de Reserva</a><br/>
        <a href="#">Area de Administração</a><br/>
        <hr>
        <c:if test="${!empty requestScope.mensagem}">
            <p>${requestScope.mensagem}</p>
        </c:if>
        <form action="LoginAdmServlet" method="post">
            Usuario:
            <input name="usuario" type="text" value="${sessionScope.login.usuario}" /> <br />
            Senha:
            <input name="senha" type="password" value="" /> <br />
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>
