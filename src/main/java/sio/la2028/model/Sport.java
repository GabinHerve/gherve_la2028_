package sio.la2028.model;

import java.util.ArrayList;

public class Sport {

    private int id;
    private String libelle ;
    private ArrayList<Athlete> lesAthletes ;
    private ArrayList<Epreuve> lesEpreuves ;

    public Sport() {
    }

    public Sport(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLibelle() {
        return libelle;
    }

    public void setLibelle(String libelle) {
        this.libelle = libelle;
    }

    public ArrayList<Athlete> getLesAthletes() {
        return lesAthletes;
    }

    public void setLesAthletes(ArrayList<Athlete> lesAthletes) {
        this.lesAthletes = lesAthletes;
    }

    public void addAthlete(Athlete a){

        if (lesAthletes == null){
            lesAthletes = new ArrayList<Athlete>();
        }
        lesAthletes.add(a);
    }

    public ArrayList<Epreuve> getLesEpreuves() {
        return lesEpreuves;
    }

    public void setLesEpreuves(ArrayList<Epreuve> lesEpreuves) {
        this.lesEpreuves = lesEpreuves;
    }

    public void addEpreuve(Epreuve e){

        if (lesEpreuves == null){
            lesEpreuves = new ArrayList<Epreuve>();
        }
        lesEpreuves.add(e);
    }

}

