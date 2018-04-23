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
              <div class="nav-wrapper blue">
                <a href="#" class="brand-logo">TreisVagas</a>
                <ul id="nav-mobile" class="right hide-on-med-and-down">
                    <li><a href="cadastroSite.jsp">Cadastro Site de Reserva</a></li>         
                    <li><a href="cadastroHotel.jsp">Cadastro Hotel</a></li>
                    <li><a href="index.jsp">Sair</a></li>         
                </ul>
              </div>
            </nav>
        </div>
        <div class="container">
            <h4>Area de Administração - root</h4>
            <center>
                <img class="materialboxed" width="650" src="img/adm.jpg" >  <br/>
            </center>
        </div>
        <div class="container">
        <footer class="page-footer blue">
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

