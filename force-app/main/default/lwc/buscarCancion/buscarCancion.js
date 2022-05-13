import { LightningElement, track } from 'lwc';



export default class BuscarCancion extends LightningElement {
    @track artista;
    @track cancion;
    @track letra;
    

    hanldeArtistChange(event){
        this.artista = event.target.value;

    }
    hanldeCancionChange(event){
        this.cancion = event.target.value;
        
    }
    hanldeClick(event){
        //this.letra = this.artista+' '+this.cancion;
        //this.template.querySelector(".input")
        
    }



}