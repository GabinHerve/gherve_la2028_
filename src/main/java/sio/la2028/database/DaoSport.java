package sio.la2028.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import sio.la2028.model.Athlete;
import sio.la2028.model.Pays;
import sio.la2028.model.Sport;

public class DaoSport {

    Connection cnx;
    static PreparedStatement requeteSql = null;
    static ResultSet resultatRequete = null;

    public static ArrayList<Sport> getLesSports(Connection cnx){

        ArrayList<Sport> lesSports = new ArrayList<Sport>();
        try{
            requeteSql = cnx.prepareStatement("select * from sport");
            //System.out.println("REQ="+ requeteSql);
            resultatRequete = requeteSql.executeQuery();

            while (resultatRequete.next()){

                Sport s = new Sport();
                s.setId(resultatRequete.getInt("id"));
                s.setLibelle(resultatRequete.getString("libelle"));

                lesSports.add(s);
            }

        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getLespayss e généré une erreur");
        }
        return lesSports;

    }

    public static Sport getSportById(Connection cnx, int idSport){

        Sport s = new Sport();
        try{
            requeteSql = cnx.prepareStatement("select s.id as s_id, s.libelle as s_libelle" +
                    " from sport s "+
                    " where s.id = ?"
            );
            //System.out.println("REQ="+ requeteSql);
            requeteSql.setInt(1, idSport);
            resultatRequete = requeteSql.executeQuery();

            if (resultatRequete.next()){

                s.setId(resultatRequete.getInt("s_id"));
                s.setLibelle(resultatRequete.getString("s_libelle"));

            }

        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête de getSportById a généré une erreur");
        }
        return s;
    }

    public static ArrayList<Athlete> getLesAthletesBySport(Connection cnx, int idSport){
        ArrayList<Athlete> lesAthletes = new ArrayList<Athlete>();
        try{
            requeteSql = cnx.prepareStatement("select a.id as a_id, a.nom as a_nom, a.prenom as a_prenom, p.id as p_id, p.nom as p_nom, a.date as a_date, s.id as s_id, s.libelle as s_libelle" +
                    " from athlete a inner join pays p " +
                    " on a.pays_id = p.id " +
                    " inner join sport s " +
                    " on a.sport_id = s.id " +
                    " where s.id = ?"
            );
            requeteSql.setInt(1, idSport);
            resultatRequete = requeteSql.executeQuery();

            while (resultatRequete.next()){
                Athlete a = new Athlete();
                a.setId(resultatRequete.getInt("a_id"));
                a.setNom(resultatRequete.getString("a_nom"));
                a.setPrenom(resultatRequete.getString("a_prenom"));
                a.setDate(LocalDate.parse(resultatRequete.getString("a_date")));

                Pays p = new Pays();
                p.setId(resultatRequete.getInt("p_id"));
                p.setNom(resultatRequete.getString("p_nom"));
                a.setPays(p);

                Sport sp = new Sport();
                sp.setId(resultatRequete.getInt("s_id"));
                sp.setLibelle(resultatRequete.getString("s_libelle"));
                a.setSport(sp);

                lesAthletes.add(a);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
            System.out.println("La requête getLesAthletesBySport a généré une erreur");
        }
        return lesAthletes;
    }

}