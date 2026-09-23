package sio.la2028.database;

import sio.la2028.model.Athlete;
import sio.la2028.model.Epreuve;
import sio.la2028.model.Sport;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DaoEpreuve {
    private static Epreuve e;
    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;

    public static ArrayList<Epreuve> getLesEpreuves(Connection cnx){

        ArrayList<Epreuve> lesEpreuves = new ArrayList<Epreuve>();
        try{
            requeteSql = cnx.prepareStatement("select e.id as e_id, e.libelle as e_libelle, s.id as s_id, s.libelle as s_libelle" +
                    " from epreuve e inner join sport s " +
                    " on e.sport_id = s.id "
            );
            //System.out.println("REQ="+ requeteSql);
            resultatRequete = requeteSql.executeQuery();

            while (resultatRequete.next()){

                Epreuve e = new Epreuve();
                e.setId(resultatRequete.getInt("e_id"));
                e.setLibelle(resultatRequete.getString("e_libelle"));

                Sport s = new Sport();
                s.setId(resultatRequete.getInt("s_id"));
                s.setLibelle(resultatRequete.getString("s_libelle"));

                e.setSport(s);

                lesEpreuves.add(e);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLesPompiers e généré une erreur");
        }
        return lesEpreuves;
    }

    public static Epreuve getEpreuveById(Connection cnx, int idEpreuve){

        Epreuve e = new Epreuve();
        try{
            requeteSql = cnx.prepareStatement("select e.id as e_id, e.libelle as e_libelle, s.id as s_id, s.libelle as s_libelle" +
                    " from epreuve a inner join sport s " +
                    " on e.sport_id = s.id " +
                    " where e.id = ? "
            );
            //System.out.println("REQ="+ requeteSql);
            requeteSql.setInt(1, idEpreuve);
            resultatRequete = requeteSql.executeQuery();

            if (resultatRequete.next()){

                e.setId(resultatRequete.getInt("e_id"));
                e.setLibelle(resultatRequete.getString("e_libelle"));

                Sport s = new Sport();
                s.setId(resultatRequete.getInt("s_id"));
                s.setLibelle(resultatRequete.getString("s_libelle"));

                e.setSport(s);

            }

        }
        catch (SQLException ex){
            ex.printStackTrace();
            System.out.println("La requête de getLesPompiers e généré une erreur");
        }
        return e;
    }

    public static Epreuve addEpreuve(Connection connection, Epreuve ath){
        int idGenere = -1;
        try
        {
            //preparation de la requete
            // id (clé primaire de la table athlete) est en auto_increment,donc on ne renseigne pas cette valeur
            // la paramètre RETURN_GENERATED_KEYS est ajouté à la requête afin de pouvoir récupérer l'id généré par la bdd (voir ci-dessous)
            // supprimer ce paramètre en cas de requête sans auto_increment.
            requeteSql=connection.prepareStatement("INSERT INTO epreuve (libelle, sport_id)\n" +
                    "VALUES (?,?)", requeteSql.RETURN_GENERATED_KEYS );
            requeteSql.setString(1, ath.getLibelle());
            requeteSql.setInt(2, ath.getSport().getId());

            /* Exécution de la requête */
            requeteSql.executeUpdate();

            // Récupération de id auto-généré par la bdd dans la table client
            resultatRequete = requeteSql.getGeneratedKeys();
            while ( resultatRequete.next() ) {
                idGenere = resultatRequete.getInt( 1 );
                ath.setId(idGenere);

                ath = DaoEpreuve.getEpreuveById(connection, ath.getId());
            }


        }
        catch (SQLException e)
        {
            e.printStackTrace();
            //out.println("Erreur lors de l’établissement de la connexion");
        }
        return ath ;
    }

}
