package reserva.servlets;

import reserva.dao.HotelDAO;
import reserva.Hotel;
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


@WebServlet(name = "ListaHoteisServlet", urlPatterns = {"/ListaHoteisServlet"})
public class ListaHoteisServlet extends HttpServlet {
    
    @Resource(name = "jdbc/ReservaDBLocal")
    DataSource dataSource;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HotelDAO hotelDAO = new HotelDAO(dataSource);
        
        String cidade = request.getParameter("cidade");
        //System.out.print(cidade);
        List<Hotel> hoteis = null;
        try {
            if (cidade == null) {
                hoteis = hotelDAO.listarTodasHoteisByCidade("");
            } else {
                hoteis = hotelDAO.listarTodasHoteisByCidade(cidade);
            }
            
            request.setAttribute("hoteis", hoteis);
            request.getRequestDispatcher("listaHoteis.jsp").forward(request, response);
        } catch (IOException | SQLException | NamingException | ServletException e) {
            request.setAttribute("mensagem", e.getLocalizedMessage());
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
