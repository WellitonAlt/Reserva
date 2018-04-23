<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TreisVaga</title>
        
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <link type="text/css" rel="stylesheet" href="css/estilo.css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body>
        div class="container">
            <nav>
              <div class="nav-wrapper indigo">
                <a href="#" class="brand-logo"><img class="materialboxed" width="280" src="img/TreisVaGa.png" ></a>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li><a href="index.jsp">Página Inicial</a></li>
                    <li><a href="javascript:history.go(-1)">Voltar</a></li>
                    <li><a href="login.jsp">Sair</a></li>
                </ul>
              </div>
            </nav>
        </div>
        
        <div class="container">
            <center>
                <h4> Lista de Promoções</h4>
            </center>
        </div>
        
        <div class="container">  
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
        </div>
    </body>
</html>