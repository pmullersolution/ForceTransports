import { LightningElement, track } from 'lwc';
import fetchDataHelper from './fetchDataHelper';

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

    async handleClick(event) {
        const data = await fetchDataHelper(this.artista, this.cancion);
        this.letra = JSON.stringify(data.lyrics);
        debugger;
    }

}