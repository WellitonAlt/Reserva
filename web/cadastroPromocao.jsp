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
        <div class="container">
            <nav>
              <div class="nav-wrapper indigo">
                <a href="#" class="brand-logo"><img class="materialboxed" width="280" src="img/TreisVaGa.png" ></a>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li><a href="Login">Área de Hotel</a></li>
                    <li><a href="login.jsp">Sair</a></li>
                </ul>
              </div>
            </nav>
        </div>
        <div class="container">
            <center>
                <h4>Cadastro Promoção</h4>
                <c:if test="${!empty requestScope.mensagens}">
                    <ul class="erro">
                        <c:forEach items="${requestScope.mensagens}" var="mensagem">
                            <li>${mensagem}</li>
                        </c:forEach>
                    </ul>
                </c:if>
                <c:if test="${!empty requestScope.salvou}">
                    <ul class="salvou">
                        <c:forEach items="${requestScope.salvou}" var="mensagem">
                            <li>${mensagem}</li>
                        </c:forEach>
                    </ul>
                </c:if>
            </center>
        </div>
        
        <div class="container center">
            <center>
            <form class="col s6" action="GravarPromocaoServlet" method="post">
              <div class="row">  
                <div class="input-field col s1">
                   <label for="site">Site</label>                 
                </div>  
                <div class="input-field col s6">                
                  <select class="browser-default" name="site">
                    <c:forEach items="${requestScope.sites}" var="site">
                        <option value="${site.id}">${site.nome}</option>   
                    </c:forEach>
                  </select>
                </div>
                <div class="input-field col s4">
                  <input name="hotel" type="text" value="${requestScope.hotel.id}" />
                  <input name="hotelNome" type="text" value="${requestScope.hotel.nome}" />
                  <div class="input-field col s6">
                    <input name="preco" type="text" value="${sessionScope.Promocao.preco}" /> 
                    <label for="preco">Preço</label>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="input-field col s6">
                    <input name="dataInicial" type="Date" value="${sessionScope.Promocao.dataInicial}" />
                    <label for="dataInicial">Data Inicial</label>
                </div>
                <div class="input-field col s6">
                    <input name="dataFinal" type="Date" value="${sessionScope.Promocao.dataFinal}" />
                    <label for="dataFinal">Data Final</label>
                </div>
              </div>
              <div class="row">
                  <a class="waves-effect waves-light btn indigo">
                      <input type="submit" value="Cadastrar"/>
                  </a>
              </div>
            </form>
            </center>
        </div>
                    
        <div class="container">
            <footer class="page-footer indigo">
              <div class="footer-copyright">
                <div class="container">
                   <center>
                        Criado com <i>Feijões em rede</i><br>Movido com <i>GatoTom</i>
                   </center>
                </div>
              </div>
            </footer>
        </div>
        <script type="text/javascript" src="js/materialize.min.js"></script>
    </body>
</html>

