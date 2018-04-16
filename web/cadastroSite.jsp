<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TreisVaga</title>   
    </head>
    <body>
        <c:if test="${!empty requestScope.mensagens}">
            <ul class="erro">
                <c:forEach items="${requestScope.mensagens}" var="mensagem">
                    <li>${mensagem}</li>
                </c:forEach>
            </ul>
        </c:if>
        
        private String url, CNPJ;
    private float preço;
    private Date dataInicial, dataFinal;
    private Hotel hotel;

        <form action="" method="post">
            Digite os dados do Site de Resserva:<br/>
            CNPJ: <input name="cnpj" type="text" value="${sessionScope.novoSite.cnpj}" /><br/>
            url: <input name="url" type="text" value="${sessionScope.novoSite.url}" /><br/>
            preço: <input name="preco" type="text" value="${sessionScope.novoSite.preco}" /><br/>
            Data de nascimento: <input name="dataDeNascimento" type="text" value="${sessionScope.novoPalpite.dataDeNascimento}" /><br/>
            Campeão: <input name="campeao" type="text" value="${sessionScope.novoPalpite.campeao}" /><br/>
            Vice: <input name="vice" type="text" value="${sessionScope.novoPalpite.vice}" /><br/>
            <input type="submit" value="Enviar"/>
        </form>
    </body>
</html>
