package sio.la2028.servlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sio.la2028.database.DaoEpreuve;
import sio.la2028.database.DaoPays;
import sio.la2028.database.DaoSport;
import sio.la2028.model.Epreuve;
import sio.la2028.model.Pays;
import sio.la2028.model.Sport;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ServletEpreuve extends HttpServlet {

    Connection cnx ;

    @Override
    public void init()
    {
        ServletContext servletContext=getServletContext();

        System.out.println("SERVLET CONTEXT=" + servletContext.getContextPath());
        cnx = (Connection)servletContext.getAttribute("connection");

        try {
            System.out.println("INIT SERVLET=" + cnx.getSchema());
        } catch (SQLException ex) {
            Logger.getLogger(ServletEpreuve.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ServletEpreuve</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ServletEpreuve at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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

        String url = request.getRequestURI();

        // Récup et affichage les epreuves
        if(url.equals("/la2028/ServletEpreuve/listerEpreuve"))
        {
            ArrayList<Epreuve> lesEpreuves = DaoEpreuve.getLesEpreuves(cnx);
            request.setAttribute("pLesEpreuves", lesEpreuves);
            //System.out.println("lister eleves - nombres d'élèves récupérés" + lesEleves.size() );
            getServletContext().getRequestDispatcher("/vues/athlete/listerEpreuve.jsp").forward(request, response);
        }

        if(url.equals("/la2028/ServletEpreuve/consulter"))
        {
            int idEpreuve = Integer.parseInt((String)request.getParameter("idEpreuve"));
            Epreuve e = DaoEpreuve.getEpreuveById(cnx, idEpreuve);
            request.setAttribute("pEpreuve", e);
            //System.out.println("lister eleves - nombres d'élèves récupérés" + lesEleves.size() );
            getServletContext().getRequestDispatcher("/vues/athlete/consulterEpreuve.jsp").forward(request, response);
        }

        if(url.equals("/la2028/ServletEpreuve/ajouter"))
        {
            ArrayList<Sport> lesSports = DaoSport.getLesSports(cnx);
            request.setAttribute("pLesSports", lesSports);
            this.getServletContext().getRequestDispatcher("/vues/athlete/ajouterEpreuve.jsp" ).forward( request, response );
        }

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
