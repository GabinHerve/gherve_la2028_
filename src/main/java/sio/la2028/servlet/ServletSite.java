package sio.la2028.servlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import sio.la2028.database.DaoSite;
import sio.la2028.model.Site;
import sio.la2028.form.FormSite;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

public class ServletSite extends HttpServlet {

    Connection cnx;

    @Override
    public void init()
    {
        ServletContext servletContext = getServletContext();
        cnx = (Connection) servletContext.getAttribute("connection");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = request.getRequestURI();

        if(url.equals(request.getContextPath() + "/ServletSite/listerSite"))
        {
            ArrayList<Site> lesSites = DaoSite.getLesSites(cnx);
            request.setAttribute("pLesSites", lesSites);
            getServletContext().getRequestDispatcher("/vues/athlete/listerSite.jsp").forward(request, response);
        }

        if(url.equals(request.getContextPath() + "/ServletSite/consulter"))
        {
            int idSite = Integer.parseInt(request.getParameter("idSite"));
            Site s = DaoSite.getSiteById(cnx, idSite);
            request.setAttribute("pSite", s);
            getServletContext().getRequestDispatcher("/vues/athlete/consulterSite.jsp").forward(request, response);
        }

        if(url.equals(request.getContextPath() + "/ServletSite/ajouter"))
        {
            getServletContext().getRequestDispatcher("/vues/athlete/ajouterSite.jsp").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        FormSite form = new FormSite();

        Site site = form.ajouterSite(request);

        request.setAttribute( "form", form );
        request.setAttribute( "pSite", site );

        if (form.getErreurs().isEmpty()){
            Site siteInsere = DaoSite.addSite(cnx, site);
            request.setAttribute( "pSite", siteInsere );
            this.getServletContext().getRequestDispatcher("/vues/athlete/consulterSite.jsp" ).forward( request, response );
        }
        else
        {
            this.getServletContext().getRequestDispatcher("/vues/athlete/ajouterSite.jsp" ).forward( request, response );
        }

    }


}