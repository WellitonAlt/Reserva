<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TreisVaga</title>    
    </head>
    <body>
        <h1>Hoteis</h1>
        <h3>Menu:</h3>
        <a href="index.jsp">Pagina Inicial</a><br/>
        <a href="ListaHoteisServlet?cidade=">Ver Hotéis</a><br/>
        <a href="#">Area dos Hotéis</a><br/>
        <a href="#">Area dos Site de Reserva</a><br/>
        <a href="loginAdm.jsp">Area de Administração</a><br/>
        <hr>
        <form action="ListaHoteisServlet" method="post">
            Digite o nome ou parte do nome da cidade:
            <input name="cidade" type="text" value="" />
            <input type="submit" value="Buscar"/>
        </form>
        <br />
        <c:if test="${empty requestScope.hoteis}">
            Não há Hoteis!
        </c:if>
        <c:if test="${!empty requestScope.hoteis}">        
            <table>
                <tr>                  
                    <th>Hotel</th>
                    <th>CNPJ</th>
                    <th>Cidade</th>
                </tr>
                <c:forEach items="${requestScope.hoteis}" var="hotel">
                    <tr>
                        <td>${hotel.nome}</td>
                        <td>${hotel.CNPJMascara}</td>
                        <td>${hotel.cidade}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>

