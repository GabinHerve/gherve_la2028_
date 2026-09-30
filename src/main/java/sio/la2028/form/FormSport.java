package sio.la2028.form;

import jakarta.servlet.http.HttpServletRequest;

import java.util.HashMap;
import java.util.Map;
import sio.la2028.model.Sport;

public class FormSport {

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
            throw new Exception( "Le libellé du sport doit contenir au moins 3 caractères." );
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

    public Sport ajouterSport( HttpServletRequest request ) {

        Sport sport = new Sport();

        String libelle = getDataForm( request, "libelle" );

        try {
            validationLibelle( libelle );
        } catch ( Exception e ) {
            setErreur( "libelle", e.getMessage() );
        }
        sport.setLibelle(libelle);

        if ( erreurs.isEmpty() ) {
            resultat = "Succès de l'ajout.";
        } else {
            resultat = "Échec de l'ajout.";
        }

        return sport;
    }

}