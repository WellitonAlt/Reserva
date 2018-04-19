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
        <a href="areaAdm.jsp">Area de Administrador</a><br/>
        <a href="login.jsp">Sair</a><br/>        
        <hr>
        <c:if test="${!empty requestScope.mensagens}">
            <ul class="erro">
                <c:forEach items="${requestScope.mensagens}" var="mensagem">
                    <li>${mensagem}</li>
                </c:forEach>
            </ul>
        </c:if>
        <form action="GravarSiteServlet" method="post">
            Digite os dados do Site de Resserva:<br/><br/>
            URL: <input name="url" type="text" value="${sessionScope.Site.url}"/><br/>
            Senha: <input name="senha" type="password" value="" /><br/>
            Nome: <input name="nome" type="text" value="${sessionScope.Site.nome}" /><br/>
            Telefone: <input name="telefone" type="text" value="${sessionScope.Site.Telefone}" /><br/>            
            <input type="submit" value="Cadastrar"/>
        </form>
    </body>
</html>
