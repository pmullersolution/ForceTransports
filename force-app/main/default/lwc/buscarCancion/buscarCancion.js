import { LightningElement, track } from 'lwc';

export default class BuscarCancion extends LightningElement {
    @track artista;
    @track cancion;
    @track letra;

    handleArtistaChange(event) {
        this.artista = event.target.value;
    }

    handleCancionChange(event) {
        this.cancion = event.target.value;
    }

    handleClick(event) {
        this.letra = this.artista + ' ' + this.cancion;
    }

}