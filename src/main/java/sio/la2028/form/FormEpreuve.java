package sio.la2028.form;

import jakarta.servlet.http.HttpServletRequest;

import java.util.HashMap;
import java.util.Map;
import sio.la2028.model.Epreuve;
import sio.la2028.model.Sport;

public class FormEpreuve {

    private String resultat;
    private Map<String, String> erreurs = new HashMap<String, String>();

    public String getResultat() {
        return resultat;
    }

    public void setResultat(String resultat) {
        this.resultat = resultat;
    }

    public Map<String, String> getErreurs() {
        return erreurs;
    }

    public void setErreurs(Map<String, String> erreurs) {
        this.erreurs = erreurs;
    }

    private void validationLibelle( String libelle ) throws Exception {
        if ( libelle == null || libelle.length() < 3 ) {
            throw new Exception( "Le libellé de l'épreuve doit contenir au moins 3 caractères." );
        }
    }

    private void setErreur( String champ, String message ) {
        erreurs.put(champ, message );
    }

    private static String getDataForm( HttpServletRequest request, String nomChamp ) {
        String valeur = request.getParameter( nomChamp );
        if ( valeur == null || valeur.trim().length() == 0 ) {
            return null;
        } else {
            return valeur.trim();
        }
    }

    public Epreuve ajouterEpreuve( HttpServletRequest request ) {

        Epreuve epreuve = new Epreuve();

        String libelle = getDataForm( request, "libelle" );
        int idSport = Integer.parseInt((String)getDataForm( request, "idSport" ));

        try {
            validationLibelle( libelle );
        } catch ( Exception e ) {
            setErreur( "libelle", e.getMessage() );
        }
        epreuve.setLibelle(libelle);

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }

        Sport s = new Sport(idSport);
        epreuve.setSport(s);

        return epreuve ;
    }

}