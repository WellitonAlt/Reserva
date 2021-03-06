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
        <c:if test="${empty adm}" >
          <c:redirect url="index.jsp"/>  
        </c:if>        
        <div class="container">
            <nav>
              <div class="nav-wrapper indigo">
                <a href="#" class="brand-logo"><img class="materialboxed" width="280" src="img/TreisVaGa.png" ></a>
                <ul id="nav-mobile" class="right hide-on-med-and-down">      
                    <li><a href="areaAdm.jsp?adm=root">Área de Administrador</a></li>
                    <li><a href="login.jsp">Sair</a></li>
                </ul>
              </div>
            </nav>
        </div>
        <div class="container">
            <center>
                <h4>Cadastro de Site</h4>
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
            <form class="col s6" action="GravarSiteServlet" method="post">
              <div class="row">
                <div class="input-field col s6">
                  <input name="url" type="text" value="${sessionScope.Site.url}">
                  <label for="url">URL</label>
                </div>
                <div class="input-field col s6">
                  <input name="senha" type="password" value="" />
                  <label for="senha">Senha</label>
                </div>
              </div>
              <div class="row">
                <div class="input-field col s6">
                   <input name="nome" type="text" value= "${sessionScope.Site.nome}" >  
                  <label for="nome">Nome</label>
                </div>
                <div class="input-field col s6">
                  <input name="telefone" type="text" value="${sessionScope.Site.Telefone}" > 
                  <label for="telefone">Telefone</label>
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
