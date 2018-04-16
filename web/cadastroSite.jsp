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
        private String url, senha, nome, telefone;    
        
        <form action="" method="post">
            Digite os dados do Site de Resserva:<br/>
            URL: <input name="url" type="text" value="${sessionScope.Site.url}" /><br/>
            Senha: <input name="senha" type="password" value="" /><br/>
            preço: <input name="preco" type="text" value="${sessionScope.novoSite.preco}" /><br/>
            Data de nascimento: <input name="dataDeNascimento" type="text" value="${sessionScope.novoPalpite.dataDeNascimento}" /><br/>
            Campeão: <input name="campeao" type="text" value="${sessionScope.novoPalpite.campeao}" /><br/>
            Vice: <input name="vice" type="text" value="${sessionScope.novoPalpite.vice}" /><br/>
            <input type="submit" value="Enviar"/>
        </form>
    </body>
</html>
