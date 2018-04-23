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
                    <li><a href="index.jsp">Página Inicial</a></li>
                    <li><a href="ListaHoteisServlet?cidade=">Ver Hotéis</a></li>
                </ul>
              </div>
            </nav>
        </div>
        <div class="container">
            <center>
                <h4>Login</h4>
                <c:if test="${!empty requestScope.mensagem}">
                    <ul class="erro">
                        <li>${mensagem}</li>
                    </ul>
                </c:if>
            </center>
        </div>
        
    <center>
        <div class="container center">
            <form class="col s6" action="LoginServlet" method="post">
              <div class="row">
                  <label>
                     <input type="radio" name="tipo" value="adm" checked>
                     <span>Administrador</span>
                  </label>              
                  <label>
                      <input type="radio" name="tipo" value="hotel"> 
                    <span>Hotel </span>
                  </label>
                  <label>
                    <input type="radio" name="tipo" value="site" >
                    <span>Site</span>
                  </label>
              </div>
              <div class="row">
                <div class="input-field col s6">
                   <input name="usuario" type="text" value="${sessionScope.login.usuario}" />
                  <label for="usuario">Usuário</label>
                </div>
                <div class="input-field col s6">
                  <input name="senha" type="password" value="" />
                  <label for="senha">Senha</label>
                </div>
              </div>
              <div class="row">
                  <a class="waves-effect waves-light btn indigo">
                       <input type="submit" value="Login"/>
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
