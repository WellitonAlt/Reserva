package reserva.servlets;

import reserva.Login;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        try{
           Login login = new Login();
           BeanUtils.populate(login, request.getParameterMap());
           request.getSession().setAttribute("login", login);
           
           if (login.getTipo().equals("adm")){
               if(login.getUsuario().equals("root") && login.getSenha().equals("root")){
                    request.getRequestDispatcher("areaAdm.jsp").forward(request, response);
               }else{
                    String mensagem = "Usuario ou Senha de Administrador são Invalidos!!!";
                    request.setAttribute("mensagem", mensagem);
                    request.getRequestDispatcher("login.jsp").forward(request, response);
               }              
           }else{
               String mensagem = "ESSA MERDA NAO FUNCIONA AINDA";
               request.setAttribute("mensagem", mensagem);
               request.getRequestDispatcher("login.jsp").forward(request, response);
           }
           
               
        }catch (Exception ex) {
            request.setAttribute("mensagem", ex.getLocalizedMessage());
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