
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TreisVaga</title>    
    </head>
    <body>
        <h1>Promoção - ${requestScope.hotel.nome}</h1>
        <h3>Menu:</h3>
        <a href="index.jsp">Pagina Inicial</a><br/>
        <a href="javascript:history.go(-1)">Area de Hotel</a><br/>
        <a href="login.jsp">Sair</a><br/> 
        <hr>
        <c:if test="${!empty requestScope.mensagens}">
            <ul class="erro">
                <c:forEach items="${requestScope.mensagens}" var="mensagem">
                    <li>${mensagem}</li>
                </c:forEach>
            </ul>
        </c:if>
        
        <form action="GravarPromocaoServlet" method="post">
            Site:
            <select name="site">
                <c:forEach items="${requestScope.sites}" var="site">
                   <option value="${site.id}">${site.nome}</option>   
                </c:forEach>
            </select> <br />
            <input name="hotel" type="hidden" value="${requestScope.hotel.id}" />
            <input name="hotelNome" type="hidden" value="${requestScope.hotel.nome}" />
            Preço:<input name="preco" type="text" value="${sessionScope.Promocao.preco}" /> <br />
            Data Inicial:<input name="dataInicial" type="Date" value="${sessionScope.Promocao.dataInicial}" /> <br />
            Data Finnal:<input name="dataFinal" type="Date" value="${sessionScope.Promocao.dataFinal}" /> <br />
            <input type="submit" value="Cadastrar"/>
        </form>
    </body>
</html>

