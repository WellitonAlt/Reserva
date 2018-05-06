
package reserva.servlets;

import reserva.dao.SiteDAO;
import reserva.Site;
import reserva.Hotel;
import reserva.dao.HotelDAO;
import java.io.IOException;
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
import reserva.dao.ErroDAO;



@WebServlet(name = "CadastroPromocaoServlet", urlPatterns = {"/CadastroPromocaoServlet"})
public class CadastroPromocaoServlet extends HttpServlet {

   @Resource(name = "jdbc/ReservaDBLocal")
    DataSource dataSource;
   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        SiteDAO siteDao = new SiteDAO(dataSource);
   
        List<Site> sites = null;
        try {
            sites = siteDao.listarTodasSites();
            if (sites != null) {
                request.setAttribute("sites", sites);                
                request.getRequestDispatcher("cadastroPromocao.jsp").forward(request, response);
            }            
        } catch (IOException | SQLException | NamingException | ServletException e) {
            String mensagem = e.getLocalizedMessage();
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
