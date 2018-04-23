

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TreisVaga</title>    
    </head>
    <body>
        <h1>Cadastro de Hotéis</h1>
        <h3>Menu:</h3>
        <a href="index.jsp">Página Inicial</a><br/>
        <a href="areaAdm.jsp">Área de Administrador</a><br/>
        <a href="login.jsp">Sair</a><br/> 
        <hr>
        <c:if test="${!empty requestScope.mensagens}">
            <ul class="erro">
                <c:forEach items="${requestScope.mensagens}" var="mensagem">
                    <li>${mensagem}</li>
                </c:forEach>
            </ul>
        </c:if>
        <form action="GravarHotelServlet" method="post">
            CNPJ:<input name="cnpj" type="text" value="${sessionScope.Hotel.CNPJ}" /> <br />
            Senha:<input name="senha" type="password" value="" />  <br />
            Nome:<input name="nome" type="text" value= "${sessionScope.Hotel.nome}" />  <br />
            Cidade:<input name="cidade" type="text" value="${sessionScope.Hotel.cidade}" />  <br />
            <input type="submit" value="Cadastrar"/>
        </form>
    </body>
</html>

