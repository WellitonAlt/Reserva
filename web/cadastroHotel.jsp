

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TreisVaga</title>
        
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    </head>
    <body>
        <div class="container">
            <nav>
              <div class="nav-wrapper indigo">
                <a href="#" class="brand-logo"><img class="materialboxed" width="280" src="img/TreisVaGa.png" ></a>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li><a href="index.jsp">Pagina Inicial</a></li>
                    <li><a href="areaAdm.jsp">Area de Administrador</a></li>
                    <li><a href="login.jsp">Sair</a></li> 
                </ul>
              </div>
            </nav>
        </div>
        <div class="container">
            <h4>Cadastro Hotel</h4>
            <c:if test="${!empty requestScope.mensagens}">
                <ul class="erro">
                    <c:forEach items="${requestScope.mensagens}" var="mensagem">
                        <li>${mensagem}</li>
                    </c:forEach>
                </ul>
            </c:if>
        </div>
        <center>
        <div class="container center">
            <form class="col s6" action="GravarHotelServlet" method="post">
              <div class="row">
                <div class="input-field col s6">
                  <input name="cnpj" type="text" value="${sessionScope.Hotel.CNPJ}">
                  <label for="cnpj">CNPJ</label>
                </div>
                <div class="input-field col s6">
                  <input name="senha" type="text" type="password" value="" >
                  <label for="senha">Senha</label>
                </div>
              </div>
              <div class="row">
                <div class="input-field col s6">
                   <input name="nome" type="text" value= "${sessionScope.Hotel.nome}" />  
                  <label for="nome">Nome</label>
                </div>
                <div class="input-field col s6">
                  <input name="cidade" type="text" value="${sessionScope.Hotel.cidade}" /> 
                  <label for="cidade">Cidade</label>
                </div>
              </div>
              <div class="row">
                  <a class="waves-effect waves-light btn indigo">
                      <input type="submit" value="Cadastrar"/>
                  </a>
              </div>
            </form>
        </div>
        </center>
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

