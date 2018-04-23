<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TreisVaga</title>    
    </head>
    <body>
        <h1>Listar Promoções</h1>
        <h3>Menu:</h3>
        <a href="index.jsp">Página Inicial</a><br/>
        <a href="javascript:history.go(-1)">Voltar</a><br/>
        <a href="login.jsp">Sair</a><br/>
        <hr>
        <c:if test="${empty requestScope.promocoes}">
            Não há Promoções!
        </c:if>
        <c:if test="${!empty requestScope.promocoes}">        
            <table border = '1'>
                <tr>                   
                    <th>Promoção ID</th>
                    <th>Hotel</th>
                    <th>Cidade</th>
                    <th>Preço</th>
                    <th>Data Inicial</th>
                    <th>Data Final</th>
                    <th>Site</th>
                    <th>Telefone</th>
                    <th>Site Url</th>    
                </tr>
                <c:forEach items="${requestScope.promocoes}" var="promocao">
                    <tr>
                        <td>${promocao.promocao.id}</td>
                        <td>${promocao.hotel.nome}</td>
                        <td>${promocao.hotel.cidade}</td>
                        <td>${promocao.promocao.preco} R$</td>
                        <td>${promocao.promocao.dataInicial}</td>
                        <td>${promocao.promocao.dataFinal}</td>
                        <td>${promocao.site.nome}</td>
                        <td>${promocao.site.telefoneMascara}</td>
                        <td>${promocao.site.url}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>