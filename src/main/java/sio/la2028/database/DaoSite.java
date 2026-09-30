package sio.la2028.database;

import sio.la2028.model.Site;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DaoSite {

    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;

    public static ArrayList<Site> getLesSites(Connection cnx){

        ArrayList<Site> lesSites = new ArrayList<Site>();
        try{
            requeteSql = cnx.prepareStatement("select * from site");
            resultatRequete = requeteSql.executeQuery();

            while (resultatRequete.next()){

                Site s = new Site();
                s.setId(resultatRequete.getInt("id"));
                s.setNom(resultatRequete.getString("nom"));

                lesSites.add(s);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLesSites a généré une erreur");
        }
        return lesSites;
    }

    public static Site getSiteById(Connection cnx, int idSite){

        Site s = new Site();
        try{
            requeteSql = cnx.prepareStatement("select s.id as s_id, s.nom as s_nom" +
                    " from site s " +
                    " where s.id = ?"
            );
            requeteSql.setInt(1, idSite);
            resultatRequete = requeteSql.executeQuery();

            if (resultatRequete.next()){

                s.setId(resultatRequete.getInt("s_id"));
                s.setNom(resultatRequete.getString("s_nom"));

            }

        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getSiteById a généré une erreur");
        }
        return s;
    }

    public static Site addSite(Connection cnx, Site site){
        int idGenere = -1;
        try
        {
            requeteSql = cnx.prepareStatement("INSERT INTO site (nom) VALUES (?)",
                    PreparedStatement.RETURN_GENERATED_KEYS);
            requeteSql.setString(1, site.getNom());

            requeteSql.executeUpdate();

            resultatRequete = requeteSql.getGeneratedKeys();
            while ( resultatRequete.next() ) {
                idGenere = resultatRequete.getInt( 1 );
                site.setId(idGenere);

                site = DaoSite.getSiteById(cnx, site.getId());
            }

        }
        catch (SQLException e)
        {
            e.printStackTrace();
            System.out.println("La requête d'ajout de site a généré une erreur");
        }
        return site;
    }

}