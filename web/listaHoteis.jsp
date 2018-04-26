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
                    <li><a href="index.jsp">Pagina Inicial</a></li>
                    <li><a href="login.jsp">Login</a><br/></li>
                </ul>
              </div>
            </nav>
        </div>
        
        <div class="container">
            <h4>Lista de Hotéis</h4>             
            <form class="col s4" action="ListaHoteisServlet" method="post">
              <div class="row">
                <div class="input-field col s4">
                  <input name="cidade" type="text" value="" />
                  <label for="cidade">Cidade</label>
                </div>
                <div class="input-field col s4">
                  <a class="waves-effect waves-light btn indigo">
                      <input type="submit" value="Buscar"/>
                  </a>
                </div>
              </div>
            </form>          
        </div>
     
            
        <div class="container">
            <c:if test="${empty requestScope.hoteis}">
                <h5> Não há Hoteis! </h5>
            </c:if>
            <c:if test="${!empty requestScope.hoteis}">        
                <table>
                    <tr>                  
                        <th>Hotel</th>
                        <th>CNPJ</th>
                        <th>Cidade</th>
                    </tr>
                    <c:forEach items="${requestScope.hoteis}" var="hotel">
                        <tr>
                            <td>${hotel.nome}</td>
                            <td>${hotel.CNPJMascara}</td>
                            <td>${hotel.cidade}</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
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

