package reserva.servlets;

import reserva.Site;
import reserva.dao.SiteDAO;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;
import javax.annotation.Resource;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import org.apache.commons.beanutils.BeanUtils;
import reserva.dao.ErroDAO;

@WebServlet(name = "GravarSiteServlet", urlPatterns = {"/GravarSiteServlet"})
public class GravarSiteServlet extends HttpServlet {
        
    @Resource(name = "jdbc/ReservaDBLocal")
    DataSource dataSource;
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Site site = new Site();     
        SiteDAO siteDao = new SiteDAO(dataSource);
        
        
        try {
            BeanUtils.populate(site, request.getParameterMap());
            request.getSession().setAttribute("site", site);
            List<String> mensagens = site.validar();
           
            if(mensagens == null) {
                siteDao.gravarSite(site);
                String mem = "Dados Salvos: <br/>";
                mem = mem + "URL: " + site.getUrl() + "<br/>";
                mem = mem + "Senha: **** <br/>";
                mem = mem + "Nome: " + site.getNome() + "<br/>";
                mem = mem + "Telefone: " + String.valueOf(site.getTelefoneMascara()) + "<br/>";
                request.setAttribute("salvou", mem);
                request.getRequestDispatcher("cadastroSite.jsp").forward(request, response);
            } else {
                request.setAttribute("mensagens", mensagens);
                request.getRequestDispatcher("cadastroSite.jsp").forward(request, response);
            }
            
            
        } catch (NullPointerException | IOException | IllegalAccessException | InvocationTargetException | SQLException | NamingException | ServletException ex) {
            String mensagem = ex.getLocalizedMessage();
            if (mensagem == null)
                mensagem = "Referência inexistente";
            ErroDAO erro = new ErroDAO(dataSource, mensagem);
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("erro.jsp").forward(request, response);
        }

    
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
